@interface HDCodableTypedObjectAssociation
- (BOOL)deleted;
- (BOOL)hasAssociationUUID;
- (BOOL)hasCreationDate;
- (BOOL)hasDeleted;
- (BOOL)hasObjectUUIDs;
- (BOOL)hasSubObjectUUID;
- (BOOL)hasSyncIdentity;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (HDCodableTypedObjectAssociation)initWithIntermediateSyncAssociation:(id)a3;
- (NSData)associationUUID;
- (NSData)objectUUIDs;
- (NSData)subObjectUUID;
- (double)creationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedAssociationUUID;
- (id)decodedCreationDate;
- (id)decodedSubObjectUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociationUUID:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setObjectUUIDs:(id)a3;
- (void)setSubObjectUUID:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableTypedObjectAssociation

- (BOOL)hasAssociationUUID
{
  return self->_associationUUID != 0;
}

- (BOOL)hasObjectUUIDs
{
  return self->_objectUUIDs != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSubObjectUUID
{
  return self->_subObjectUUID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableTypedObjectAssociation;
  v4 = [(HDCodableTypedObjectAssociation *)&v8 description];
  v5 = [(HDCodableTypedObjectAssociation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  associationUUID = self->_associationUUID;
  if (associationUUID) {
    [v3 setObject:associationUUID forKey:@"associationUUID"];
  }
  objectUUIDs = self->_objectUUIDs;
  if (objectUUIDs) {
    [v4 setObject:objectUUIDs forKey:@"objectUUIDs"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    objc_super v8 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"syncIdentity"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_type];
    [v4 setObject:v13 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  v14 = [NSNumber numberWithBool:self->_deleted];
  [v4 setObject:v14 forKey:@"deleted"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    v10 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v10 forKey:@"creationDate"];
  }
LABEL_11:
  subObjectUUID = self->_subObjectUUID;
  if (subObjectUUID) {
    [v4 setObject:subObjectUUID forKey:@"subObjectUUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableTypedObjectAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_associationUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_objectUUIDs)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_11:
  if (self->_subObjectUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_associationUUID)
  {
    objc_msgSend(v4, "setAssociationUUID:");
    id v4 = v6;
  }
  if (self->_objectUUIDs)
  {
    objc_msgSend(v6, "setObjectUUIDs:");
    id v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_type;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 56) = self->_deleted;
  *((unsigned char *)v4 + 60) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 60) |= 1u;
  }
LABEL_11:
  if (self->_subObjectUUID)
  {
    objc_msgSend(v6, "setSubObjectUUID:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_associationUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_objectUUIDs copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 56) = self->_deleted;
    *(unsigned char *)(v5 + 60) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 60) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_5:
  uint64_t v13 = [(NSData *)self->_subObjectUUID copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  associationUUID = self->_associationUUID;
  if ((unint64_t)associationUUID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](associationUUID, "isEqual:")) {
      goto LABEL_28;
    }
  }
  objectUUIDs = self->_objectUUIDs;
  if ((unint64_t)objectUUIDs | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](objectUUIDs, "isEqual:")) {
      goto LABEL_28;
    }
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 6))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_type != *((void *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_28;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_21;
      }
    }
LABEL_28:
    char v9 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_28;
  }
LABEL_21:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  subObjectUUID = self->_subObjectUUID;
  if ((unint64_t)subObjectUUID | *((void *)v4 + 5)) {
    char v9 = -[NSData isEqual:](subObjectUUID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_29:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_associationUUID hash];
  uint64_t v4 = [(NSData *)self->_objectUUIDs hash];
  unint64_t v5 = [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ [(NSData *)self->_subObjectUUID hash];
  }
  uint64_t v6 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_deleted;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double creationDate = self->_creationDate;
  double v9 = -creationDate;
  if (creationDate >= 0.0) {
    double v9 = self->_creationDate;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v12 ^ [(NSData *)self->_subObjectUUID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[HDCodableTypedObjectAssociation setAssociationUUID:](self, "setAssociationUUID:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[HDCodableTypedObjectAssociation setObjectUUIDs:](self, "setObjectUUIDs:");
    id v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = *((void *)v4 + 6);
  if (syncIdentity)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[HDCodableTypedObjectAssociation setSyncIdentity:](self, "setSyncIdentity:");
  }
  id v4 = v8;
LABEL_11:
  char v7 = *((unsigned char *)v4 + 60);
  if ((v7 & 2) != 0)
  {
    self->_type = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 60);
    if ((v7 & 4) == 0)
    {
LABEL_13:
      if ((v7 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_deleted = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_14:
    self->_double creationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((void *)v4 + 5))
  {
    -[HDCodableTypedObjectAssociation setSubObjectUUID:](self, "setSubObjectUUID:");
    id v4 = v8;
  }
}

- (NSData)associationUUID
{
  return self->_associationUUID;
}

- (void)setAssociationUUID:(id)a3
{
}

- (NSData)objectUUIDs
{
  return self->_objectUUIDs;
}

- (void)setObjectUUIDs:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (NSData)subObjectUUID
{
  return self->_subObjectUUID;
}

- (void)setSubObjectUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_subObjectUUID, 0);
  objc_storeStrong((id *)&self->_objectUUIDs, 0);

  objc_storeStrong((id *)&self->_associationUUID, 0);
}

- (HDCodableTypedObjectAssociation)initWithIntermediateSyncAssociation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDCodableTypedObjectAssociation;
  unint64_t v5 = [(HDCodableTypedObjectAssociation *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 associationUUID];
    char v7 = objc_msgSend(v6, "hk_dataForUUIDBytes");
    [(HDCodableTypedObjectAssociation *)v5 setAssociationUUID:v7];

    -[HDCodableTypedObjectAssociation setType:](v5, "setType:", [v4 type]);
    -[HDCodableTypedObjectAssociation setDeleted:](v5, "setDeleted:", [v4 deleted]);
    id v8 = [v4 creationDate];
    [v8 timeIntervalSinceReferenceDate];
    -[HDCodableTypedObjectAssociation setCreationDate:](v5, "setCreationDate:");

    double v9 = [v4 destinationSubObjectUUID];

    if (v9)
    {
      long double v10 = [v4 destinationSubObjectUUID];
      double v11 = objc_msgSend(v10, "hk_dataForUUIDBytes");
      [(HDCodableTypedObjectAssociation *)v5 setSubObjectUUID:v11];
    }
  }

  return v5;
}

- (id)decodedAssociationUUID
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_associationUUID);
}

- (id)decodedCreationDate
{
  if (*(unsigned char *)&self->_has)
  {
    v2 = HDDecodeDateForValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedSubObjectUUID
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_subObjectUUID);
}

@end