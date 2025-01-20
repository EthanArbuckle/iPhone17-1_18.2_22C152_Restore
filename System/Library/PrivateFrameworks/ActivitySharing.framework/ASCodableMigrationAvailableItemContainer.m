@interface ASCodableMigrationAvailableItemContainer
- (ASCodableCloudKitMigrationAvailableItem)migrationAvailableItem;
- (BOOL)hasMigrationAvailableItem;
- (BOOL)hasSystemFieldsOnlyRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)systemFieldsOnlyRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMigrationAvailableItem:(id)a3;
- (void)setSystemFieldsOnlyRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableMigrationAvailableItemContainer

- (BOOL)hasMigrationAvailableItem
{
  return self->_migrationAvailableItem != 0;
}

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableMigrationAvailableItemContainer;
  v4 = [(ASCodableMigrationAvailableItemContainer *)&v8 description];
  v5 = [(ASCodableMigrationAvailableItemContainer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  migrationAvailableItem = self->_migrationAvailableItem;
  if (migrationAvailableItem)
  {
    v5 = [(ASCodableCloudKitMigrationAvailableItem *)migrationAvailableItem dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"migrationAvailableItem"];
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord) {
    [v3 setObject:systemFieldsOnlyRecord forKey:@"systemFieldsOnlyRecord"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableMigrationAvailableItemContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_migrationAvailableItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_migrationAvailableItem)
  {
    objc_msgSend(v4, "setMigrationAvailableItem:");
    id v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ASCodableCloudKitMigrationAvailableItem *)self->_migrationAvailableItem copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_systemFieldsOnlyRecord copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((migrationAvailableItem = self->_migrationAvailableItem, !((unint64_t)migrationAvailableItem | v4[1]))
     || -[ASCodableCloudKitMigrationAvailableItem isEqual:](migrationAvailableItem, "isEqual:")))
  {
    systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
    if ((unint64_t)systemFieldsOnlyRecord | v4[2]) {
      char v7 = -[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ASCodableCloudKitMigrationAvailableItem *)self->_migrationAvailableItem hash];
  return [(NSData *)self->_systemFieldsOnlyRecord hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  migrationAvailableItem = self->_migrationAvailableItem;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (migrationAvailableItem)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitMigrationAvailableItem mergeFrom:](migrationAvailableItem, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableMigrationAvailableItemContainer setMigrationAvailableItem:](self, "setMigrationAvailableItem:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[ASCodableMigrationAvailableItemContainer setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
  }

  MEMORY[0x270F9A758]();
}

- (ASCodableCloudKitMigrationAvailableItem)migrationAvailableItem
{
  return self->_migrationAvailableItem;
}

- (void)setMigrationAvailableItem:(id)a3
{
}

- (NSData)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);

  objc_storeStrong((id *)&self->_migrationAvailableItem, 0);
}

@end