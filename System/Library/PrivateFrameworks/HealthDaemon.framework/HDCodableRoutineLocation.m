@interface HDCodableRoutineLocation
+ (Class)visitsType;
- (BOOL)hasConfidence;
- (BOOL)hasGeoData;
- (BOOL)hasLatitude;
- (BOOL)hasLocationOfInterestType;
- (BOOL)hasLongitude;
- (BOOL)hasUncertainty;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)geoData;
- (NSMutableArray)visits;
- (NSString)uuid;
- (double)confidence;
- (double)latitude;
- (double)longitude;
- (double)uncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationOfInterestTypeAsString:(int)a3;
- (id)visitsAtIndex:(unint64_t)a3;
- (int)StringAsLocationOfInterestType:(id)a3;
- (int)locationOfInterestType;
- (unint64_t)hash;
- (unint64_t)visitsCount;
- (void)addVisits:(id)a3;
- (void)clearVisits;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setGeoData:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationOfInterestType:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasUncertainty:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationOfInterestType:(int)a3;
- (void)setLongitude:(double)a3;
- (void)setUncertainty:(double)a3;
- (void)setUuid:(id)a3;
- (void)setVisits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableRoutineLocation

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLatitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUncertainty:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUncertainty
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)locationOfInterestType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_locationOfInterestType;
  }
  else {
    return -1;
  }
}

- (void)setLocationOfInterestType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_locationOfInterestType = a3;
}

- (void)setHasLocationOfInterestType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLocationOfInterestType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)locationOfInterestTypeAsString:(int)a3
{
  if ((a3 + 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62F4378[a3 + 1];
  }

  return v3;
}

- (int)StringAsLocationOfInterestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownLocation"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"School"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Gym"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (BOOL)hasGeoData
{
  return self->_geoData != 0;
}

- (void)clearVisits
{
}

- (void)addVisits:(id)a3
{
  id v4 = a3;
  visits = self->_visits;
  id v8 = v4;
  if (!visits)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_visits;
    self->_visits = v6;

    id v4 = v8;
    visits = self->_visits;
  }
  [(NSMutableArray *)visits addObject:v4];
}

- (unint64_t)visitsCount
{
  return [(NSMutableArray *)self->_visits count];
}

- (id)visitsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visits objectAtIndex:a3];
}

+ (Class)visitsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableRoutineLocation;
  id v4 = [(HDCodableRoutineLocation *)&v8 description];
  v5 = [(HDCodableRoutineLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_latitude];
    [v3 setObject:v9 forKey:@"latitude"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v10 forKey:@"longitude"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v11 = [NSNumber numberWithDouble:self->_uncertainty];
  [v3 setObject:v11 forKey:@"uncertainty"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_confidence];
    [v3 setObject:v5 forKey:@"confidence"];
  }
LABEL_6:
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v7 = self->_locationOfInterestType + 1;
    if (v7 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_locationOfInterestType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E62F4378[v7];
    }
    [v3 setObject:v8 forKey:@"locationOfInterestType"];
  }
  geoData = self->_geoData;
  if (geoData) {
    [v3 setObject:geoData forKey:@"geoData"];
  }
  if ([(NSMutableArray *)self->_visits count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_visits, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_visits;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v21 + 1) + 8 * i) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"visits"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableRoutineLocationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_geoData) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_visits;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_latitude;
    *((unsigned char *)v4 + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(void *)&self->_longitude;
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_21:
  v4[4] = *(void *)&self->_uncertainty;
  *((unsigned char *)v4 + 72) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[1] = *(void *)&self->_confidence;
    *((unsigned char *)v4 + 72) |= 1u;
  }
LABEL_6:
  v10 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_locationOfInterestType;
    *((unsigned char *)v4 + 72) |= 0x10u;
  }
  if (self->_geoData) {
    objc_msgSend(v10, "setGeoData:");
  }
  if ([(HDCodableRoutineLocation *)self visitsCount])
  {
    [v10 clearVisits];
    unint64_t v6 = [(HDCodableRoutineLocation *)self visitsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableRoutineLocation *)self visitsAtIndex:i];
        [v10 addVisits:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_latitude;
    *(unsigned char *)(v5 + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_longitude;
  *(unsigned char *)(v5 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  *(double *)(v5 + 32) = self->_uncertainty;
  *(unsigned char *)(v5 + 72) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_locationOfInterestType;
    *(unsigned char *)(v6 + 72) |= 0x10u;
  }
  uint64_t v10 = [(NSData *)self->_geoData copyWithZone:a3];
  long long v11 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_visits;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v6 addVisits:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 72);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_latitude != *((double *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_longitude != *((double *)v4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_uncertainty != *((double *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_confidence != *((double *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_34;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_34:
      char v10 = 0;
      goto LABEL_35;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 72);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_locationOfInterestType != *((_DWORD *)v4 + 12)) {
      goto LABEL_34;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_34;
  }
  geoData = self->_geoData;
  if ((unint64_t)geoData | *((void *)v4 + 5) && !-[NSData isEqual:](geoData, "isEqual:")) {
    goto LABEL_34;
  }
  visits = self->_visits;
  if ((unint64_t)visits | *((void *)v4 + 8)) {
    char v10 = -[NSMutableArray isEqual:](visits, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_35:

  return v10;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
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
  if ((has & 4) != 0)
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
  if ((has & 8) != 0)
  {
    double uncertainty = self->_uncertainty;
    double v16 = -uncertainty;
    if (uncertainty >= 0.0) {
      double v16 = self->_uncertainty;
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
    double confidence = self->_confidence;
    double v21 = -confidence;
    if (confidence >= 0.0) {
      double v21 = self->_confidence;
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
  NSUInteger v24 = [(NSString *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v25 = 2654435761 * self->_locationOfInterestType;
  }
  else {
    uint64_t v25 = 0;
  }
  unint64_t v26 = v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v24;
  uint64_t v27 = [(NSData *)self->_geoData hash];
  return v26 ^ v27 ^ [(NSMutableArray *)self->_visits hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_double latitude = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 72);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if (((_BYTE)v4[9] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double longitude = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  self->_double uncertainty = v4[4];
  *(unsigned char *)&self->_has |= 8u;
  if ((_BYTE)v4[9])
  {
LABEL_5:
    self->_double confidence = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((void *)v4 + 7)) {
    -[HDCodableRoutineLocation setUuid:](self, "setUuid:");
  }
  if (((_BYTE)v5[9] & 0x10) != 0)
  {
    self->_locationOfInterestType = *((_DWORD *)v5 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 5)) {
    -[HDCodableRoutineLocation setGeoData:](self, "setGeoData:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HDCodableRoutineLocation addVisits:](self, "addVisits:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
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

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)geoData
{
  return self->_geoData;
}

- (void)setGeoData:(id)a3
{
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_geoData, 0);
}

@end