@interface AWDProactiveAppPredictionLaunchesAtLocation
- (BOOL)hasBundleId;
- (BOOL)hasIsClip;
- (BOOL)hasIsNegativeSession;
- (BOOL)hasIsTourist;
- (BOOL)hasLatitude;
- (BOOL)hasLaunchReason;
- (BOOL)hasLocationAccuracy;
- (BOOL)hasLongitude;
- (BOOL)hasTimeBucket;
- (BOOL)hasTimestamp;
- (BOOL)hasUrlHash;
- (BOOL)isClip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNegativeSession;
- (BOOL)isTourist;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)urlHash;
- (float)latitude;
- (float)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)launchReasonAsString:(int)a3;
- (int)StringAsLaunchReason:(id)a3;
- (int)launchReason;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)locationAccuracy;
- (unsigned)timeBucket;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasIsClip:(BOOL)a3;
- (void)setHasIsNegativeSession:(BOOL)a3;
- (void)setHasIsTourist:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLaunchReason:(BOOL)a3;
- (void)setHasLocationAccuracy:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasTimeBucket:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsClip:(BOOL)a3;
- (void)setIsNegativeSession:(BOOL)a3;
- (void)setIsTourist:(BOOL)a3;
- (void)setLatitude:(float)a3;
- (void)setLaunchReason:(int)a3;
- (void)setLocationAccuracy:(unsigned int)a3;
- (void)setLongitude:(float)a3;
- (void)setTimeBucket:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUrlHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDProactiveAppPredictionLaunchesAtLocation

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLatitude:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTimeBucket:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_timeBucket = a3;
}

- (void)setHasTimeBucket:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTimeBucket
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTourist:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsTourist
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsClip:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isClip = a3;
}

- (void)setHasIsClip:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsClip
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
}

- (void)setLocationAccuracy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_locationAccuracy = a3;
}

- (void)setHasLocationAccuracy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLocationAccuracy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)launchReason
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_launchReason;
  }
  else {
    return 0;
  }
}

- (void)setLaunchReason:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_launchReason = a3;
}

- (void)setHasLaunchReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLaunchReason
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)launchReasonAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68B6440[a3];
  }
  return v3;
}

- (int)StringAsLaunchReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonNFC"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonQR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonLocationBasedSpotlight"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonLocationBasedHomescreen"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonSpringBoard"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonMaps"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonSafari"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonMessages"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonMail"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ProactiveAppPredictionLaunchReasonOther"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsNegativeSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isNegativeSession = a3;
}

- (void)setHasIsNegativeSession:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsNegativeSession
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveAppPredictionLaunchesAtLocation;
  int v4 = [(AWDProactiveAppPredictionLaunchesAtLocation *)&v8 description];
  v5 = [(AWDProactiveAppPredictionLaunchesAtLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v15 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_latitude;
  v16 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v16 forKey:@"latitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *(float *)&double v4 = self->_longitude;
  v17 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v17 forKey:@"longitude"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    v6 = [NSNumber numberWithUnsignedInt:self->_timeBucket];
    [v3 setObject:v6 forKey:@"timeBucket"];
  }
LABEL_6:
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isTourist];
    [v3 setObject:v9 forKey:@"isTourist"];

    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x40) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isClip];
    [v3 setObject:v10 forKey:@"isClip"];
  }
  urlHash = self->_urlHash;
  if (urlHash) {
    [v3 setObject:urlHash forKey:@"urlHash"];
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:self->_locationAccuracy];
    [v3 setObject:v18 forKey:@"locationAccuracy"];

    __int16 v12 = (__int16)self->_has;
    if ((v12 & 4) == 0)
    {
LABEL_16:
      if ((v12 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v12 & 4) == 0)
  {
    goto LABEL_16;
  }
  uint64_t launchReason = self->_launchReason;
  if (launchReason >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_launchReason);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E68B6440[launchReason];
  }
  [v3 setObject:v20 forKey:@"launchReason"];

  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_17:
  v13 = [NSNumber numberWithBool:self->_isNegativeSession];
  [v3 setObject:v13 forKey:@"isNegativeSession"];

LABEL_18:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveAppPredictionLaunchesAtLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_urlHash) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_17:
  }
    PBDataWriterWriteBOOLField();
LABEL_18:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = LODWORD(self->_latitude);
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *((_DWORD *)v4 + 9) = LODWORD(self->_longitude);
  *((_WORD *)v4 + 30) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 10) = self->_timeBucket;
    *((_WORD *)v4 + 30) |= 0x20u;
  }
LABEL_6:
  __int16 v8 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    double v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) != 0)
  {
    *((unsigned char *)v4 + 58) = self->_isTourist;
    *((_WORD *)v4 + 30) |= 0x100u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_isClip;
    *((_WORD *)v4 + 30) |= 0x40u;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v8, "setUrlHash:");
    double v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_locationAccuracy;
    *((_WORD *)v4 + 30) |= 8u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 4) == 0)
    {
LABEL_16:
      if ((v7 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 7) = self->_launchReason;
  *((_WORD *)v4 + 30) |= 4u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    *((unsigned char *)v4 + 57) = self->_isNegativeSession;
    *((_WORD *)v4 + 30) |= 0x80u;
  }
LABEL_18:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 60) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 24) = self->_latitude;
  *(_WORD *)(v5 + 60) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  *(float *)(v5 + 36) = self->_longitude;
  *(_WORD *)(v5 + 60) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 40) = self->_timeBucket;
    *(_WORD *)(v5 + 60) |= 0x20u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0)
  {
    *(unsigned char *)(v6 + 58) = self->_isTourist;
    *(_WORD *)(v6 + 60) |= 0x100u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_isClip;
    *(_WORD *)(v6 + 60) |= 0x40u;
  }
  uint64_t v11 = [(NSString *)self->_urlHash copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) == 0)
  {
    if ((v13 & 4) == 0) {
      goto LABEL_12;
    }
LABEL_20:
    *(_DWORD *)(v6 + 28) = self->_launchReason;
    *(_WORD *)(v6 + 60) |= 4u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      return (id)v6;
    }
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 32) = self->_locationAccuracy;
  *(_WORD *)(v6 + 60) |= 8u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0) {
    goto LABEL_20;
  }
LABEL_12:
  if ((v13 & 0x80) != 0)
  {
LABEL_13:
    *(unsigned char *)(v6 + 57) = self->_isNegativeSession;
    *(_WORD *)(v6 + 60) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_57;
    }
  }
  else if (v6)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitude != *((float *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_longitude != *((float *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_timeBucket != *((_DWORD *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_57;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0) {
      goto LABEL_57;
    }
    if (self->_isTourist)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_57;
    }
    if (self->_isClip)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_57;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](urlHash, "isEqual:")) {
      goto LABEL_57;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 30);
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_locationAccuracy != *((_DWORD *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_launchReason != *((_DWORD *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) != 0)
    {
      if (self->_isNegativeSession)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_57;
        }
      }
      else if (*((unsigned char *)v4 + 57))
      {
        goto LABEL_57;
      }
      BOOL v11 = 1;
      goto LABEL_58;
    }
LABEL_57:
    BOOL v11 = 0;
    goto LABEL_58;
  }
  BOOL v11 = (v10 & 0x80) == 0;
LABEL_58:

  return v11;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float latitude = self->_latitude;
  float v6 = -latitude;
  if (latitude >= 0.0) {
    float v6 = self->_latitude;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
LABEL_11:
  if ((has & 0x10) != 0)
  {
    float longitude = self->_longitude;
    float v12 = -longitude;
    if (longitude >= 0.0) {
      float v12 = self->_longitude;
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
  if ((has & 0x20) != 0) {
    uint64_t v15 = 2654435761 * self->_timeBucket;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_bundleId hash];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x100) != 0)
  {
    uint64_t v18 = 2654435761 * self->_isTourist;
    if ((v17 & 0x40) != 0) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((v17 & 0x40) != 0)
    {
LABEL_24:
      uint64_t v19 = 2654435761 * self->_isClip;
      goto LABEL_27;
    }
  }
  uint64_t v19 = 0;
LABEL_27:
  NSUInteger v20 = [(NSString *)self->_urlHash hash];
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 8) == 0)
  {
    uint64_t v22 = 0;
    if ((v21 & 4) != 0) {
      goto LABEL_29;
    }
LABEL_32:
    uint64_t v23 = 0;
    if ((v21 & 0x80) != 0) {
      goto LABEL_30;
    }
LABEL_33:
    uint64_t v24 = 0;
    return v9 ^ v4 ^ v10 ^ v15 ^ v18 ^ v19 ^ v16 ^ v20 ^ v22 ^ v23 ^ v24;
  }
  uint64_t v22 = 2654435761 * self->_locationAccuracy;
  if ((v21 & 4) == 0) {
    goto LABEL_32;
  }
LABEL_29:
  uint64_t v23 = 2654435761 * self->_launchReason;
  if ((v21 & 0x80) == 0) {
    goto LABEL_33;
  }
LABEL_30:
  uint64_t v24 = 2654435761 * self->_isNegativeSession;
  return v9 ^ v4 ^ v10 ^ v15 ^ v18 ^ v19 ^ v16 ^ v20 ^ v22 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_float latitude = *((float *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  self->_float longitude = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 30) & 0x20) != 0)
  {
LABEL_5:
    self->_timeBucket = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_6:
  id v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[AWDProactiveAppPredictionLaunchesAtLocation setBundleId:](self, "setBundleId:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 30);
  if ((v6 & 0x100) != 0)
  {
    self->_isTourist = *((unsigned char *)v4 + 58);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v6 = *((_WORD *)v4 + 30);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isClip = *((unsigned char *)v4 + 56);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 6))
  {
    -[AWDProactiveAppPredictionLaunchesAtLocation setUrlHash:](self, "setUrlHash:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 30);
  if ((v7 & 8) != 0)
  {
    self->_locationAccuracy = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v7 = *((_WORD *)v4 + 30);
    if ((v7 & 4) == 0)
    {
LABEL_16:
      if ((v7 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_16;
  }
  self->_uint64_t launchReason = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 30) & 0x80) != 0)
  {
LABEL_17:
    self->_isNegativeSession = *((unsigned char *)v4 + 57);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (float)latitude
{
  return self->_latitude;
}

- (float)longitude
{
  return self->_longitude;
}

- (unsigned)timeBucket
{
  return self->_timeBucket;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (BOOL)isClip
{
  return self->_isClip;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
}

- (unsigned)locationAccuracy
{
  return self->_locationAccuracy;
}

- (BOOL)isNegativeSession
{
  return self->_isNegativeSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end