@interface ASCompetitionList
+ (id)competitionListFromCodableDatabaseCompetitionList:(id)a3 codableCompetitions:(id)a4 withType:(int64_t)a5;
+ (id)competitionListWithCodableCompetitionList:(id)a3;
+ (id)competitionListWithRecord:(id)a3;
- (ASCodableCloudKitCompetitionList)codableCompetitionList;
- (ASCompetition)currentCompetition;
- (ASCompetitionList)init;
- (ASCompetitionList)initWithFriendUUID:(id)a3 type:(int64_t)a4;
- (CKRecord)systemFieldsOnlyRecord;
- (NSArray)competitions;
- (NSString)description;
- (NSUUID)friendUUID;
- (id)codableDatabaseCompetitionListEntryForOwner:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4;
- (int64_t)type;
- (void)currentCompetition;
- (void)setCompetitions:(id)a3;
- (void)setFriendUUID:(id)a3;
- (void)setSystemFieldsOnlyRecord:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation ASCompetitionList

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6 = a3;
  v7 = [(ASCompetitionList *)self systemFieldsOnlyRecord];
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
    uint64_t v12 = [objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ActivitySharingCompetitionList" zoneID:v6];

    v8 = (void *)v12;
  }
  _ASUpdateSchemaVersionOnRecord(1, v8, a4);
  v13 = [(ASCompetitionList *)self codableCompetitionList];
  v14 = [v13 data];
  v15 = [v8 encryptedValues];
  [v15 setObject:v14 forKeyedSubscript:@"EncryptedData"];

  return v8;
}

+ (id)competitionListWithRecord:(id)a3
{
  id v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 1)
  {
    v4 = [v3 encryptedValues];
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
      v8 = [[ASCodableCloudKitCompetitionList alloc] initWithData:v6];
      v7 = +[ASCompetitionList competitionListWithCodableCompetitionList:v8];
      v9 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
      [v3 encodeSystemFieldsWithCoder:v9];
      [v9 finishEncoding];
      id v10 = objc_alloc(MEMORY[0x263F08928]);
      char v11 = [v9 encodedData];
      id v16 = 0;
      uint64_t v12 = (void *)[v10 initForReadingFromData:v11 error:&v16];
      id v13 = v16;

      if (v13)
      {
        ASLoggingInitialize();
        if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
          +[ASRelationship(CloudKitCodingSupport) _relationshipWithRecord:relationshipEventRecords:completion:].cold.5();
        }
      }
      v14 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v12];
      [v7 setSystemFieldsOnlyRecord:v14];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASCompetitionList(CloudKitCodingSupport) competitionListWithRecord:]();
      }
      v7 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[ASCompetitionList(CloudKitCodingSupport) competitionListWithRecord:]();
    }
    v7 = 0;
  }

  return v7;
}

+ (id)competitionListWithCodableCompetitionList:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ASCompetitionList);
  id v5 = [v3 competitions];
  id v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_469);
  [(ASCompetitionList *)v4 setCompetitions:v6];

  v7 = (void *)MEMORY[0x263F08C38];
  v8 = [v3 friendUUID];
  v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);
  [(ASCompetitionList *)v4 setFriendUUID:v9];

  uint64_t v10 = [v3 type];
  [(ASCompetitionList *)v4 setType:v10];

  return v4;
}

ASCompetition *__86__ASCompetitionList_CloudKitCodingSupport__competitionListWithCodableCompetitionList___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ASCompetition competitionWithCodableCompetition:a2];
}

- (ASCodableCloudKitCompetitionList)codableCompetitionList
{
  id v3 = objc_alloc_init(ASCodableCloudKitCompetitionList);
  v4 = [(ASCompetitionList *)self competitions];
  id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_473);
  id v6 = (void *)[v5 mutableCopy];
  [(ASCodableCloudKitCompetitionList *)v3 setCompetitions:v6];

  v7 = [(ASCompetitionList *)self friendUUID];
  v8 = objc_msgSend(v7, "hk_dataForUUIDBytes");
  [(ASCodableCloudKitCompetitionList *)v3 setFriendUUID:v8];

  [(ASCodableCloudKitCompetitionList *)v3 setType:[(ASCompetitionList *)self type]];

  return v3;
}

uint64_t __66__ASCompetitionList_CloudKitCodingSupport__codableCompetitionList__block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableCompetition];
}

+ (id)competitionListFromCodableDatabaseCompetitionList:(id)a3 codableCompetitions:(id)a4 withType:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(ASCompetitionList);
  uint64_t v10 = (void *)MEMORY[0x263F08C38];
  char v11 = [v7 friendUUID];
  uint64_t v12 = objc_msgSend(v10, "hk_UUIDWithData:", v11);
  [(ASCompetitionList *)v9 setFriendUUID:v12];

  [(ASCompetitionList *)v9 setType:a5];
  id v13 = (objc_class *)objc_opt_class();
  v26 = v7;
  v14 = [v7 systemFieldsOnlyRecord];
  v15 = ASSecureUnarchiveClassWithData(v13, v14);
  [(ASCompetitionList *)v9 setSystemFieldsOnlyRecord:v15];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    v20 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v21 = 0;
      v22 = v20;
      do
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        v23 = [*(id *)(*((void *)&v27 + 1) + 8 * v21) competition];
        v24 = +[ASCompetition competitionWithCodableCompetition:v23];

        v20 = [v22 arrayByAddingObject:v24];

        ++v21;
        v22 = v20;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }
  else
  {
    v20 = (void *)MEMORY[0x263EFFA68];
  }

  [(ASCompetitionList *)v9 setCompetitions:v20];

  return v9;
}

- (id)codableDatabaseCompetitionListEntryForOwner:(int64_t)a3
{
  id v5 = objc_alloc_init(ASCodableDatabaseCompetitionListEntry);
  id v6 = [(ASCompetitionList *)self friendUUID];
  id v7 = objc_msgSend(v6, "hk_dataForUUIDBytes");
  [(ASCodableDatabaseCompetitionListEntry *)v5 setFriendUUID:v7];

  [(ASCodableDatabaseCompetitionListEntry *)v5 setType:[(ASCompetitionList *)self type]];
  id v8 = (void *)MEMORY[0x263F08910];
  v9 = [(ASCompetitionList *)self systemFieldsOnlyRecord];
  uint64_t v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  [(ASCodableDatabaseCompetitionListEntry *)v5 setSystemFieldsOnlyRecord:v10];

  [(ASCodableDatabaseCompetitionListEntry *)v5 setOwner:a3];

  return v5;
}

- (ASCompetitionList)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCompetitionList;
  v2 = [(ASCompetitionList *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    competitions = v2->_competitions;
    v2->_competitions = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (ASCompetitionList)initWithFriendUUID:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  id v8 = [(ASCompetitionList *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_friendUUID, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"CompetitionList friendUUID=%@ type=%ld competitions=%@", self->_friendUUID, self->_type, self->_competitions];
}

- (ASCompetition)currentCompetition
{
  if ([(NSArray *)self->_competitions count] >= 2)
  {
    ASLoggingInitialize();
    id v3 = ASLogCompetitions;
    if (os_log_type_enabled((os_log_t)ASLogCompetitions, OS_LOG_TYPE_ERROR)) {
      [(ASCompetitionList *)(uint64_t)self currentCompetition];
    }
  }
  v4 = [(NSArray *)self->_competitions lastObject];

  return (ASCompetition *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setFriendUUID:self->_friendUUID];
  [v5 setType:self->_type];
  objc_super v6 = (void *)[(NSArray *)self->_competitions copyWithZone:a3];
  [v5 setCompetitions:v6];

  id v7 = (void *)[(CKRecord *)self->_systemFieldsOnlyRecord copyWithZone:a3];
  [v5 setSystemFieldsOnlyRecord:v7];

  return v5;
}

- (NSArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
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
  objc_storeStrong((id *)&self->_friendUUID, 0);

  objc_storeStrong((id *)&self->_competitions, 0);
}

- (void)currentCompetition
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EC60000, a2, OS_LOG_TYPE_ERROR, "Competition list contained an unexpected number of competitions, list: %@", (uint8_t *)&v2, 0xCu);
}

@end