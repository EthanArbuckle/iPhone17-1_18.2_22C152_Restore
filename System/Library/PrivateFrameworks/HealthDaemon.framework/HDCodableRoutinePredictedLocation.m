@interface HDCodableRoutinePredictedLocation
- (BOOL)hasConfidence;
- (BOOL)hasGeoData;
- (BOOL)hasLocationOfInterest;
- (BOOL)hasModeOfTransportation;
- (BOOL)hasNextEntryTime;
- (BOOL)hasSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableRoutineLocation)locationOfInterest;
- (NSData)geoData;
- (double)confidence;
- (double)nextEntryTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeOfTransportationAsString:(int)a3;
- (id)sourceTypeAsString:(int)a3;
- (int)StringAsModeOfTransportation:(id)a3;
- (int)StringAsSourceType:(id)a3;
- (int)modeOfTransportation;
- (int)sourceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setGeoData:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasModeOfTransportation:(BOOL)a3;
- (void)setHasNextEntryTime:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setLocationOfInterest:(id)a3;
- (void)setModeOfTransportation:(int)a3;
- (void)setNextEntryTime:(double)a3;
- (void)setSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutinePredictedLocation

- (BOOL)hasLocationOfInterest
{
  return self->_locationOfInterest != 0;
}

- (void)setConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNextEntryTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nextEntryTime = a3;
}

- (void)setHasNextEntryTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNextEntryTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)modeOfTransportation
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_modeOfTransportation;
  }
  else {
    return -1;
  }
}

- (void)setModeOfTransportation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modeOfTransportation = a3;
}

- (void)setHasModeOfTransportation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeOfTransportation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)modeOfTransportationAsString:(int)a3
{
  if ((a3 + 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62F4D50[a3 + 1];
  }

  return v3;
}

- (int)StringAsModeOfTransportation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownMode"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"Walking"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Driving"])
  {
    int v4 = 1;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (int)sourceType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_sourceType;
  }
  else {
    return 0;
  }
}

- (void)setSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSourceType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62F4D68[a3];
  }

  return v3;
}

- (int)StringAsSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownSource"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Bluetooth"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CoreRoutine"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EventKit"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LocationVisit"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasGeoData
{
  return self->_geoData != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutinePredictedLocation;
  int v4 = [(HDCodableRoutinePredictedLocation *)&v8 description];
  v5 = [(HDCodableRoutinePredictedLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  locationOfInterest = self->_locationOfInterest;
  if (locationOfInterest)
  {
    v5 = [(HDCodableRoutineLocation *)locationOfInterest dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"locationOfInterest"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v7 forKey:@"confidence"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_nextEntryTime];
  [v3 setObject:v8 forKey:@"nextEntryTime"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_10:
  unsigned int v9 = self->_modeOfTransportation + 1;
  if (v9 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_modeOfTransportation);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E62F4D50[v9];
  }
  [v3 setObject:v10 forKey:@"modeOfTransportation"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_14:
    uint64_t sourceType = self->_sourceType;
    if (sourceType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sourceType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E62F4D68[sourceType];
    }
    [v3 setObject:v12 forKey:@"sourceType"];
  }
LABEL_18:
  geoData = self->_geoData;
  if (geoData) {
    [v3 setObject:geoData forKey:@"geoData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutinePredictedLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_locationOfInterest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_geoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_locationOfInterest)
  {
    objc_msgSend(v4, "setLocationOfInterest:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_nextEntryTime;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 10) = self->_modeOfTransportation;
  *((unsigned char *)v4 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 11) = self->_sourceType;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_8:
  if (self->_geoData)
  {
    objc_msgSend(v6, "setGeoData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableRoutineLocation *)self->_locationOfInterest copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 40) = self->_modeOfTransportation;
      *(unsigned char *)(v5 + 48) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_nextEntryTime;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 44) = self->_sourceType;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
LABEL_6:
  uint64_t v9 = [(NSData *)self->_geoData copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  locationOfInterest = self->_locationOfInterest;
  if ((unint64_t)locationOfInterest | *((void *)v4 + 4))
  {
    if (!-[HDCodableRoutineLocation isEqual:](locationOfInterest, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_26:
    char v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_nextEntryTime != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_modeOfTransportation != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_sourceType != *((_DWORD *)v4 + 11)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  geoData = self->_geoData;
  if ((unint64_t)geoData | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](geoData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableRoutineLocation *)self->_locationOfInterest hash];
  char has = (char)self->_has;
  if (has)
  {
    double confidence = self->_confidence;
    double v7 = -confidence;
    if (confidence >= 0.0) {
      double v7 = self->_confidence;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    double nextEntryTime = self->_nextEntryTime;
    double v12 = -nextEntryTime;
    if (nextEntryTime >= 0.0) {
      double v12 = self->_nextEntryTime;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v15 = 2654435761 * self->_modeOfTransportation;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v16 = 0;
    return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ [(NSData *)self->_geoData hash];
  }
  uint64_t v15 = 0;
  if ((has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_sourceType;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16 ^ [(NSData *)self->_geoData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  locationOfInterest = self->_locationOfInterest;
  uint64_t v6 = *((void *)v4 + 4);
  id v8 = v4;
  if (locationOfInterest)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableRoutineLocation mergeFrom:](locationOfInterest, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableRoutinePredictedLocation setLocationOfInterest:](self, "setLocationOfInterest:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 48);
  if (v7)
  {
    self->_double confidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 48);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_double nextEntryTime = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_modeOfTransportation = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_11:
    self->_uint64_t sourceType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 3))
  {
    -[HDCodableRoutinePredictedLocation setGeoData:](self, "setGeoData:");
    id v4 = v8;
  }
}

- (HDCodableRoutineLocation)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (double)confidence
{
  return self->_confidence;
}

- (double)nextEntryTime
{
  return self->_nextEntryTime;
}

- (NSData)geoData
{
  return self->_geoData;
}

- (void)setGeoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);

  objc_storeStrong((id *)&self->_geoData, 0);
}

@end