@interface HDCloudSyncCodableRegisteredStore
- (BOOL)hasOwnerIdentifier;
- (BOOL)hasStoreIdentifier;
- (BOOL)hasSyncIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSyncIdentity)syncIdentity;
- (NSString)ownerIdentifier;
- (NSString)storeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setOwnerIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableRegisteredStore

- (BOOL)hasOwnerIdentifier
{
  return self->_ownerIdentifier != 0;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableRegisteredStore;
  v4 = [(HDCloudSyncCodableRegisteredStore *)&v8 description];
  v5 = [(HDCloudSyncCodableRegisteredStore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier) {
    [v3 setObject:ownerIdentifier forKey:@"ownerIdentifier"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v4 setObject:storeIdentifier forKey:@"storeIdentifier"];
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
  return HDCloudSyncCodableRegisteredStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ownerIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_ownerIdentifier)
  {
    objc_msgSend(v4, "setOwnerIdentifier:");
    id v4 = v5;
  }
  if (self->_storeIdentifier)
  {
    objc_msgSend(v5, "setStoreIdentifier:");
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
  uint64_t v6 = [(NSString *)self->_ownerIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_storeIdentifier copyWithZone:a3];
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
    && ((ownerIdentifier = self->_ownerIdentifier, !((unint64_t)ownerIdentifier | v4[1]))
     || -[NSString isEqual:](ownerIdentifier, "isEqual:"))
    && ((storeIdentifier = self->_storeIdentifier, !((unint64_t)storeIdentifier | v4[2]))
     || -[NSString isEqual:](storeIdentifier, "isEqual:")))
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
  NSUInteger v3 = [(NSString *)self->_ownerIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_storeIdentifier hash] ^ v3;
  return v4 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HDCloudSyncCodableRegisteredStore setOwnerIdentifier:](self, "setOwnerIdentifier:");
    NSUInteger v4 = v7;
  }
  if (v4[2])
  {
    -[HDCloudSyncCodableRegisteredStore setStoreIdentifier:](self, "setStoreIdentifier:");
    NSUInteger v4 = v7;
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
    -[HDCloudSyncCodableRegisteredStore setSyncIdentity:](self, "setSyncIdentity:");
  }
  NSUInteger v4 = v7;
LABEL_11:
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end