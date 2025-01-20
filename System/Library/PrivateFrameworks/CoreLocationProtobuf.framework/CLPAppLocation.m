@interface CLPAppLocation
- (BOOL)hasAge;
- (BOOL)hasLoiType;
- (BOOL)hasRoutineMode;
- (BOOL)hasServerHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPLocation)location;
- (NSString)appBundleId;
- (double)age;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)appState;
- (int)loiType;
- (int)routineMode;
- (int)serverHash;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(double)a3;
- (void)setAppBundleId:(id)a3;
- (void)setAppState:(int)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasLoiType:(BOOL)a3;
- (void)setHasRoutineMode:(BOOL)a3;
- (void)setHasServerHash:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLoiType:(int)a3;
- (void)setRoutineMode:(int)a3;
- (void)setServerHash:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPAppLocation

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

- (int)routineMode
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_routineMode;
  }
  else {
    return -1;
  }
}

- (void)setRoutineMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_routineMode = a3;
}

- (void)setHasRoutineMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRoutineMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)loiType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_loiType;
  }
  else {
    return -1;
  }
}

- (void)setLoiType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_loiType = a3;
}

- (void)setHasLoiType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLoiType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPAppLocation;
  v4 = [(CLPAppLocation *)&v8 description];
  v5 = [(CLPAppLocation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v3 setObject:appBundleId forKey:@"appBundleId"];
  }
  v6 = [NSNumber numberWithInt:self->_appState];
  [v4 setObject:v6 forKey:@"appState"];

  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_age];
    [v4 setObject:v7 forKey:@"age"];
  }
  location = self->_location;
  if (location)
  {
    v9 = [(CLPLocation *)location dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"location"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_serverHash];
    [v4 setObject:v13 forKey:@"serverHash"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v14 = [NSNumber numberWithInt:self->_routineMode];
  [v4 setObject:v14 forKey:@"routineMode"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    v11 = [NSNumber numberWithInt:self->_loiType];
    [v4 setObject:v11 forKey:@"loiType"];
  }
LABEL_11:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CLPAppLocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_appBundleId) {
    -[CLPAppLocation writeTo:]();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (!self->_location) {
    -[CLPAppLocation writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setAppBundleId:self->_appBundleId];
  *((_DWORD *)v5 + 6) = self->_appState;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v5 + 1) = *(void *)&self->_age;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  [v5 setLocation:self->_location];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_serverHash;
    *((unsigned char *)v5 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 11) = self->_routineMode;
  *((unsigned char *)v5 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 10) = self->_loiType;
    *((unsigned char *)v5 + 52) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appBundleId copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 24) = self->_appState;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_age;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v8 = [(CLPLocation *)self->_location copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v5 + 44) = self->_routineMode;
    *(unsigned char *)(v5 + 52) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 48) = self->_serverHash;
  *(unsigned char *)(v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 40) = self->_loiType;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (self->_appState != *((_DWORD *)v4 + 6)) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_age != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_27;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 4))
  {
    if (!-[CLPLocation isEqual:](location, "isEqual:"))
    {
LABEL_27:
      BOOL v8 = 0;
      goto LABEL_28;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_serverHash != *((_DWORD *)v4 + 12)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_routineMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_27;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_loiType != *((_DWORD *)v4 + 10)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleId hash];
  uint64_t appState = self->_appState;
  if (*(unsigned char *)&self->_has)
  {
    double age = self->_age;
    double v7 = -age;
    if (age >= 0.0) {
      double v7 = self->_age;
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
  unint64_t v10 = [(CLPLocation *)self->_location hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v13 = 0;
    return (2654435761 * appState) ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v11 = 2654435761 * self->_serverHash;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_routineMode;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_loiType;
  return (2654435761 * appState) ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[CLPAppLocation setAppBundleId:](self, "setAppBundleId:");
    id v4 = v8;
  }
  self->_uint64_t appState = *((_DWORD *)v4 + 6);
  if (*((unsigned char *)v4 + 52))
  {
    self->_double age = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 4);
  if (location)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[CLPLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[CLPAppLocation setLocation:](self, "setLocation:");
  }
  id v4 = v8;
LABEL_11:
  char v7 = *((unsigned char *)v4 + 52);
  if ((v7 & 8) != 0)
  {
    self->_serverHash = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 52);
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 2) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_routineMode = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_14:
    self->_loiType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_15:

  MEMORY[0x1F41817F8]();
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (int)appState
{
  return self->_appState;
}

- (void)setAppState:(int)a3
{
  self->_uint64_t appState = a3;
}

- (double)age
{
  return self->_age;
}

- (CLPLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)serverHash
{
  return self->_serverHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CLPAppLocation writeTo:]", "CLPCollectionRequest.gen.m", 1434, "nil != self->_appBundleId");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[CLPAppLocation writeTo:]", "CLPCollectionRequest.gen.m", 1450, "self->_location != nil");
}

@end