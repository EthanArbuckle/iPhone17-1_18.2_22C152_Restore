@interface ASMigrationAvailableItem
+ (id)migrationAvailableItemWithCodableContainer:(id)a3;
+ (id)migrationAvailableItemWithCodableItem:(id)a3;
+ (id)migrationAvailableItemWithRecord:(id)a3;
+ (id)migrationAvailableItemsWithRecords:(id)a3;
- (ASCodableCloudKitMigrationAvailableItem)codableMigrationAvailableItem;
- (ASCodableMigrationAvailableItemContainer)codableMigrationAvailableItemContainer;
- (ASMigrationAvailableItem)initWithIdentifier:(id)a3 relationshipIdentifier:(id)a4;
- (ASMigrationAvailableItem)initWithRelationshipIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKRecord)systemFieldsOnlyRecord;
- (NSString)description;
- (NSString)identifier;
- (NSString)relationshipIdentifier;
- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4;
- (unint64_t)hash;
- (void)setSystemFieldsOnlyRecord:(id)a3;
@end

@implementation ASMigrationAvailableItem

- (ASCodableCloudKitMigrationAvailableItem)codableMigrationAvailableItem
{
  v3 = objc_alloc_init(ASCodableCloudKitMigrationAvailableItem);
  v4 = [(ASMigrationAvailableItem *)self identifier];
  [(ASCodableCloudKitMigrationAvailableItem *)v3 setIdentifier:v4];

  v5 = [(ASMigrationAvailableItem *)self relationshipIdentifier];
  [(ASCodableCloudKitMigrationAvailableItem *)v3 setRelationshipIdentifier:v5];

  return v3;
}

+ (id)migrationAvailableItemWithCodableItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if (v4)
  {
    v5 = [v3 relationshipIdentifier];
    if (v5) {
      v6 = [[ASMigrationAvailableItem alloc] initWithIdentifier:v4 relationshipIdentifier:v5];
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)migrationAvailableItemsWithRecords:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_498);
}

id __86__ASMigrationAvailableItem_CloudKitCodingSupport__migrationAvailableItemsWithRecords___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 recordType];
  int v4 = [v3 isEqualToString:@"ActivitySharingMigrationAvailableRecord"];

  if (v4)
  {
    v5 = +[ASMigrationAvailableItem migrationAvailableItemWithRecord:v2];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)migrationAvailableItemWithRecord:(id)a3
{
  id v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 1)
  {
    int v4 = [v3 encryptedValues];
    id v5 = [v4 objectForKeyedSubscript:@"EncryptedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      v8 = [[ASCodableCloudKitMigrationAvailableItem alloc] initWithData:v6];
      v9 = +[ASMigrationAvailableItem migrationAvailableItemWithCodableItem:v8];
      v10 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
      [v3 encodeSystemFieldsWithCoder:v10];
      [v10 finishEncoding];
      id v11 = objc_alloc(MEMORY[0x263F08928]);
      v12 = [v10 encodedData];
      id v17 = 0;
      v13 = (void *)[v11 initForReadingFromData:v12 error:&v17];
      id v14 = v17;

      if (v14)
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
        }
      }
      v15 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v13];
      [v9 setSystemFieldsOnlyRecord:v15];

      id v7 = v9;
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASMigrationAvailableItem(CloudKitCodingSupport) migrationAvailableItemWithRecord:]();
      }
      id v7 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[ASMigrationAvailableItem(CloudKitCodingSupport) migrationAvailableItemWithRecord:]();
    }
    id v7 = 0;
  }

  return v7;
}

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ASMigrationAvailableItem *)self systemFieldsOnlyRecord];
  v8 = v7;
  if (!v7
    || ([v7 recordID],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 zoneID],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:v6],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = NSString;
    v13 = [(ASMigrationAvailableItem *)self relationshipIdentifier];
    id v14 = [v12 stringWithFormat:@"%@-%@", @"ActivitySharingMigrationAvailableRecord", v13];

    v15 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v14 zoneID:v6];
    uint64_t v16 = [objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingMigrationAvailableRecord" recordID:v15];

    v8 = (void *)v16;
  }
  _ASUpdateSchemaVersionOnRecord(1, v8, a4);
  id v17 = [(ASMigrationAvailableItem *)self codableMigrationAvailableItem];
  v18 = [v17 data];
  v19 = [v8 encryptedValues];
  [v19 setObject:v18 forKeyedSubscript:@"EncryptedData"];

  return v8;
}

- (ASMigrationAvailableItem)initWithRelationshipIdentifier:(id)a3
{
  int v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [v6 UUIDString];
  v8 = [(ASMigrationAvailableItem *)self initWithIdentifier:v7 relationshipIdentifier:v5];

  return v8;
}

- (ASMigrationAvailableItem)initWithIdentifier:(id)a3 relationshipIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASMigrationAvailableItem;
  v9 = [(ASMigrationAvailableItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_relationshipIdentifier, a4);
  }

  return v10;
}

- (NSString)description
{
  if (self->_systemFieldsOnlyRecord) {
    id v2 = @"YES";
  }
  else {
    id v2 = @"NO";
  }
  return (NSString *)[NSString stringWithFormat:@"ASMigrationAvailableItem (%@), systemFieldsOnlyRecord exists: %@", self->_relationshipIdentifier, v2];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  id v5 = [(ASMigrationAvailableItem *)self relationshipIdentifier];
  id v6 = [v4 relationshipIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  id v2 = [(ASMigrationAvailableItem *)self relationshipIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (CKRecord)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (ASCodableMigrationAvailableItemContainer)codableMigrationAvailableItemContainer
{
  unint64_t v3 = objc_alloc_init(ASCodableMigrationAvailableItemContainer);
  id v4 = [(ASMigrationAvailableItem *)self codableMigrationAvailableItem];
  [(ASCodableMigrationAvailableItemContainer *)v3 setMigrationAvailableItem:v4];

  id v5 = [(ASMigrationAvailableItem *)self systemFieldsOnlyRecord];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F08910];
    id v7 = [(ASMigrationAvailableItem *)self systemFieldsOnlyRecord];
    id v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    [(ASCodableMigrationAvailableItemContainer *)v3 setSystemFieldsOnlyRecord:v8];
  }

  return v3;
}

+ (id)migrationAvailableItemWithCodableContainer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 migrationAvailableItem];
  id v5 = +[ASMigrationAvailableItem migrationAvailableItemWithCodableItem:v4];

  id v6 = (objc_class *)objc_opt_class();
  id v7 = [v3 systemFieldsOnlyRecord];

  id v8 = ASSecureUnarchiveClassWithDataAndStrictness(v6, v7, 0);
  [v5 setSystemFieldsOnlyRecord:v8];

  return v5;
}

@end