@interface HDCodableAuthorization
- (BOOL)hasAuthorizationMode;
- (BOOL)hasAuthorizationRequest;
- (BOOL)hasAuthorizationStatus;
- (BOOL)hasModificationDate;
- (BOOL)hasModificationEpoch;
- (BOOL)hasObjectType;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (double)modificationDate;
- (id)_modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)authorizationMode;
- (int64_t)authorizationRequest;
- (int64_t)authorizationStatus;
- (int64_t)modificationEpoch;
- (int64_t)objectType;
- (unint64_t)hash;
- (void)_setAuthorizationModeWithNumber:(id)a3;
- (void)_setAuthorizationRequestWithNumber:(id)a3;
- (void)_setAuthorizationStatusWithNumber:(id)a3;
- (void)_setDataTypeCodeWithObjectType:(id)a3;
- (void)_setModificationDate:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationMode:(int64_t)a3;
- (void)setAuthorizationRequest:(int64_t)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setHasAuthorizationMode:(BOOL)a3;
- (void)setHasAuthorizationRequest:(BOOL)a3;
- (void)setHasAuthorizationStatus:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasModificationEpoch:(BOOL)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setModificationEpoch:(int64_t)a3;
- (void)setObjectType:(int64_t)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableAuthorization

- (void)setObjectType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_objectType = a3;
}

- (void)setHasObjectType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasObjectType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAuthorizationStatus
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAuthorizationRequest:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_authorizationRequest = a3;
}

- (void)setHasAuthorizationRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAuthorizationRequest
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setModificationEpoch:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_modificationEpoch = a3;
}

- (void)setHasModificationEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasModificationEpoch
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAuthorizationMode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authorizationMode = a3;
}

- (void)setHasAuthorizationMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthorizationMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableAuthorization;
  v4 = [(HDCodableAuthorization *)&v8 description];
  v5 = [(HDCodableAuthorization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_objectType];
    [v3 setObject:v9 forKey:@"objectType"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_authorizationStatus];
  [v3 setObject:v10 forKey:@"authorizationStatus"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = [NSNumber numberWithLongLong:self->_authorizationRequest];
  [v3 setObject:v11 forKey:@"authorizationRequest"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = [NSNumber numberWithDouble:self->_modificationDate];
  [v3 setObject:v12 forKey:@"modificationDate"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  v13 = [NSNumber numberWithLongLong:self->_modificationEpoch];
  [v3 setObject:v13 forKey:@"modificationEpoch"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v5 = [NSNumber numberWithLongLong:self->_authorizationMode];
    [v3 setObject:v5 forKey:@"authorizationMode"];
  }
LABEL_8:
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v7 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"syncIdentity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[6] = self->_objectType;
    *((unsigned char *)v4 + 64) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_authorizationStatus;
  *((unsigned char *)v4 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[2] = self->_authorizationRequest;
  *((unsigned char *)v4 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[4] = *(void *)&self->_modificationDate;
  *((unsigned char *)v4 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  v4[5] = self->_modificationEpoch;
  *((unsigned char *)v4 + 64) |= 0x10u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v4[1] = self->_authorizationMode;
    *((unsigned char *)v4 + 64) |= 1u;
  }
LABEL_8:
  if (self->_syncIdentity)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSyncIdentity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_objectType;
    *(unsigned char *)(v5 + 64) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_authorizationStatus;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(void *)(v5 + 16) = self->_authorizationRequest;
  *(unsigned char *)(v5 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(void *)(v5 + 40) = self->_modificationEpoch;
    *(unsigned char *)(v5 + 64) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(double *)(v5 + 32) = self->_modificationDate;
  *(unsigned char *)(v5 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if (has)
  {
LABEL_7:
    *(void *)(v5 + 8) = self->_authorizationMode;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
LABEL_8:
  id v8 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v9 = (void *)v6[7];
  v6[7] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_objectType != *((void *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
LABEL_34:
    char v6 = 0;
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_authorizationStatus != *((void *)v4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_authorizationRequest != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_modificationDate != *((double *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_modificationEpoch != *((void *)v4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_authorizationMode != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_34;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 7)) {
    char v6 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_35:

  return v6;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v4 = 2654435761 * self->_objectType;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_authorizationStatus;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_authorizationRequest;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double modificationDate = self->_modificationDate;
  double v8 = -modificationDate;
  if (modificationDate >= 0.0) {
    double v8 = self->_modificationDate;
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
LABEL_15:
  if ((has & 0x10) != 0)
  {
    uint64_t v12 = 2654435761 * self->_modificationEpoch;
    if (has) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v13 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  }
  uint64_t v12 = 0;
  if ((has & 1) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v13 = 2654435761 * self->_authorizationMode;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 0x20) != 0)
  {
    self->_objectType = *((void *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)v4 + 64);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_authorizationStatus = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_authorizationRequest = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double modificationDate = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 0x10) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_modificationEpoch = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if (*((unsigned char *)v4 + 64))
  {
LABEL_7:
    self->_authorizationMode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
  syncIdentity = self->_syncIdentity;
  uint64_t v8 = v5[7];
  if (syncIdentity)
  {
    if (!v8) {
      goto LABEL_20;
    }
    long double v9 = v5;
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_20;
    }
    long double v9 = v5;
    -[HDCodableAuthorization setSyncIdentity:](self, "setSyncIdentity:");
  }
  uint64_t v5 = v9;
LABEL_20:
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (int64_t)authorizationRequest
{
  return self->_authorizationRequest;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (int64_t)modificationEpoch
{
  return self->_modificationEpoch;
}

- (int64_t)authorizationMode
{
  return self->_authorizationMode;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_setDataTypeCodeWithObjectType:(id)a3
{
  uint64_t v4 = [a3 code];

  [(HDCodableAuthorization *)self setObjectType:v4];
}

- (void)_setAuthorizationStatusWithNumber:(id)a3
{
  uint64_t v4 = [a3 integerValue];

  [(HDCodableAuthorization *)self setAuthorizationStatus:v4];
}

- (void)_setAuthorizationRequestWithNumber:(id)a3
{
  uint64_t v4 = [a3 integerValue];

  [(HDCodableAuthorization *)self setAuthorizationRequest:v4];
}

- (void)_setAuthorizationModeWithNumber:(id)a3
{
  uint64_t v4 = [a3 integerValue];

  [(HDCodableAuthorization *)self setAuthorizationMode:v4];
}

- (id)_modificationDate
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v2 = HDDecodeDateForValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setModificationDate:(id)a3
{
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    -[HDCodableAuthorization setModificationDate:](self, "setModificationDate:");
  }
  else
  {
    -[HDCodableAuthorization setHasModificationDate:](self, "setHasModificationDate:");
  }
}

@end