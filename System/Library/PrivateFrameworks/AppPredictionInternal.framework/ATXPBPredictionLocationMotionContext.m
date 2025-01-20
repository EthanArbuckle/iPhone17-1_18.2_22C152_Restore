@interface ATXPBPredictionLocationMotionContext
- (ATXPBPredictionLocationOfInterest)currentLOI;
- (ATXPBPredictionLocationOfInterest)previousLOI;
- (BOOL)canPredictClipsGivenRecentMotion;
- (BOOL)hasCanPredictClipsGivenRecentMotion;
- (BOOL)hasCoarseGeohash;
- (BOOL)hasCurrentLOI;
- (BOOL)hasCurrentLocation;
- (BOOL)hasDistanceFromGym;
- (BOOL)hasDistanceFromHome;
- (BOOL)hasDistanceFromSchool;
- (BOOL)hasDistanceFromWork;
- (BOOL)hasGeohash;
- (BOOL)hasLargeGeohash;
- (BOOL)hasLocationEnabled;
- (BOOL)hasMotionType;
- (BOOL)hasPreviousLOI;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)currentLocation;
- (double)distanceFromGym;
- (double)distanceFromHome;
- (double)distanceFromSchool;
- (double)distanceFromWork;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)motionTypeAsString:(int)a3;
- (int)StringAsMotionType:(id)a3;
- (int)motionType;
- (unint64_t)coarseGeohash;
- (unint64_t)geohash;
- (unint64_t)hash;
- (unint64_t)largeGeohash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCanPredictClipsGivenRecentMotion:(BOOL)a3;
- (void)setCoarseGeohash:(unint64_t)a3;
- (void)setCurrentLOI:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDistanceFromGym:(double)a3;
- (void)setDistanceFromHome:(double)a3;
- (void)setDistanceFromSchool:(double)a3;
- (void)setDistanceFromWork:(double)a3;
- (void)setGeohash:(unint64_t)a3;
- (void)setHasCanPredictClipsGivenRecentMotion:(BOOL)a3;
- (void)setHasCoarseGeohash:(BOOL)a3;
- (void)setHasDistanceFromGym:(BOOL)a3;
- (void)setHasDistanceFromHome:(BOOL)a3;
- (void)setHasDistanceFromSchool:(BOOL)a3;
- (void)setHasDistanceFromWork:(BOOL)a3;
- (void)setHasGeohash:(BOOL)a3;
- (void)setHasLargeGeohash:(BOOL)a3;
- (void)setHasLocationEnabled:(BOOL)a3;
- (void)setHasMotionType:(BOOL)a3;
- (void)setLargeGeohash:(unint64_t)a3;
- (void)setLocationEnabled:(BOOL)a3;
- (void)setMotionType:(int)a3;
- (void)setPreviousLOI:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionLocationMotionContext

- (BOOL)hasPreviousLOI
{
  return self->_previousLOI != 0;
}

- (BOOL)hasCurrentLOI
{
  return self->_currentLOI != 0;
}

- (int)motionType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_motionType;
  }
  else {
    return 0;
  }
}

- (void)setMotionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_motionType = a3;
}

- (void)setHasMotionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMotionType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)motionTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68B0B10[a3];
  }
  return v3;
}

- (int)StringAsMotionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Walking"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Running"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Cycling"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCurrentLocation
{
  return self->_currentLocation != 0;
}

- (void)setLocationEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_locationEnabled = a3;
}

- (void)setHasLocationEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLocationEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDistanceFromHome:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_distanceFromHome = a3;
}

- (void)setHasDistanceFromHome:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDistanceFromHome
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDistanceFromWork:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_distanceFromWork = a3;
}

- (void)setHasDistanceFromWork:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDistanceFromWork
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDistanceFromSchool:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_distanceFromSchool = a3;
}

- (void)setHasDistanceFromSchool:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDistanceFromSchool
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDistanceFromGym:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_distanceFromGym = a3;
}

- (void)setHasDistanceFromGym:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDistanceFromGym
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCanPredictClipsGivenRecentMotion:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_canPredictClipsGivenRecentMotion = a3;
}

- (void)setHasCanPredictClipsGivenRecentMotion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCanPredictClipsGivenRecentMotion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_geohash = a3;
}

- (void)setHasGeohash:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGeohash
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCoarseGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_coarseGeohash = a3;
}

- (void)setHasCoarseGeohash:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCoarseGeohash
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLargeGeohash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_largeGeohash = a3;
}

- (void)setHasLargeGeohash:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLargeGeohash
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionLocationMotionContext;
  int v4 = [(ATXPBPredictionLocationMotionContext *)&v8 description];
  v5 = [(ATXPBPredictionLocationMotionContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  previousLOI = self->_previousLOI;
  if (previousLOI)
  {
    v5 = [(ATXPBPredictionLocationOfInterest *)previousLOI dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"previousLOI"];
  }
  currentLOI = self->_currentLOI;
  if (currentLOI)
  {
    v7 = [(ATXPBPredictionLocationOfInterest *)currentLOI dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"currentLOI"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t motionType = self->_motionType;
    if (motionType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_motionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E68B0B10[motionType];
    }
    [v3 setObject:v9 forKey:@"motionType"];
  }
  currentLocation = self->_currentLocation;
  if (currentLocation) {
    [v3 setObject:currentLocation forKey:@"currentLocation"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_locationEnabled];
    [v3 setObject:v14 forKey:@"locationEnabled"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_27;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_14;
  }
  v15 = [NSNumber numberWithDouble:self->_distanceFromHome];
  [v3 setObject:v15 forKey:@"distanceFromHome"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = [NSNumber numberWithDouble:self->_distanceFromWork];
  [v3 setObject:v16 forKey:@"distanceFromWork"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_16:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = [NSNumber numberWithDouble:self->_distanceFromSchool];
  [v3 setObject:v17 forKey:@"distanceFromSchool"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  v18 = [NSNumber numberWithDouble:self->_distanceFromGym];
  [v3 setObject:v18 forKey:@"distanceFromGym"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  v19 = [NSNumber numberWithBool:self->_canPredictClipsGivenRecentMotion];
  [v3 setObject:v19 forKey:@"canPredictClipsGivenRecentMotion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  v20 = [NSNumber numberWithUnsignedLongLong:self->_geohash];
  [v3 setObject:v20 forKey:@"geohash"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_20:
    if ((has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_32:
  v21 = [NSNumber numberWithUnsignedLongLong:self->_coarseGeohash];
  [v3 setObject:v21 forKey:@"coarseGeohash"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_21:
    v12 = [NSNumber numberWithUnsignedLongLong:self->_largeGeohash];
    [v3 setObject:v12 forKey:@"largeGeohash"];
  }
LABEL_22:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionLocationMotionContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_previousLOI)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_currentLOI)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_currentLocation)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFixed64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_29:
  PBDataWriterWriteFixed64Field();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    PBDataWriterWriteFixed64Field();
    id v4 = v6;
  }
LABEL_19:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_previousLOI)
  {
    objc_msgSend(v4, "setPreviousLOI:");
    id v4 = v6;
  }
  if (self->_currentLOI)
  {
    objc_msgSend(v6, "setCurrentLOI:");
    id v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_motionType;
    *((_WORD *)v4 + 50) |= 0x80u;
  }
  if (self->_currentLocation)
  {
    objc_msgSend(v6, "setCurrentLocation:");
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((unsigned char *)v4 + 97) = self->_locationEnabled;
    *((_WORD *)v4 + 50) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_11:
      if ((has & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 3) = *(void *)&self->_distanceFromHome;
  *((_WORD *)v4 + 50) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)v4 + 5) = *(void *)&self->_distanceFromWork;
  *((_WORD *)v4 + 50) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((void *)v4 + 4) = *(void *)&self->_distanceFromSchool;
  *((_WORD *)v4 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v4 + 2) = *(void *)&self->_distanceFromGym;
  *((_WORD *)v4 + 50) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((unsigned char *)v4 + 96) = self->_canPredictClipsGivenRecentMotion;
  *((_WORD *)v4 + 50) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 6) = self->_geohash;
  *((_WORD *)v4 + 50) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_29:
  *((void *)v4 + 1) = self->_coarseGeohash;
  *((_WORD *)v4 + 50) |= 1u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_18:
    *((void *)v4 + 7) = self->_largeGeohash;
    *((_WORD *)v4 + 50) |= 0x40u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXPBPredictionLocationOfInterest *)self->_previousLOI copyWithZone:a3];
  v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  id v8 = [(ATXPBPredictionLocationOfInterest *)self->_currentLOI copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_motionType;
    *(_WORD *)(v5 + 100) |= 0x80u;
  }
  uint64_t v10 = [(NSData *)self->_currentLocation copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 97) = self->_locationEnabled;
    *(_WORD *)(v5 + 100) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 24) = self->_distanceFromHome;
  *(_WORD *)(v5 + 100) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v5 + 40) = self->_distanceFromWork;
  *(_WORD *)(v5 + 100) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 32) = self->_distanceFromSchool;
  *(_WORD *)(v5 + 100) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 16) = self->_distanceFromGym;
  *(_WORD *)(v5 + 100) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(v5 + 96) = self->_canPredictClipsGivenRecentMotion;
  *(_WORD *)(v5 + 100) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_21:
    *(void *)(v5 + 8) = self->_coarseGeohash;
    *(_WORD *)(v5 + 100) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return (id)v5;
    }
    goto LABEL_12;
  }
LABEL_20:
  *(void *)(v5 + 48) = self->_geohash;
  *(_WORD *)(v5 + 100) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_21;
  }
LABEL_11:
  if ((has & 0x40) != 0)
  {
LABEL_12:
    *(void *)(v5 + 56) = self->_largeGeohash;
    *(_WORD *)(v5 + 100) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  previousLOI = self->_previousLOI;
  if ((unint64_t)previousLOI | *((void *)v4 + 11))
  {
    if (!-[ATXPBPredictionLocationOfInterest isEqual:](previousLOI, "isEqual:")) {
      goto LABEL_65;
    }
  }
  currentLOI = self->_currentLOI;
  if ((unint64_t)currentLOI | *((void *)v4 + 8))
  {
    if (!-[ATXPBPredictionLocationOfInterest isEqual:](currentLOI, "isEqual:")) {
      goto LABEL_65;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 50);
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_motionType != *((_DWORD *)v4 + 20)) {
      goto LABEL_65;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_65;
  }
  currentLocation = self->_currentLocation;
  if ((unint64_t)currentLocation | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](currentLocation, "isEqual:")) {
      goto LABEL_65;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 50);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0) {
      goto LABEL_65;
    }
    if (self->_locationEnabled)
    {
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_65;
      }
    }
    else if (*((unsigned char *)v4 + 97))
    {
      goto LABEL_65;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_distanceFromHome != *((double *)v4 + 3)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_distanceFromWork != *((double *)v4 + 5)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_distanceFromSchool != *((double *)v4 + 4)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_distanceFromGym != *((double *)v4 + 2)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_65;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x100) != 0)
    {
      if (self->_canPredictClipsGivenRecentMotion)
      {
        if (!*((unsigned char *)v4 + 96)) {
          goto LABEL_65;
        }
        goto LABEL_50;
      }
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_50;
      }
    }
LABEL_65:
    BOOL v11 = 0;
    goto LABEL_66;
  }
  if ((*((_WORD *)v4 + 50) & 0x100) != 0) {
    goto LABEL_65;
  }
LABEL_50:
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_geohash != *((void *)v4 + 6)) {
      goto LABEL_65;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_65;
  }
  if (has)
  {
    if ((v10 & 1) == 0 || self->_coarseGeohash != *((void *)v4 + 1)) {
      goto LABEL_65;
    }
  }
  else if (v10)
  {
    goto LABEL_65;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_largeGeohash != *((void *)v4 + 7)) {
      goto LABEL_65;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x40) == 0;
  }
LABEL_66:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v33 = [(ATXPBPredictionLocationOfInterest *)self->_previousLOI hash];
  unint64_t v3 = [(ATXPBPredictionLocationOfInterest *)self->_currentLOI hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v4 = 2654435761 * self->_motionType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSData *)self->_currentLocation hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v7 = 2654435761 * self->_locationEnabled;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v12 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = 0;
  if ((has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double distanceFromHome = self->_distanceFromHome;
  double v9 = -distanceFromHome;
  if (distanceFromHome >= 0.0) {
    double v9 = self->_distanceFromHome;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_14:
  if ((has & 0x10) != 0)
  {
    double distanceFromWork = self->_distanceFromWork;
    double v15 = -distanceFromWork;
    if (distanceFromWork >= 0.0) {
      double v15 = self->_distanceFromWork;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 8) != 0)
  {
    double distanceFromSchool = self->_distanceFromSchool;
    double v20 = -distanceFromSchool;
    if (distanceFromSchool >= 0.0) {
      double v20 = self->_distanceFromSchool;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 2) != 0)
  {
    double distanceFromGym = self->_distanceFromGym;
    double v25 = -distanceFromGym;
    if (distanceFromGym >= 0.0) {
      double v25 = self->_distanceFromGym;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v28 = 2654435761 * self->_canPredictClipsGivenRecentMotion;
    if ((has & 0x20) != 0)
    {
LABEL_40:
      unint64_t v29 = 2654435761u * self->_geohash;
      if (has) {
        goto LABEL_41;
      }
LABEL_45:
      unint64_t v30 = 0;
      if ((has & 0x40) != 0) {
        goto LABEL_42;
      }
LABEL_46:
      unint64_t v31 = 0;
      return v3 ^ v33 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30 ^ v31;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_40;
    }
  }
  unint64_t v29 = 0;
  if ((has & 1) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  unint64_t v30 = 2654435761u * self->_coarseGeohash;
  if ((has & 0x40) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  unint64_t v31 = 2654435761u * self->_largeGeohash;
  return v3 ^ v33 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  previousLOI = self->_previousLOI;
  uint64_t v6 = *((void *)v4 + 11);
  id v10 = v4;
  if (previousLOI)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ATXPBPredictionLocationOfInterest mergeFrom:](previousLOI, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ATXPBPredictionLocationMotionContext setPreviousLOI:](self, "setPreviousLOI:");
  }
  id v4 = v10;
LABEL_7:
  currentLOI = self->_currentLOI;
  uint64_t v8 = *((void *)v4 + 8);
  if (currentLOI)
  {
    if (!v8) {
      goto LABEL_13;
    }
    currentLOI = (ATXPBPredictionLocationOfInterest *)-[ATXPBPredictionLocationOfInterest mergeFrom:](currentLOI, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    currentLOI = (ATXPBPredictionLocationOfInterest *)-[ATXPBPredictionLocationMotionContext setCurrentLOI:](self, "setCurrentLOI:");
  }
  id v4 = v10;
LABEL_13:
  if ((*((_WORD *)v4 + 50) & 0x80) != 0)
  {
    self->_uint64_t motionType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 9))
  {
    currentLOI = (ATXPBPredictionLocationOfInterest *)-[ATXPBPredictionLocationMotionContext setCurrentLocation:](self, "setCurrentLocation:");
    id v4 = v10;
  }
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x200) != 0)
  {
    self->_locationEnabled = *((unsigned char *)v4 + 97);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v9 = *((_WORD *)v4 + 50);
    if ((v9 & 4) == 0)
    {
LABEL_19:
      if ((v9 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  else if ((v9 & 4) == 0)
  {
    goto LABEL_19;
  }
  self->_double distanceFromHome = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x10) == 0)
  {
LABEL_20:
    if ((v9 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double distanceFromWork = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 8) == 0)
  {
LABEL_21:
    if ((v9 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double distanceFromSchool = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 2) == 0)
  {
LABEL_22:
    if ((v9 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double distanceFromGym = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x100) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_canPredictClipsGivenRecentMotion = *((unsigned char *)v4 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 0x20) == 0)
  {
LABEL_24:
    if ((v9 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_geohash = *((void *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v9 = *((_WORD *)v4 + 50);
  if ((v9 & 1) == 0)
  {
LABEL_25:
    if ((v9 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_37:
  self->_coarseGeohash = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 50) & 0x40) != 0)
  {
LABEL_26:
    self->_largeGeohash = *((void *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_27:
  MEMORY[0x1F41817F8](currentLOI, v4);
}

- (ATXPBPredictionLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (void)setPreviousLOI:(id)a3
{
}

- (ATXPBPredictionLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (void)setCurrentLOI:(id)a3
{
}

- (NSData)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (double)distanceFromHome
{
  return self->_distanceFromHome;
}

- (double)distanceFromWork
{
  return self->_distanceFromWork;
}

- (double)distanceFromSchool
{
  return self->_distanceFromSchool;
}

- (double)distanceFromGym
{
  return self->_distanceFromGym;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

- (unint64_t)geohash
{
  return self->_geohash;
}

- (unint64_t)coarseGeohash
{
  return self->_coarseGeohash;
}

- (unint64_t)largeGeohash
{
  return self->_largeGeohash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLOI, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_currentLOI, 0);
}

@end