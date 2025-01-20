@interface HDAttachmentEntity
+ (BOOL)enumerateAttachmentsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_attachmentForEntity:(void *)a3 database:(uint64_t)a4 error:;
+ (id)_insertAttachment:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_insertIfDoesNotExistAttachment:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)_propertiesForEntity;
+ (id)attachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)attachmentWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (int64_t)protectionClass;
@end

@implementation HDAttachmentEntity

+ (id)databaseTable
{
  return @"attachments";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 9;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDAttachmentEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)enumerateAttachmentsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v11 databaseForEntityClass:a1];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__97;
  v29 = __Block_byref_object_dispose__97;
  id v30 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__HDAttachmentEntity_enumerateAttachmentsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E62F53E0;
  id v24 = a1;
  id v14 = v13;
  id v21 = v14;
  v23 = &v25;
  id v15 = v12;
  id v22 = v15;
  BOOL v16 = +[HDSQLiteEntity enumerateEntitiesInDatabase:v14 predicate:v10 error:a5 enumerationHandler:v20];
  id v17 = (id)v26[5];
  v18 = v17;
  if (v17)
  {
    if (a5) {
      *a5 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(&v25, 8);
  return v16;
}

uint64_t __93__HDAttachmentEntity_enumerateAttachmentsWithPredicate_transaction_error_enumerationHandler___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  v6 = +[HDAttachmentEntity _attachmentForEntity:database:error:](v4, a2, v3, (uint64_t)&obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v11 = *(id *)(v8 + 40);
    uint64_t v9 = (*(uint64_t (**)(void))(v7 + 16))();
    objc_storeStrong((id *)(v8 + 40), v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_attachmentForEntity:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__97;
  BOOL v16 = __Block_byref_object_dispose__97;
  id v17 = 0;
  uint64_t v8 = +[HDAttachmentEntity _propertiesForEntity]();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HDAttachmentEntity__attachmentForEntity_database_error___block_invoke;
  v11[3] = &unk_1E62F8848;
  v11[4] = &v12;
  [v6 getValuesForProperties:v8 database:v7 error:a4 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)attachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__97;
  id v22 = __Block_byref_object_dispose__97;
  id v23 = 0;
  id v10 = [v9 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__HDAttachmentEntity_attachmentWithIdentifier_profile_error___block_invoke;
  v14[3] = &unk_1E62F66D8;
  BOOL v16 = &v18;
  id v17 = a1;
  id v11 = v8;
  id v15 = v11;
  [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

BOOL __61__HDAttachmentEntity_attachmentWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v18 = 0;
  id v6 = a2;
  id v7 = v5;
  id v8 = self;
  id v9 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"identifier" equalToValue:v7];

  id v10 = [v6 databaseForEntityClass:objc_opt_class()];

  id v11 = [v8 anyInDatabase:v10 predicate:v9 error:&v18];
  if (v11)
  {
    uint64_t v12 = +[HDAttachmentEntity _attachmentForEntity:database:error:]((uint64_t)v8, v11, v10, (uint64_t)&v18);
  }
  else
  {
    uint64_t v12 = 0;
  }

  id v13 = v18;
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v12;

  id v16 = v13;
  if (v16)
  {
    if (a3) {
      *a3 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v16 == 0;
}

+ (id)attachmentWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = [v8 predicateWithProperty:@"identifier" equalToValue:a3];
  id v11 = [v9 databaseForEntityClass:a1];

  uint64_t v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];
  if (v12)
  {
    id v13 = +[HDAttachmentEntity _attachmentForEntity:database:error:]((uint64_t)a1, v12, v11, (uint64_t)a5);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_propertiesForEntity
{
  v2[8] = *MEMORY[0x1E4F143B8];
  self;
  v2[0] = @"identifier";
  v2[1] = @"name";
  v2[2] = @"type";
  v2[3] = @"hash";
  v2[4] = @"size";
  v2[5] = @"creation_date";
  v2[6] = @"metadata";
  v2[7] = @"encryption_key";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];

  return v0;
}

void __58__HDAttachmentEntity__attachmentForEntity_database_error___block_invoke(uint64_t a1)
{
  v2 = [HDAttachment alloc];
  HDSQLiteColumnWithNameAsUUID();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = HDSQLiteColumnWithNameAsString();
  uint64_t v4 = HDSQLiteColumnWithNameAsString();
  uint64_t v5 = HDSQLiteColumnWithNameAsString();
  uint64_t v6 = HDSQLiteColumnWithNameAsInt64();
  id v7 = HDSQLiteColumnWithNameAsDate();
  id v8 = HDSQLiteColumnWithNameAsData();
  id v9 = +[HDCodableMetadataDictionary decodeMetadataFromData:v8];
  objc_opt_class();
  id v10 = HDSQLiteColumnWithNameAsObject();
  uint64_t v11 = [(HDAttachment *)v2 initWithIdentifier:v14 name:v3 type:v4 hash:v5 size:v6 creationDate:v7 metadata:v9 encryptionKey:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

+ (id)_insertAttachment:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 metadata];
  if (v10
    && (uint64_t v11 = (void *)v10,
        [v8 metadata],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        !v13))
  {
    id v16 = 0;
  }
  else
  {
    id v14 = [v9 databaseForEntityClass:a1];
    id v15 = +[HDAttachmentEntity _propertiesForEntity]();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__HDAttachmentEntity__insertAttachment_transaction_error___block_invoke;
    v18[3] = &unk_1E62F35C8;
    id v19 = v8;
    id v16 = [a1 insertOrReplaceEntity:0 database:v14 properties:v15 error:a5 bindingHandler:v18];
  }

  return v16;
}

void __58__HDAttachmentEntity__insertAttachment_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  MEMORY[0x1C1879EF0](a2, @"identifier", v4);

  uint64_t v5 = [*(id *)(a1 + 32) name];
  MEMORY[0x1C1879EC0](a2, @"name", v5);

  uint64_t v6 = [*(id *)(a1 + 32) type];
  MEMORY[0x1C1879EC0](a2, @"type", v6);

  id v7 = [*(id *)(a1 + 32) fileHash];
  MEMORY[0x1C1879EC0](a2, @"hash", v7);

  MEMORY[0x1C1879E80](a2, @"size", [*(id *)(a1 + 32) size]);
  id v8 = [*(id *)(a1 + 32) creationDate];
  MEMORY[0x1C1879E40](a2, @"creation_date", v8);

  id v9 = [*(id *)(a1 + 32) encryptionKey];
  HDSQLiteBindSecureCodingObjectToProperty();

  uint64_t v10 = [*(id *)(a1 + 32) metadata];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    JUMPOUT(0x1C1879E90);
  }
  id v14 = [*(id *)(a1 + 32) metadata];
  uint64_t v12 = objc_msgSend(v14, "hk_codableMetadata");
  int v13 = [v12 data];
  MEMORY[0x1C1879E30](a2, @"metadata", v13);
}

+ (id)_insertIfDoesNotExistAttachment:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 metadata];
  if (v10
    && (uint64_t v11 = (void *)v10,
        [v8 metadata],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = objc_msgSend(v12, "hk_validateAttachmentMetadataKeysAndValuesWithError:", a5),
        v12,
        v11,
        !v13))
  {
    id v19 = 0;
  }
  else
  {
    id v14 = [v8 identifier];
    id v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"identifier" equalToValue:v14];

    id v16 = [v9 databaseForEntityClass:objc_opt_class()];
    id v22 = 0;
    id v17 = [a1 anyInDatabase:v16 predicate:v15 error:&v22];
    id v18 = v22;
    if (v18)
    {
      if (a5)
      {
        id v19 = 0;
        *a5 = v18;
      }
      else
      {
        _HKLogDroppedError();
        id v19 = 0;
      }
    }
    else
    {
      if (v17)
      {
        id v20 = v17;
      }
      else
      {
        id v20 = [a1 _insertAttachment:v8 transaction:v9 error:a5];
      }
      id v19 = v20;
    }
  }

  return v19;
}

@end