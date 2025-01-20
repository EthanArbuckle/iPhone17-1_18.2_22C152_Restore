@interface BMPBFindMyLocationChangeEvent
- (BOOL)hasActivityState;
- (BOOL)hasIdsHandle;
- (BOOL)hasLatitude;
- (BOOL)hasLocationChangeType;
- (BOOL)hasLongitude;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)idsHandle;
- (NSString)name;
- (double)latitude;
- (double)longitude;
- (id)activityStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationChangeTypeAsString:(int)a3;
- (int)StringAsActivityState:(id)a3;
- (int)StringAsLocationChangeType:(id)a3;
- (int)activityState;
- (int)locationChangeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityState:(int)a3;
- (void)setHasActivityState:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationChangeType:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setIdsHandle:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationChangeType:(int)a3;
- (void)setLongitude:(double)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBFindMyLocationChangeEvent

- (BOOL)hasIdsHandle
{
  return self->_idsHandle != 0;
}

- (int)locationChangeType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_locationChangeType;
  }
  else {
    return 0;
  }
}

- (void)setLocationChangeType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_locationChangeType = a3;
}

- (void)setHasLocationChangeType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationChangeType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)locationChangeTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8478[a3];
  }

  return v3;
}

- (int)StringAsLocationChangeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"StartedSharing"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"StoppedSharing"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)activityState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_activityState;
  }
  else {
    return 0;
  }
}

- (void)setActivityState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_activityState = a3;
}

- (void)setHasActivityState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActivityState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)activityStateAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8490[a3];
  }

  return v3;
}

- (int)StringAsActivityState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Stationary"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Walking"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Running"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cycling"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Automotive"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBFindMyLocationChangeEvent;
  int v4 = [(BMPBFindMyLocationChangeEvent *)&v8 description];
  v5 = [(BMPBFindMyLocationChangeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  idsHandle = self->_idsHandle;
  if (idsHandle) {
    [v3 setObject:idsHandle forKey:@"idsHandle"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t locationChangeType = self->_locationChangeType;
    if (locationChangeType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_locationChangeType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D8478[locationChangeType];
    }
    [v4 setObject:v8 forKey:@"locationChangeType"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t activityState = self->_activityState;
    if (activityState >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_activityState);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E55D8490[activityState];
    }
    [v4 setObject:v10 forKey:@"activityState"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = [NSNumber numberWithDouble:self->_latitude];
    [v4 setObject:v11 forKey:@"latitude"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithDouble:self->_longitude];
    [v4 setObject:v12 forKey:@"longitude"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBFindMyLocationChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_idsHandle)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_8:
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_idsHandle)
  {
    objc_msgSend(v4, "setIdsHandle:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_locationChangeType;
    *((unsigned char *)v4 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_activityState;
  *((unsigned char *)v4 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((void *)v4 + 1) = *(void *)&self->_latitude;
  *((unsigned char *)v4 + 56) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    *((void *)v4 + 2) = *(void *)&self->_longitude;
    *((unsigned char *)v4 + 56) |= 2u;
  }
LABEL_8:
  if (self->_name)
  {
    objc_msgSend(v6, "setName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idsHandle copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_locationChangeType;
    *(unsigned char *)(v5 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(double *)(v5 + 8) = self->_latitude;
      *(unsigned char *)(v5 + 56) |= 1u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_activityState;
  *(unsigned char *)(v5 + 56) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_longitude;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
LABEL_6:
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  idsHandle = self->_idsHandle;
  if ((unint64_t)idsHandle | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](idsHandle, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_locationChangeType != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
LABEL_26:
    char v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_activityState != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_latitude != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_longitude != *((double *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 6)) {
    char v7 = -[NSString isEqual:](name, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idsHandle hash];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = 2654435761 * self->_locationChangeType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_activityState;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double latitude = self->_latitude;
  double v8 = -latitude;
  if (latitude >= 0.0) {
    double v8 = self->_latitude;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_13:
  if ((has & 2) != 0)
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
  return v5 ^ v3 ^ v6 ^ v11 ^ v12 ^ [(NSString *)self->_name hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[BMPBFindMyLocationChangeEvent setIdsHandle:](self, "setIdsHandle:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 8) != 0)
  {
    self->_uint64_t locationChangeType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_uint64_t activityState = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double latitude = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_7:
    self->_double longitude = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_8:
  if (*((void *)v4 + 6))
  {
    -[BMPBFindMyLocationChangeEvent setName:](self, "setName:");
    id v4 = v6;
  }
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

@end