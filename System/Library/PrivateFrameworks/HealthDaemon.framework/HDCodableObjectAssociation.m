@interface HDCodableObjectAssociation
- (BOOL)hasAssociationUuid;
- (BOOL)hasObjectUuids;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableObjectAssociation)initWithAssociationUUID:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSData)associationUuid;
- (NSData)objectUuids;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedAssociationUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociationUuid:(id)a3;
- (void)setObjectUuids:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableObjectAssociation

- (HDCodableObjectAssociation)initWithAssociationUUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectAssociation;
  v5 = [(HDCodableObjectAssociation *)&v8 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "hk_dataForUUIDBytes");
    [(HDCodableObjectAssociation *)v5 setAssociationUuid:v6];
  }
  return v5;
}

- (void)setAssociationUuid:(id)a3
{
}

- (void)setObjectUuids:(id)a3
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_associationUuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_objectUuids)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_objectUuids, 0);

  objc_storeStrong((id *)&self->_associationUuid, 0);
}

- (id)decodedAssociationUUID
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_associationUuid);
}

- (BOOL)hasAssociationUuid
{
  return self->_associationUuid != 0;
}

- (BOOL)hasObjectUuids
{
  return self->_objectUuids != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableObjectAssociation;
  id v4 = [(HDCodableObjectAssociation *)&v8 description];
  id v5 = [(HDCodableObjectAssociation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  associationUuid = self->_associationUuid;
  if (associationUuid) {
    [v3 setObject:associationUuid forKey:@"associationUuid"];
  }
  objectUuids = self->_objectUuids;
  if (objectUuids) {
    [v4 setObject:objectUuids forKey:@"objectUuids"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    objc_super v8 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"syncIdentity"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableObjectAssociationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_associationUuid)
  {
    objc_msgSend(v4, "setAssociationUuid:");
    id v4 = v5;
  }
  if (self->_objectUuids)
  {
    objc_msgSend(v5, "setObjectUuids:");
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v5, "setSyncIdentity:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_associationUuid copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_objectUuids copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((associationUuid = self->_associationUuid, !((unint64_t)associationUuid | v4[1]))
     || -[NSData isEqual:](associationUuid, "isEqual:"))
    && ((objectUuids = self->_objectUuids, !((unint64_t)objectUuids | v4[2]))
     || -[NSData isEqual:](objectUuids, "isEqual:")))
  {
    syncIdentity = self->_syncIdentity;
    if ((unint64_t)syncIdentity | v4[3]) {
      char v8 = -[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_associationUuid hash];
  uint64_t v4 = [(NSData *)self->_objectUuids hash] ^ v3;
  return v4 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HDCodableObjectAssociation setAssociationUuid:](self, "setAssociationUuid:");
    uint64_t v4 = v7;
  }
  if (v4[2])
  {
    -[HDCodableObjectAssociation setObjectUuids:](self, "setObjectUuids:");
    uint64_t v4 = v7;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v6 = v4[3];
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
    -[HDCodableObjectAssociation setSyncIdentity:](self, "setSyncIdentity:");
  }
  uint64_t v4 = v7;
LABEL_11:
}

- (NSData)associationUuid
{
  return self->_associationUuid;
}

- (NSData)objectUuids
{
  return self->_objectUuids;
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

@end