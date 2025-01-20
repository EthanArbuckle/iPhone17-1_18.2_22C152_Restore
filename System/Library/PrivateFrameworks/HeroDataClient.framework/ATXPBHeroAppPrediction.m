@interface ATXPBHeroAppPrediction
- (BOOL)hasAdamId;
- (BOOL)hasBundleId;
- (BOOL)hasClipMetadata;
- (BOOL)hasIsTouristApp;
- (BOOL)hasLatitude;
- (BOOL)hasLatitudeAtPredictionTime;
- (BOOL)hasLongitude;
- (BOOL)hasLongitudeAtPredictionTime;
- (BOOL)hasPoiCategory;
- (BOOL)hasPoiMuid;
- (BOOL)hasRadius;
- (BOOL)hasRank;
- (BOOL)hasScore;
- (BOOL)hasUrlHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTouristApp;
- (BOOL)readFrom:(id)a3;
- (NSData)clipMetadata;
- (NSString)bundleId;
- (NSString)poiCategory;
- (NSString)urlHash;
- (double)latitude;
- (double)latitudeAtPredictionTime;
- (double)longitude;
- (double)longitudeAtPredictionTime;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)adamId;
- (int64_t)radius;
- (int64_t)rank;
- (unint64_t)hash;
- (unint64_t)poiMuid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setClipMetadata:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasIsTouristApp:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLatitudeAtPredictionTime:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasLongitudeAtPredictionTime:(BOOL)a3;
- (void)setHasPoiMuid:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setIsTouristApp:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLatitudeAtPredictionTime:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setLongitudeAtPredictionTime:(double)a3;
- (void)setPoiCategory:(id)a3;
- (void)setPoiMuid:(unint64_t)a3;
- (void)setRadius:(int64_t)a3;
- (void)setRank:(int64_t)a3;
- (void)setScore:(double)a3;
- (void)setUrlHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBHeroAppPrediction

- (void)setLatitude:(double)a3
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

- (void)setLongitude:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTouristApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isTouristApp = a3;
}

- (void)setHasIsTouristApp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsTouristApp
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasUrlHash
{
  return self->_urlHash != 0;
}

- (BOOL)hasClipMetadata
{
  return self->_clipMetadata != 0;
}

- (void)setAdamId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdamId
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRank:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRank
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRadius:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRadius
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLatitudeAtPredictionTime:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_latitudeAtPredictionTime = a3;
}

- (void)setHasLatitudeAtPredictionTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLatitudeAtPredictionTime
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLongitudeAtPredictionTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_longitudeAtPredictionTime = a3;
}

- (void)setHasLongitudeAtPredictionTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLongitudeAtPredictionTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasPoiCategory
{
  return self->_poiCategory != 0;
}

- (void)setPoiMuid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_poiMuid = a3;
}

- (void)setHasPoiMuid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPoiMuid
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBHeroAppPrediction;
  v4 = [(ATXPBHeroAppPrediction *)&v8 description];
  v5 = [(ATXPBHeroAppPrediction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_latitude];
    [v3 setObject:v5 forKey:@"latitude"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_longitude];
    [v3 setObject:v6 forKey:@"longitude"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x200) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isTouristApp];
    [v3 setObject:v9 forKey:@"isTouristApp"];

    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x100) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_score];
    [v3 setObject:v10 forKey:@"score"];
  }
  urlHash = self->_urlHash;
  if (urlHash) {
    [v3 setObject:urlHash forKey:@"urlHash"];
  }
  clipMetadata = self->_clipMetadata;
  if (clipMetadata) {
    [v3 setObject:clipMetadata forKey:@"clipMetadata"];
  }
  __int16 v13 = (__int16)self->_has;
  if (v13)
  {
    v18 = [NSNumber numberWithLongLong:self->_adamId];
    [v3 setObject:v18 forKey:@"adamId"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 0x80) == 0)
    {
LABEL_17:
      if ((v13 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  v19 = [NSNumber numberWithLongLong:self->_rank];
  [v3 setObject:v19 forKey:@"rank"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) == 0)
  {
LABEL_18:
    if ((v13 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  v20 = [NSNumber numberWithLongLong:self->_radius];
  [v3 setObject:v20 forKey:@"radius"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_19:
    if ((v13 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_31:
  v21 = [NSNumber numberWithDouble:self->_latitudeAtPredictionTime];
  [v3 setObject:v21 forKey:@"latitudeAtPredictionTime"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v14 = [NSNumber numberWithDouble:self->_longitudeAtPredictionTime];
    [v3 setObject:v14 forKey:@"longitudeAtPredictionTime"];
  }
LABEL_21:
  poiCategory = self->_poiCategory;
  if (poiCategory) {
    [v3 setObject:poiCategory forKey:@"poiCategory"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v16 = [NSNumber numberWithUnsignedLongLong:self->_poiMuid];
    [v3 setObject:v16 forKey:@"poiMuid"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBHeroAppPredictionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x100) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_urlHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_clipMetadata) {
    PBDataWriterWriteDataField();
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteInt64Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_17:
      if ((v6 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_19:
    if ((v6 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_20:
  }
    PBDataWriterWriteDoubleField();
LABEL_21:
  if (self->_poiCategory) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_latitude;
    *((_WORD *)v4 + 58) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_longitude;
    *((_WORD *)v4 + 58) |= 8u;
  }
  __int16 v8 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 112) = self->_isTouristApp;
    *((_WORD *)v4 + 58) |= 0x200u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    v4[9] = *(void *)&self->_score;
    *((_WORD *)v4 + 58) |= 0x100u;
  }
  if (self->_urlHash)
  {
    objc_msgSend(v8, "setUrlHash:");
    v4 = v8;
  }
  if (self->_clipMetadata)
  {
    objc_msgSend(v8, "setClipMetadata:");
    v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if (v7)
  {
    v4[1] = self->_adamId;
    *((_WORD *)v4 + 58) |= 1u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_17:
      if ((v7 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  v4[8] = self->_rank;
  *((_WORD *)v4 + 58) |= 0x80u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) == 0)
  {
LABEL_18:
    if ((v7 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[7] = self->_radius;
  *((_WORD *)v4 + 58) |= 0x40u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_31:
  v4[3] = *(void *)&self->_latitudeAtPredictionTime;
  *((_WORD *)v4 + 58) |= 4u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    v4[5] = *(void *)&self->_longitudeAtPredictionTime;
    *((_WORD *)v4 + 58) |= 0x10u;
  }
LABEL_21:
  if (self->_poiCategory)
  {
    objc_msgSend(v8, "setPoiCategory:");
    v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v4[6] = self->_poiMuid;
    *((_WORD *)v4 + 58) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_latitude;
    *(_WORD *)(v5 + 116) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_longitude;
    *(_WORD *)(v5 + 116) |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  v9 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *(unsigned char *)(v6 + 112) = self->_isTouristApp;
    *(_WORD *)(v6 + 116) |= 0x200u;
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x100) != 0)
  {
    *(double *)(v6 + 72) = self->_score;
    *(_WORD *)(v6 + 116) |= 0x100u;
  }
  uint64_t v11 = [(NSString *)self->_urlHash copyWithZone:a3];
  v12 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v11;

  uint64_t v13 = [(NSData *)self->_clipMetadata copyWithZone:a3];
  v14 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v13;

  __int16 v15 = (__int16)self->_has;
  if (v15)
  {
    *(void *)(v6 + 8) = self->_adamId;
    *(_WORD *)(v6 + 116) |= 1u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_11:
      if ((v15 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v6 + 64) = self->_rank;
  *(_WORD *)(v6 + 116) |= 0x80u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x40) == 0)
  {
LABEL_12:
    if ((v15 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(void *)(v6 + 56) = self->_radius;
  *(_WORD *)(v6 + 116) |= 0x40u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_13:
    if ((v15 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  *(double *)(v6 + 24) = self->_latitudeAtPredictionTime;
  *(_WORD *)(v6 + 116) |= 4u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *(double *)(v6 + 40) = self->_longitudeAtPredictionTime;
    *(_WORD *)(v6 + 116) |= 0x10u;
  }
LABEL_15:
  uint64_t v16 = [(NSString *)self->_poiCategory copyWithZone:a3];
  v17 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v16;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_poiMuid;
    *(_WORD *)(v6 + 116) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitude != *((double *)v4 + 2)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_longitude != *((double *)v4 + 4)) {
      goto LABEL_65;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_65;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_65;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0) {
      goto LABEL_65;
    }
    if (self->_isTouristApp)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_score != *((double *)v4 + 9)) {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_65;
  }
  urlHash = self->_urlHash;
  if ((unint64_t)urlHash | *((void *)v4 + 13) && !-[NSString isEqual:](urlHash, "isEqual:")) {
    goto LABEL_65;
  }
  clipMetadata = self->_clipMetadata;
  if ((unint64_t)clipMetadata | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](clipMetadata, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 58);
  if (v10)
  {
    if ((v11 & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v11)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_rank != *((void *)v4 + 8)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_radius != *((void *)v4 + 7)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_latitudeAtPredictionTime != *((double *)v4 + 3)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_longitudeAtPredictionTime != *((double *)v4 + 5)) {
      goto LABEL_65;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  poiCategory = self->_poiCategory;
  if ((unint64_t)poiCategory | *((void *)v4 + 12))
  {
    if (-[NSString isEqual:](poiCategory, "isEqual:"))
    {
      __int16 v10 = (__int16)self->_has;
      goto LABEL_60;
    }
LABEL_65:
    BOOL v14 = 0;
    goto LABEL_66;
  }
LABEL_60:
  __int16 v13 = *((_WORD *)v4 + 58);
  if ((v10 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_poiMuid != *((void *)v4 + 6)) {
      goto LABEL_65;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (v13 & 0x20) == 0;
  }
LABEL_66:

  return v14;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    double latitude = self->_latitude;
    double v6 = -latitude;
    if (latitude >= 0.0) {
      double v6 = self->_latitude;
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
  unint64_t v41 = v4;
  if ((has & 8) != 0)
  {
    double longitude = self->_longitude;
    double v11 = -longitude;
    if (longitude >= 0.0) {
      double v11 = self->_longitude;
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
  unint64_t v40 = v9;
  NSUInteger v39 = [(NSString *)self->_bundleId hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v38 = 2654435761 * self->_isTouristApp;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0;
    goto LABEL_27;
  }
  uint64_t v38 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double score = self->_score;
  double v15 = -score;
  if (score >= 0.0) {
    double v15 = self->_score;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_27:
  NSUInteger v37 = [(NSString *)self->_urlHash hash];
  uint64_t v19 = [(NSData *)self->_clipMetadata hash];
  __int16 v20 = (__int16)self->_has;
  if (v20)
  {
    uint64_t v21 = 2654435761 * self->_adamId;
    if ((v20 & 0x80) != 0)
    {
LABEL_29:
      uint64_t v22 = 2654435761 * self->_rank;
      if ((v20 & 0x40) != 0) {
        goto LABEL_30;
      }
LABEL_37:
      uint64_t v23 = 0;
      if ((v20 & 4) != 0) {
        goto LABEL_31;
      }
LABEL_38:
      unint64_t v28 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((v20 & 0x80) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v22 = 0;
  if ((v20 & 0x40) == 0) {
    goto LABEL_37;
  }
LABEL_30:
  uint64_t v23 = 2654435761 * self->_radius;
  if ((v20 & 4) == 0) {
    goto LABEL_38;
  }
LABEL_31:
  double latitudeAtPredictionTime = self->_latitudeAtPredictionTime;
  double v25 = -latitudeAtPredictionTime;
  if (latitudeAtPredictionTime >= 0.0) {
    double v25 = self->_latitudeAtPredictionTime;
  }
  long double v26 = floor(v25 + 0.5);
  double v27 = (v25 - v26) * 1.84467441e19;
  unint64_t v28 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
  if (v27 >= 0.0)
  {
    if (v27 > 0.0) {
      v28 += (unint64_t)v27;
    }
  }
  else
  {
    v28 -= (unint64_t)fabs(v27);
  }
LABEL_41:
  if ((v20 & 0x10) != 0)
  {
    double longitudeAtPredictionTime = self->_longitudeAtPredictionTime;
    double v31 = -longitudeAtPredictionTime;
    if (longitudeAtPredictionTime >= 0.0) {
      double v31 = self->_longitudeAtPredictionTime;
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
  NSUInteger v34 = [(NSString *)self->_poiCategory hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    unint64_t v35 = 2654435761u * self->_poiMuid;
  }
  else {
    unint64_t v35 = 0;
  }
  return v40 ^ v41 ^ v38 ^ v18 ^ v39 ^ v37 ^ v19 ^ v21 ^ v22 ^ v23 ^ v28 ^ v29 ^ v34 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 2) != 0)
  {
    self->_double latitude = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 58);
  }
  if ((v5 & 8) != 0)
  {
    self->_double longitude = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  id v8 = v4;
  if (*((void *)v4 + 10))
  {
    -[ATXPBHeroAppPrediction setBundleId:](self, "setBundleId:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x200) != 0)
  {
    self->_isTouristApp = *((unsigned char *)v4 + 112);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v6 = *((_WORD *)v4 + 58);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_double score = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 13))
  {
    -[ATXPBHeroAppPrediction setUrlHash:](self, "setUrlHash:");
    id v4 = v8;
  }
  if (*((void *)v4 + 11))
  {
    -[ATXPBHeroAppPrediction setClipMetadata:](self, "setClipMetadata:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 58);
  if (v7)
  {
    self->_adamId = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v7 = *((_WORD *)v4 + 58);
    if ((v7 & 0x80) == 0)
    {
LABEL_17:
      if ((v7 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_30;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  self->_rank = *((void *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v7 = *((_WORD *)v4 + 58);
  if ((v7 & 0x40) == 0)
  {
LABEL_18:
    if ((v7 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_radius = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v4 + 58);
  if ((v7 & 4) == 0)
  {
LABEL_19:
    if ((v7 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_31:
  self->_double latitudeAtPredictionTime = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 58) & 0x10) != 0)
  {
LABEL_20:
    self->_double longitudeAtPredictionTime = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_21:
  if (*((void *)v4 + 12))
  {
    -[ATXPBHeroAppPrediction setPoiCategory:](self, "setPoiCategory:");
    id v4 = v8;
  }
  if ((*((_WORD *)v4 + 58) & 0x20) != 0)
  {
    self->_poiMuid = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isTouristApp
{
  return self->_isTouristApp;
}

- (double)score
{
  return self->_score;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (void)setUrlHash:(id)a3
{
}

- (NSData)clipMetadata
{
  return self->_clipMetadata;
}

- (void)setClipMetadata:(id)a3
{
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (int64_t)rank
{
  return self->_rank;
}

- (int64_t)radius
{
  return self->_radius;
}

- (double)latitudeAtPredictionTime
{
  return self->_latitudeAtPredictionTime;
}

- (double)longitudeAtPredictionTime
{
  return self->_longitudeAtPredictionTime;
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
}

- (unint64_t)poiMuid
{
  return self->_poiMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end