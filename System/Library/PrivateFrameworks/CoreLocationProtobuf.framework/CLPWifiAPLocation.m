@interface CLPWifiAPLocation
- (BOOL)hasAppBundleId;
- (BOOL)hasHidden;
- (BOOL)hasScanTimestamp;
- (BOOL)hasScanType;
- (BOOL)hasServerHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLocation)location;
- (NSString)appBundleId;
- (NSString)mac;
- (double)scanTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)scanTypeAsString:(int)a3;
- (int)StringAsScanType:(id)a3;
- (int)channel;
- (int)hidden;
- (int)rssi;
- (int)scanType;
- (int)serverHash;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setChannel:(int)a3;
- (void)setHasHidden:(BOOL)a3;
- (void)setHasScanTimestamp:(BOOL)a3;
- (void)setHasScanType:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setHidden:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMac:(id)a3;
- (void)setRssi:(int)a3;
- (void)setScanTimestamp:(double)a3;
- (void)setScanType:(int)a3;
- (void)setServerHash:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPWifiAPLocation

- (void)setHidden:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hidden = a3;
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

- (void)setScanTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_scanTimestamp = a3;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScanTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setServerHash:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_serverHash = a3;
}

- (void)setHasServerHash:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServerHash
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)scanType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_scanType;
  }
  else {
    return 0;
  }
}

- (void)setScanType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scanType = a3;
}

- (void)setHasScanType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScanType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)scanTypeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C360F0[a3];
  }

  return v3;
}

- (int)StringAsScanType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TwoGhzSet1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TwoGhzSet2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FiveGhzSet1"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FiveGhzSet2"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FiveGhzSet3"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Cached"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Channel"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Fast"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Stage1"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Stage2"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Normal"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CustomScan"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FiveGhzStage1"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"Max"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPWifiAPLocation;
  int v4 = [(CLPWifiAPLocation *)&v8 description];
  v5 = [(CLPWifiAPLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  mac = self->_mac;
  if (mac) {
    [v3 setObject:mac forKey:@"mac"];
  }
  v6 = [NSNumber numberWithInt:self->_channel];
  [v4 setObject:v6 forKey:@"channel"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_hidden];
    [v4 setObject:v7 forKey:@"hidden"];
  }
  objc_super v8 = [NSNumber numberWithInt:self->_rssi];
  [v4 setObject:v8 forKey:@"rssi"];

  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithDouble:self->_scanTimestamp];
    [v4 setObject:v9 forKey:@"scanTimestamp"];
  }
  location = self->_location;
  if (location)
  {
    v11 = [(CLPLocation *)location dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"location"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v4 setObject:appBundleId forKey:@"appBundleId"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_serverHash];
    [v4 setObject:v14 forKey:@"serverHash"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t scanType = self->_scanType;
    if (scanType >= 0xF)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_scanType);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E6C360F0[scanType];
    }
    [v4 setObject:v16 forKey:@"scanType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPWifiAPLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_mac) {
    -[CLPWifiAPLocation writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_location) {
    -[CLPWifiAPLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (self->_appBundleId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v6 = v7;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
LABEL_11:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setMac:self->_mac];
  *((_DWORD *)v5 + 6) = self->_channel;
  *((_DWORD *)v5 + 12) = self->_rssi;
  [v5 setLocation:self->_location];
  if (self->_appBundleId) {
    objc_msgSend(v5, "setAppBundleId:");
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_serverHash;
    *((unsigned char *)v5 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 7) = self->_hidden;
  *((unsigned char *)v5 + 60) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v5 + 1) = *(void *)&self->_scanTimestamp;
  *((unsigned char *)v5 + 60) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 13) = self->_scanType;
    *((unsigned char *)v5 + 60) |= 4u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mac copyWithZone:a3];
  id v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 24) = self->_channel;
  *(_DWORD *)(v5 + 48) = self->_rssi;
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_appBundleId copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_serverHash;
    *(unsigned char *)(v5 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 8) = self->_scanTimestamp;
      *(unsigned char *)(v5 + 60) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_hidden;
  *(unsigned char *)(v5 + 60) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 52) = self->_scanType;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  mac = self->_mac;
  if ((unint64_t)mac | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](mac, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (self->_channel != *((_DWORD *)v4 + 6)) {
    goto LABEL_29;
  }
  if (self->_rssi != *((_DWORD *)v4 + 12)) {
    goto LABEL_29;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:")) {
      goto LABEL_29;
    }
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_serverHash != *((_DWORD *)v4 + 14)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
LABEL_29:
    BOOL v8 = 0;
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_hidden != *((_DWORD *)v4 + 7)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_scanTimestamp != *((double *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_29;
  }
  BOOL v8 = (*((unsigned char *)v4 + 60) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_scanType != *((_DWORD *)v4 + 13)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mac hash];
  uint64_t channel = self->_channel;
  uint64_t rssi = self->_rssi;
  unint64_t v6 = [(CLPLocation *)self->_location hash];
  NSUInteger v7 = [(NSString *)self->_appBundleId hash];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v10 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v15 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = 2654435761 * self->_serverHash;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v10 = 2654435761 * self->_hidden;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double scanTimestamp = self->_scanTimestamp;
  double v12 = -scanTimestamp;
  if (scanTimestamp >= 0.0) {
    double v12 = self->_scanTimestamp;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_13:
  if ((has & 4) != 0) {
    uint64_t v16 = 2654435761 * self->_scanType;
  }
  else {
    uint64_t v16 = 0;
  }
  return (2654435761 * channel) ^ v3 ^ (2654435761 * rssi) ^ v6 ^ v7 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[CLPWifiAPLocation setMac:](self, "setMac:");
    id v4 = v8;
  }
  self->_uint64_t channel = *((_DWORD *)v4 + 6);
  self->_uint64_t rssi = *((_DWORD *)v4 + 12);
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 4);
  if (location)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[CLPWifiAPLocation setLocation:](self, "setLocation:");
  }
  id v4 = v8;
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[CLPWifiAPLocation setAppBundleId:](self, "setAppBundleId:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 60);
  if ((v7 & 8) != 0)
  {
    self->_serverHash = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 60);
    if ((v7 & 2) == 0)
    {
LABEL_13:
      if ((v7 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_hidden = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 60);
  if ((v7 & 1) == 0)
  {
LABEL_14:
    if ((v7 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  self->_double scanTimestamp = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_15:
    self->_uint64_t scanType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_16:

  MEMORY[0x1F41817F8]();
}

- (NSString)mac
{
  return self->_mac;
}

- (void)setMac:(id)a3
{
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_uint64_t channel = a3;
}

- (int)hidden
{
  return self->_hidden;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  self->_uint64_t rssi = a3;
}

- (double)scanTimestamp
{
  return self->_scanTimestamp;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mac, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPWifiAPLocation writeTo:]", "CLPCollectionRequest.gen.m", 35229, "nil != self->_mac");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPWifiAPLocation writeTo:]", "CLPCollectionRequest.gen.m", 35242, "self->_location != nil");
}

@end