@interface HDCodableContributor
- (BOOL)deleted;
- (BOOL)hasAppleID;
- (BOOL)hasCallerID;
- (BOOL)hasDeleted;
- (BOOL)hasModificationDate;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)uuid;
- (NSString)appleID;
- (NSString)callerID;
- (double)modificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setCallerID:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setModificationDate:(double)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableContributor

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModificationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasAppleID
{
  return self->_appleID != 0;
}

- (BOOL)hasCallerID
{
  return self->_callerID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableContributor;
  v4 = [(HDCodableContributor *)&v8 description];
  v5 = [(HDCodableContributor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v7 forKey:@"deleted"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_modificationDate];
    [v4 setObject:v8 forKey:@"modificationDate"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v10 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"syncIdentity"];
  }
  appleID = self->_appleID;
  if (appleID) {
    [v4 setObject:appleID forKey:@"appleID"];
  }
  callerID = self->_callerID;
  if (callerID) {
    [v4 setObject:callerID forKey:@"callerID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableContributorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_appleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_callerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_deleted;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_modificationDate;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
  if (self->_appleID)
  {
    objc_msgSend(v6, "setAppleID:");
    id v4 = v6;
  }
  if (self->_callerID)
  {
    objc_msgSend(v6, "setCallerID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_deleted;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_modificationDate;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v9 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_appleID copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_callerID copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_23;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_12;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_modificationDate != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_23;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 4)
    && !-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:"))
  {
    goto LABEL_23;
  }
  appleID = self->_appleID;
  if ((unint64_t)appleID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appleID, "isEqual:")) {
      goto LABEL_23;
    }
  }
  callerID = self->_callerID;
  if ((unint64_t)callerID | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](callerID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_deleted;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
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
  unint64_t v10 = v4 ^ v3 ^ v9 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  NSUInteger v11 = [(NSString *)self->_appleID hash];
  return v10 ^ v11 ^ [(NSString *)self->_callerID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[HDCodableContributor setUuid:](self, "setUuid:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_deleted = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if (v5)
  {
    self->_double modificationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v7 = *((void *)v4 + 4);
  if (syncIdentity)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[HDCodableContributor setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v8;
LABEL_13:
  if (*((void *)v4 + 2))
  {
    -[HDCodableContributor setAppleID:](self, "setAppleID:");
    id v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[HDCodableContributor setCallerID:](self, "setCallerID:");
    id v4 = v8;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_callerID, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

@end