@interface HDCodableSyncIdentity
- (BOOL)hasDatabaseIdentifier;
- (BOOL)hasHardwareIdentifier;
- (BOOL)hasInstanceDiscriminator;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)databaseIdentifier;
- (NSData)hardwareIdentifier;
- (NSString)instanceDiscriminator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDatabaseIdentifier:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setInstanceDiscriminator:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSyncIdentity

- (BOOL)hasHardwareIdentifier
{
  return self->_hardwareIdentifier != 0;
}

- (BOOL)hasDatabaseIdentifier
{
  return self->_databaseIdentifier != 0;
}

- (BOOL)hasInstanceDiscriminator
{
  return self->_instanceDiscriminator != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSyncIdentity;
  v4 = [(HDCodableSyncIdentity *)&v8 description];
  v5 = [(HDCodableSyncIdentity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier) {
    [v3 setObject:hardwareIdentifier forKey:@"hardwareIdentifier"];
  }
  databaseIdentifier = self->_databaseIdentifier;
  if (databaseIdentifier) {
    [v4 setObject:databaseIdentifier forKey:@"databaseIdentifier"];
  }
  instanceDiscriminator = self->_instanceDiscriminator;
  if (instanceDiscriminator) {
    [v4 setObject:instanceDiscriminator forKey:@"instanceDiscriminator"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSyncIdentityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hardwareIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_databaseIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_instanceDiscriminator)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hardwareIdentifier)
  {
    objc_msgSend(v4, "setHardwareIdentifier:");
    id v4 = v5;
  }
  if (self->_databaseIdentifier)
  {
    objc_msgSend(v5, "setDatabaseIdentifier:");
    id v4 = v5;
  }
  if (self->_instanceDiscriminator)
  {
    objc_msgSend(v5, "setInstanceDiscriminator:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_hardwareIdentifier copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_databaseIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_instanceDiscriminator copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((hardwareIdentifier = self->_hardwareIdentifier, !((unint64_t)hardwareIdentifier | v4[2]))
     || -[NSData isEqual:](hardwareIdentifier, "isEqual:"))
    && ((databaseIdentifier = self->_databaseIdentifier, !((unint64_t)databaseIdentifier | v4[1]))
     || -[NSData isEqual:](databaseIdentifier, "isEqual:")))
  {
    instanceDiscriminator = self->_instanceDiscriminator;
    if ((unint64_t)instanceDiscriminator | v4[3]) {
      char v8 = -[NSString isEqual:](instanceDiscriminator, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_hardwareIdentifier hash];
  uint64_t v4 = [(NSData *)self->_databaseIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_instanceDiscriminator hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[HDCodableSyncIdentity setHardwareIdentifier:](self, "setHardwareIdentifier:");
  }
  if (v4[1]) {
    -[HDCodableSyncIdentity setDatabaseIdentifier:](self, "setDatabaseIdentifier:");
  }
  if (v4[3]) {
    -[HDCodableSyncIdentity setInstanceDiscriminator:](self, "setInstanceDiscriminator:");
  }
}

- (NSData)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (NSData)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(id)a3
{
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (void)setInstanceDiscriminator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);

  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

@end