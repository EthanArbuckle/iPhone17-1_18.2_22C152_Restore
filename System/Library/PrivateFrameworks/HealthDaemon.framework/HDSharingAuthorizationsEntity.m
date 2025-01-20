@interface HDSharingAuthorizationsEntity
+ (BOOL)addSharingAuthorizations:(id)a3 forRecipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (BOOL)deleteAllMarkedSharingAuthorizationsWithTransaction:(id)a3 error:(id *)a4;
+ (BOOL)deleteAllSharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (BOOL)deleteSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (BOOL)insertOrReplaceWithRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForSharingAuthorizations:(uint64_t)a1;
+ (id)_sharingAuthorizationsForRecipientIdentifier:(uint64_t)a1 databaseTransaction:(void *)a2 predicate:(void *)a3 error:(uint64_t)a4;
+ (id)databaseTable;
+ (id)recipientIdentifiersForSharingAuthorization:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 includeMarkedForDeletion:(BOOL)a5 error:(id *)a6;
+ (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (int64_t)protectionClass;
+ (uint64_t)_deleteSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(uint64_t)a5 error:;
@end

@implementation HDSharingAuthorizationsEntity

+ (id)databaseTable
{
  return @"sharing_authorizations";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharingAuthorizationsEntityColumnDefinitions;
}

+ (id)uniquedColumns
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"recipient";
  v4[1] = @"authorization_identifier";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)insertOrReplaceWithRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v24 = 0;
  v13 = [a1 sharingAuthorizationsForRecipientIdentifier:v10 databaseTransaction:v12 error:&v24];
  id v14 = v24;
  id v15 = v14;
  if (!v13)
  {
    id v15 = v14;
    if (v15)
    {
      if (a6) {
        *a6 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_18;
  }
  if ([v13 count])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __120__HDSharingAuthorizationsEntity_insertOrReplaceWithRecipientIdentifier_sharingAuthorizations_databaseTransaction_error___block_invoke;
    v22[3] = &unk_1E62F3448;
    id v23 = v11;
    v16 = objc_msgSend(v13, "hk_filter:", v22);
    if (![v16 count])
    {
LABEL_6:

      goto LABEL_7;
    }
    id v21 = v15;
    char v17 = [a1 deleteSharingAuthorizations:v16 recipientIdentifier:v10 databaseTransaction:v12 error:&v21];
    id v18 = v21;

    if (v17)
    {
      id v15 = v18;
      goto LABEL_6;
    }
    id v15 = v18;
    if (v15)
    {
      if (a6) {
        *a6 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_18:
    char v19 = 0;
    goto LABEL_19;
  }
LABEL_7:
  char v19 = [a1 addSharingAuthorizations:v11 forRecipientIdentifier:v10 databaseTransaction:v12 error:a6];
LABEL_19:

  return v19;
}

uint64_t __120__HDSharingAuthorizationsEntity_insertOrReplaceWithRecipientIdentifier_sharingAuthorizations_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (BOOL)addSharingAuthorizations:(id)a3 forRecipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v13 = [a5 databaseForEntityClass:a1];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v11;
  uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v30;
    while (2)
    {
      uint64_t v6 = 0;
      id v18 = v16;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * v6);
        id v28 = v18;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __107__HDSharingAuthorizationsEntity_addSharingAuthorizations_forRecipientIdentifier_databaseTransaction_error___block_invoke;
        v25[3] = &unk_1E62F2900;
        id v26 = v12;
        uint64_t v27 = v19;
        char v20 = [v13 executeSQL:@"INSERT OR IGNORE INTO sharing_authorizations (recipient, authorization_identifier, display_name, display_subtitle) VALUES (?, ?, ?, ?)", &v28, v25, 0 error bindingHandler enumerationHandler];
        id v16 = v28;

        if ((v20 & 1) == 0)
        {
          id v21 = v16;
          v22 = v21;
          LOBYTE(v6) = v21 == 0;
          if (v21)
          {
            if (a6) {
              *a6 = v21;
            }
            else {
              _HKLogDroppedError();
            }
          }

          goto LABEL_16;
        }

        ++v6;
        id v18 = v16;
      }
      while (v15 != v6);
      uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15) {
        continue;
      }
      break;
    }
LABEL_16:
  }
  else
  {
    char v20 = 1;
  }

  return (v6 | v20) & 1;
}

void __107__HDSharingAuthorizationsEntity_addSharingAuthorizations_forRecipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = HDStringRepresentationForRecipientIdentifier();
  HDSQLiteBindStringToStatement();

  v5 = [*(id *)(a1 + 40) authorizationIdentifier];
  HDSQLiteBindStringToStatement();

  uint64_t v6 = [*(id *)(a1 + 40) displayName];

  if (v6)
  {
    v7 = [*(id *)(a1 + 40) displayName];
    HDSQLiteBindStringToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  v8 = [*(id *)(a1 + 40) displaySubtitle];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) displaySubtitle];
    HDSQLiteBindStringToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }
}

+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return (id)[a1 sharingAuthorizationsForRecipientIdentifier:a3 databaseTransaction:a4 includeMarkedForDeletion:0 error:a5];
}

+ (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 includeMarkedForDeletion:(BOOL)a5 error:(id *)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x1E4F65D00];
  v13 = HDStringRepresentationForRecipientIdentifier();
  uint64_t v14 = [v12 predicateWithProperty:@"recipient" equalToValue:v13];

  if (!a5)
  {
    uint64_t v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"delete_on_commit" equalToValue:MEMORY[0x1E4F1CC28]];
    id v16 = (void *)MEMORY[0x1E4F65D08];
    v21[0] = v14;
    v21[1] = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    uint64_t v18 = [v16 predicateMatchingAllPredicates:v17];

    uint64_t v14 = (void *)v18;
  }
  uint64_t v19 = +[HDSharingAuthorizationsEntity _sharingAuthorizationsForRecipientIdentifier:databaseTransaction:predicate:error:]((uint64_t)a1, v11, v14, (uint64_t)a6);

  return v19;
}

+ (id)_sharingAuthorizationsForRecipientIdentifier:(uint64_t)a1 databaseTransaction:(void *)a2 predicate:(void *)a3 error:(uint64_t)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  v8 = self;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = [v7 databaseForEntityClass:v8];

  id v11 = [v8 queryWithDatabase:v10 predicate:v6];

  v19[0] = @"authorization_identifier";
  v19[1] = @"display_name";
  v19[2] = @"display_subtitle";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __114__HDSharingAuthorizationsEntity__sharingAuthorizationsForRecipientIdentifier_databaseTransaction_predicate_error___block_invoke;
  v17[3] = &unk_1E62FE2E0;
  id v18 = v9;
  id v13 = v9;
  if ([v11 enumerateProperties:v12 error:a4 enumerationHandler:v17]) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;

  return v15;
}

+ (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = a4;
  id v10 = a3;
  id v11 = HDStringRepresentationForRecipientIdentifier();
  id v12 = [v8 predicateWithProperty:@"recipient" equalToValue:v11];

  id v13 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"delete_on_commit" equalToValue:MEMORY[0x1E4F1CC38]];
  uint64_t v14 = (void *)MEMORY[0x1E4F65D08];
  v19[0] = v12;
  v19[1] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v16 = [v14 predicateMatchingAllPredicates:v15];

  uint64_t v17 = +[HDSharingAuthorizationsEntity _sharingAuthorizationsForRecipientIdentifier:databaseTransaction:predicate:error:]((uint64_t)a1, v9, v16, (uint64_t)a5);

  return v17;
}

+ (id)recipientIdentifiersForSharingAuthorization:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  id v12 = (void *)MEMORY[0x1E4F65D00];
  id v13 = [v8 authorizationIdentifier];
  uint64_t v14 = [v12 predicateWithProperty:@"authorization_identifier" equalToValue:v13];

  id v15 = [v8 displayName];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v17 = [v8 displayName];
    id v18 = [v16 predicateWithProperty:@"display_name" equalToValue:v17];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"display_name"];
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F65D08];
  v32[0] = v14;
  v32[1] = v18;
  char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v21 = [v19 predicateMatchingAllPredicates:v20];

  v22 = [v10 databaseForEntityClass:a1];

  id v23 = [a1 queryWithDatabase:v22 predicate:v21];

  long long v31 = @"recipient";
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __103__HDSharingAuthorizationsEntity_recipientIdentifiersForSharingAuthorization_databaseTransaction_error___block_invoke;
  v29[3] = &unk_1E62FE2E0;
  id v30 = v11;
  id v25 = v11;
  if ([v23 enumerateProperties:v24 error:a5 enumerationHandler:v29]) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;

  return v27;
}

uint64_t __103__HDSharingAuthorizationsEntity_recipientIdentifiersForSharingAuthorization_databaseTransaction_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsString();
  if (v2)
  {
    v3 = [MEMORY[0x1E4F2B500] sharingRecipientIdentifierFromStringRepresentation:v2];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  return 1;
}

+ (BOOL)deleteSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  return +[HDSharingAuthorizationsEntity _deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:]((uint64_t)a1, a3, a4, a5, (uint64_t)a6);
}

+ (uint64_t)_deleteSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a3;
  id v11 = self;
  id v12 = [v9 databaseForEntityClass:v11];

  id v13 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v14 = HDStringRepresentationForRecipientIdentifier();

  id v15 = [v13 predicateWithProperty:@"recipient" equalToValue:v14];

  if (v8)
  {
    uint64_t v16 = +[HDSharingAuthorizationsEntity _predicateForSharingAuthorizations:]((uint64_t)v11, v8);
    if (!v16)
    {
      uint64_t v19 = 1;
      goto LABEL_6;
    }
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v15 otherPredicate:v16];

    id v15 = (void *)v18;
  }
  uint64_t v19 = [v11 deleteEntitiesInDatabase:v12 predicate:v15 error:a5];
LABEL_6:

  return v19;
}

+ (BOOL)deleteAllSharingAuthorizationsForRecipientIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  return +[HDSharingAuthorizationsEntity _deleteSharingAuthorizations:recipientIdentifier:databaseTransaction:error:]((uint64_t)a1, 0, a3, a4, (uint64_t)a5);
}

+ (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  id v12 = [a5 databaseForEntityClass:a1];
  id v13 = (void *)MEMORY[0x1E4F65D00];
  uint64_t v14 = HDStringRepresentationForRecipientIdentifier();

  id v15 = [v13 predicateWithProperty:@"recipient" equalToValue:v14];

  uint64_t v16 = +[HDSharingAuthorizationsEntity _predicateForSharingAuthorizations:]((uint64_t)a1, v11);

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v15 otherPredicate:v16];
    v21[0] = @"delete_on_commit";
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    char v19 = [a1 updateProperties:v18 predicate:v17 database:v12 error:a6 bindingHandler:&__block_literal_global_196];
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

+ (id)_predicateForSharingAuthorizations:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 count])
  {
    v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_324_0);
    v4 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __116__HDSharingAuthorizationsEntity_markSharingAuthorizationsForDeletion_recipientIdentifier_databaseTransaction_error___block_invoke()
{
}

+ (BOOL)deleteAllMarkedSharingAuthorizationsWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = [a3 databaseForEntityClass:a1];
  id v7 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"delete_on_commit" equalToValue:MEMORY[0x1E4F1CC38]];
  LOBYTE(a4) = [a1 deleteEntitiesInDatabase:v6 predicate:v7 error:a4];

  return (char)a4;
}

id __68__HDSharingAuthorizationsEntity__predicateForSharingAuthorizations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F65D00];
  v3 = [a2 authorizationIdentifier];
  v4 = [v2 predicateWithProperty:@"authorization_identifier" equalToValue:v3];

  return v4;
}

uint64_t __114__HDSharingAuthorizationsEntity__sharingAuthorizationsForRecipientIdentifier_databaseTransaction_predicate_error___block_invoke(uint64_t a1)
{
  id v2 = HDSQLiteColumnWithNameAsString();
  v3 = HDSQLiteColumnWithNameAsNonEmptyString();
  v4 = HDSQLiteColumnWithNameAsNonEmptyString();
  if (v2)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F2B4D8]) initWithAuthorizationIdentifier:v2 displayName:v3 displaySubtitle:v4];
    [*(id *)(a1 + 32) addObject:v5];
  }
  return 1;
}

@end