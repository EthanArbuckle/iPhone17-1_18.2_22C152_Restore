@interface CLPIndoorWifiScan
- (BOOL)hasAge;
- (BOOL)hasBundleId;
- (BOOL)hasHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)mac;
- (double)age;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)channel;
- (int)hidden;
- (int)rssi;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(double)a3;
- (void)setBundleId:(id)a3;
- (void)setChannel:(int)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHidden:(int)a3;
- (void)setMac:(id)a3;
- (void)setRssi:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPIndoorWifiScan

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_mac) {
    -[CLPIndoorWifiScan writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  v4 = v5;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)setRssi:(int)a3
{
  self->_rssi = a3;
}

- (void)setMac:(id)a3
{
}

- (void)setHidden:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hidden = a3;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (void)setAge:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_age = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)setHasHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHidden
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPIndoorWifiScan;
  v4 = [(CLPIndoorWifiScan *)&v8 description];
  id v5 = [(CLPIndoorWifiScan *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  mac = self->_mac;
  if (mac) {
    [v3 setObject:mac forKey:@"mac"];
  }
  v6 = [NSNumber numberWithInt:self->_channel];
  [v3 setObject:v6 forKey:@"channel"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_hidden];
    [v3 setObject:v7 forKey:@"hidden"];
  }
  objc_super v8 = [NSNumber numberWithInt:self->_rssi];
  [v3 setObject:v8 forKey:@"rssi"];

  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_age];
    [v3 setObject:v9 forKey:@"age"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPIndoorWifiScanReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  v5[2] = *(void *)&self->_timestamp;
  [v5 setMac:self->_mac];
  v4 = v5;
  *((_DWORD *)v5 + 8) = self->_channel;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 9) = self->_hidden;
    *((unsigned char *)v5 + 52) |= 2u;
  }
  *((_DWORD *)v5 + 12) = self->_rssi;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_age;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v5, "setBundleId:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 16) = self->_timestamp;
  uint64_t v6 = [(NSString *)self->_mac copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 32) = self->_channel;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_hidden;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  *(_DWORD *)(v5 + 48) = self->_rssi;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_age;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (self->_timestamp != *((double *)v4 + 2)) {
    goto LABEL_19;
  }
  mac = self->_mac;
  if ((unint64_t)mac | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mac, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (self->_channel != *((_DWORD *)v4 + 8)) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_hidden != *((_DWORD *)v4 + 9)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (self->_rssi != *((_DWORD *)v4 + 12))
  {
LABEL_19:
    char v7 = 0;
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_19;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](bundleId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  NSUInteger v12 = [(NSString *)self->_mac hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_hidden;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t channel = self->_channel;
  uint64_t rssi = self->_rssi;
  if (*(unsigned char *)&self->_has)
  {
    double age = self->_age;
    double v18 = -age;
    if (age >= 0.0) {
      double v18 = self->_age;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v12 ^ v11 ^ (2654435761 * channel) ^ v13 ^ (2654435761 * rssi) ^ v16 ^ [(NSString *)self->_bundleId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_double timestamp = *((double *)v4 + 2);
  id v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[CLPIndoorWifiScan setMac:](self, "setMac:");
    id v4 = v5;
  }
  self->_uint64_t channel = *((_DWORD *)v4 + 8);
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_hidden = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 2u;
  }
  self->_uint64_t rssi = *((_DWORD *)v4 + 12);
  if (*((unsigned char *)v4 + 52))
  {
    self->_double age = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[CLPIndoorWifiScan setBundleId:](self, "setBundleId:");
    id v4 = v5;
  }
}

- (NSString)mac
{
  return self->_mac;
}

- (int)channel
{
  return self->_channel;
}

- (int)hidden
{
  return self->_hidden;
}

- (int)rssi
{
  return self->_rssi;
}

- (double)age
{
  return self->_age;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPIndoorWifiScan writeTo:]", "CLPCollectionRequest.gen.m", 11226, "nil != self->_mac");
}

@end