@interface HDCodableObjectSourceAuthorization
- (BOOL)hasAuthorizationStatus;
- (BOOL)hasModificationDate;
- (BOOL)hasSessionUUID;
- (BOOL)hasSourceUUID;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)sessionUUID;
- (NSData)sourceUUID;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)authorizationStatus;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setHasAuthorizationStatus:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSourceUUID:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableObjectSourceAuthorization

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthorizationStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectSourceAuthorization;
  v4 = [(HDCodableObjectSourceAuthorization *)&v8 description];
  v5 = [(HDCodableObjectSourceAuthorization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sourceUUID = self->_sourceUUID;
  if (sourceUUID) {
    [v3 setObject:sourceUUID forKey:@"sourceUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_authorizationStatus];
    [v4 setObject:v7 forKey:@"authorizationStatus"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v8 forKey:@"modificationDate"];
  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v4 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v11 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectSourceAuthorizationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_sessionUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceUUID)
  {
    objc_msgSend(v4, "setSourceUUID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_authorizationStatus;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if (self->_sessionUUID)
  {
    objc_msgSend(v6, "setSessionUUID:");
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_sourceUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_authorizationStatus;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_modificationDate;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v9 = [(NSData *)self->_sessionUUID copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_authorizationStatus != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_modificationDate != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 3) && !-[NSData isEqual:](sessionUUID, "isEqual:")) {
    goto LABEL_18;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 5)) {
    char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_sourceUUID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_authorizationStatus;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double modificationDate = self->_modificationDate;
  double v6 = -modificationDate;
  if (modificationDate >= 0.0) {
    double v6 = self->_modificationDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  uint64_t v10 = v4 ^ v3 ^ v9 ^ [(NSData *)self->_sessionUUID hash];
  return v10 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[HDCodableObjectSourceAuthorization setSourceUUID:](self, "setSourceUUID:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_authorizationStatus = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_double modificationDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableObjectSourceAuthorization setSessionUUID:](self, "setSessionUUID:");
    id v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = *((void *)v4 + 5);
  if (syncIdentity)
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    -[HDCodableObjectSourceAuthorization setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v8;
LABEL_15:
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
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
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_sourceUUID, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end