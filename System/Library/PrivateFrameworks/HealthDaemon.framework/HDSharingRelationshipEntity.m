@interface HDSharingRelationshipEntity
+ (BOOL)deleteEntityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)entityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)insertOrReplaceWithRecipientIdentifier:(id)a3 dateModified:(id)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 databaseTransaction:(id)a7 error:(id *)a8;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
- (BOOL)setDateModified:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
- (id)dateModifiedInDatabaseTransaction:(id)a3 error:(id *)a4;
- (id)recipientIdentifierInDatabaseTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDSharingRelationshipEntity

+ (id)databaseTable
{
  return @"sharing_relationship";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharingRelationshipEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (id)insertOrReplaceWithRecipientIdentifier:(id)a3 dateModified:(id)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 databaseTransaction:(id)a7 error:(id *)a8
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  v16 = [a7 protectedDatabase];
  v27[0] = @"recipient";
  v27[1] = @"date_modified";
  v27[2] = @"sync_provenance";
  v27[3] = @"sync_identity";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __137__HDSharingRelationshipEntity_insertOrReplaceWithRecipientIdentifier_dateModified_syncProvenance_syncIdentity_databaseTransaction_error___block_invoke;
  v22[3] = &unk_1E62FBA50;
  id v23 = v14;
  id v24 = v15;
  int64_t v25 = a5;
  int64_t v26 = a6;
  id v18 = v15;
  id v19 = v14;
  v20 = [a1 insertOrReplaceEntity:1 database:v16 properties:v17 error:a8 bindingHandler:v22];

  return v20;
}

void __137__HDSharingRelationshipEntity_insertOrReplaceWithRecipientIdentifier_dateModified_syncProvenance_syncIdentity_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = HDStringRepresentationForRecipientIdentifier();
  MEMORY[0x1C1879EC0](a2, @"recipient", v4);

  MEMORY[0x1C1879E40](a2, @"date_modified", *(void *)(a1 + 40));
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 48));

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)deleteEntityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v6 = (void *)MEMORY[0x1E4F65D00];
  id v7 = a4;
  v8 = HDStringRepresentationForRecipientIdentifier();
  v9 = [v6 predicateWithProperty:@"recipient" equalToValue:v8];

  v10 = [v7 databaseForEntityClass:objc_opt_class()];

  LOBYTE(a5) = [(id)objc_opt_class() deleteEntitiesInDatabase:v10 predicate:v9 error:a5];
  return (char)a5;
}

+ (id)entityWithRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  id v7 = (void *)MEMORY[0x1E4F65D00];
  id v8 = a4;
  v9 = HDStringRepresentationForRecipientIdentifier();
  v10 = [v7 predicateWithProperty:@"recipient" equalToValue:v9];

  v11 = [v8 databaseForEntityClass:objc_opt_class()];

  v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];

  return v12;
}

- (id)recipientIdentifierInDatabaseTransaction:(id)a3 error:(id *)a4
{
  id v11 = 0;
  v5 = [(HDHealthEntity *)self stringForProperty:@"recipient" transaction:a3 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v8 = [MEMORY[0x1E4F2B500] sharingRecipientIdentifierFromStringRepresentation:v5];
    if (!v8) {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Cannot create recipient identifier from string representation %@", v5);
    }
  }
  else
  {
    id v9 = v6;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v8 = 0;
  }

  return v8;
}

- (id)dateModifiedInDatabaseTransaction:(id)a3 error:(id *)a4
{
  return [(HDHealthEntity *)self dateForProperty:@"date_modified" transaction:a3 error:a4];
}

- (BOOL)setDateModified:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 databaseForEntityClass:objc_opt_class()];

  v16[0] = @"date_modified";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HDSharingRelationshipEntity_setDateModified_databaseTransaction_error___block_invoke;
  v14[3] = &unk_1E62F35C8;
  id v15 = v8;
  id v12 = v8;
  LOBYTE(a5) = [(HDSQLiteEntity *)self updateProperties:v11 database:v10 error:a5 bindingHandler:v14];

  return (char)a5;
}

void __73__HDSharingRelationshipEntity_setDateModified_databaseTransaction_error___block_invoke()
{
}

@end