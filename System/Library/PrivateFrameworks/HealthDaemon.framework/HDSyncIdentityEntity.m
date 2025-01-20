@interface HDSyncIdentityEntity
+ (BOOL)enumerateConcreteIdentitiesWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_concreteIdentityForIdentity:(void *)a3 database:(uint64_t)a4 error:;
+ (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4;
+ (id)concreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)concreteIdentityForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5;
+ (id)concreteIdentityForPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)uniquedColumns;
+ (id)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
- (id)concreteIdentityWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDSyncIdentityEntity

+ (id)concreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 databaseForEntityClass:a1];
  v10 = +[HDSyncIdentityEntity _concreteIdentityForIdentity:database:error:]((uint64_t)a1, v8, v9, (uint64_t)a5);

  return v10;
}

+ (id)_concreteIdentityForIdentity:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__19;
  v25 = __Block_byref_object_dispose__19;
  id v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke;
  v16[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v16[4] = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_2;
  v14[3] = &unk_1E62F43C8;
  id v9 = v6;
  id v15 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_3;
  v13[3] = &unk_1E62F5978;
  v13[4] = &v21;
  v13[5] = &v17;
  if ([v7 executeCachedStatementForKey:&_concreteIdentityForIdentity_database_error__lookupKey error:a4 SQLGenerator:v16 bindingHandler:v14 enumerationHandler:v13]&& v22[5])
  {
    v10 = [HDConcreteSyncIdentity alloc];
    id v11 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v10, v9, (void *)v22[5], *((unsigned char *)v18 + 24));
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

+ (id)concreteIdentityForPersistentID:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 databaseForEntityClass:objc_opt_class()];

  v10 = [a1 concreteIdentityForPersistentID:a3 database:v9 error:a5];

  return v10;
}

+ (id)concreteIdentityForPersistentID:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__19;
  v24 = __Block_byref_object_dispose__19;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v9 = [(HDSQLiteEntity *)[HDSyncIdentityEntity alloc] initWithPersistentID:a3];
  void v14[4] = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke;
  v15[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v15[4] = a1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_2;
  v14[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_3;
  v13[3] = &unk_1E62F5978;
  v13[4] = &v20;
  v13[5] = &v16;
  if ([v8 executeCachedStatementForKey:&concreteIdentityForPersistentID_database_error__lookupKey error:a5 SQLGenerator:v15 bindingHandler:v14 enumerationHandler:v13])
  {
    v10 = [HDConcreteSyncIdentity alloc];
    id v11 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v10, (void *)v21[5], v9, *((unsigned char *)v17 + 24));
  }
  else
  {
    id v11 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

id __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@=?", @"hardware_identifier", @"database_identifier", @"instance_discriminator", @"is_child", v1, *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __71__HDSyncIdentityEntity_concreteIdentityForPersistentID_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v4 = [HDSyncIdentity alloc];
  v5 = MEMORY[0x1C1879F90](a2, 0);
  id v6 = MEMORY[0x1C1879F90](a2, 1);
  id v7 = MEMORY[0x1C1879F80](a2, 2);
  uint64_t v8 = [(HDSyncIdentity *)v4 initWithHardwareIdentifier:v5 databaseIdentifier:v6 instanceDiscriminator:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F00](a2, 3);
  return 0;
}

+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 databaseForEntityClass:a1];
  v10 = [a1 insertOrLookupConcreteIdentityForIdentity:v8 database:v9 error:a5];

  return v10;
}

+ (id)insertOrLookupConcreteIdentityForIdentity:(id)a3 database:(id)a4 error:(id *)a5
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    char v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:a1 file:@"HDSyncIdentityEntity.m" lineNumber:192 description:@"Attempt to insert a nil sync identity into the db."];
  }
  id v22 = 0;
  id v11 = +[HDSyncIdentityEntity _concreteIdentityForIdentity:database:error:]((uint64_t)a1, v9, v10, (uint64_t)&v22);
  id v12 = v22;
  v13 = v12;
  if (v11)
  {
    id v14 = v11;
  }
  else if (v12)
  {
    if (a5)
    {
      id v14 = 0;
      *a5 = v12;
    }
    else
    {
      _HKLogDroppedError();
      id v14 = 0;
    }
  }
  else
  {
    v23[0] = @"hardware_identifier";
    v23[1] = @"database_identifier";
    v23[2] = @"instance_discriminator";
    v23[3] = @"is_child";
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__HDSyncIdentityEntity_insertOrLookupConcreteIdentityForIdentity_database_error___block_invoke;
    v20[3] = &unk_1E62F35C8;
    id v17 = v9;
    id v21 = v17;
    uint64_t v18 = [a1 insertOrReplaceEntity:0 database:v10 properties:v16 error:a5 bindingHandler:v20];

    if (v18) {
      id v14 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:]([HDConcreteSyncIdentity alloc], v17, v18, 0);
    }
    else {
      id v14 = 0;
    }
  }

  return v14;
}

void __81__HDSyncIdentityEntity_insertOrLookupConcreteIdentityForIdentity_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) hardwareIdentifier];
  MEMORY[0x1C1879EF0](a2, @"hardware_identifier", v4);

  v5 = [*(id *)(a1 + 32) databaseIdentifier];
  MEMORY[0x1C1879EF0](a2, @"database_identifier", v5);

  id v6 = [*(id *)(a1 + 32) instanceDiscriminator];
  MEMORY[0x1C1879EC0](a2, @"instance_discriminator", v6);

  [MEMORY[0x1E4F1CC28] intValue];

  JUMPOUT(0x1C1879E80);
}

+ (id)updateIsChild:(BOOL)a3 concreteIdentity:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 databaseForEntityClass:objc_opt_class()];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke;
  v23[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v23[4] = a1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke_2;
  v20[3] = &unk_1E62F59A0;
  BOOL v22 = a3;
  id v13 = v10;
  id v21 = v13;
  int v14 = [v12 executeCachedStatementForKey:&updateIsChild_concreteIdentity_transaction_error__updateKey error:a6 SQLGenerator:v23 bindingHandler:v20 enumerationHandler:0];
  id v15 = 0;
  if (v14)
  {
    uint64_t v16 = [HDConcreteSyncIdentity alloc];
    id v17 = [v13 identity];
    uint64_t v18 = [v13 entity];
    id v15 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v16, v17, v18, a3);
  }

  return v15;
}

id __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"UPDATE %@ SET %@ = ? WHERE %@ = ? AND %@ = ? AND %@ = ?", v2, @"is_child", @"hardware_identifier", @"database_identifier", @"instance_discriminator"];

  return v3;
}

void __73__HDSyncIdentityEntity_updateIsChild_concreteIdentity_transaction_error___block_invoke_2(uint64_t a1)
{
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  HDSQLiteBindFoundationValueToStatement();

  v3 = [*(id *)(a1 + 32) identity];
  v4 = [v3 hardwareIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  v5 = [*(id *)(a1 + 32) identity];
  id v6 = [v5 databaseIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  id v8 = [*(id *)(a1 + 32) identity];
  id v7 = [v8 instanceDiscriminator];
  HDSQLiteBindFoundationValueToStatement();
}

id __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = *MEMORY[0x1E4F65C70];
  v3 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v4 = [v1 stringWithFormat:@"SELECT %@, %@ FROM %@ WHERE %@=? AND %@=? AND %@=?", v2, @"is_child", v3, @"hardware_identifier", @"database_identifier", @"instance_discriminator"];

  return v4;
}

void __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hardwareIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  v3 = [*(id *)(a1 + 32) databaseIdentifier];
  HDSQLiteBindFoundationValueToStatement();

  id v4 = [*(id *)(a1 + 32) instanceDiscriminator];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __68__HDSyncIdentityEntity__concreteIdentityForIdentity_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [(HDSQLiteEntity *)[HDSyncIdentityEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F00](a2, 1);
  return 0;
}

- (id)concreteIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 databaseForEntity:self];
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__19;
  BOOL v22 = __Block_byref_object_dispose__19;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v12[4] = self;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke;
  v13[3] = &unk_1E62F59C8;
  v13[4] = self;
  v11[5] = &v14;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_2;
  v12[3] = &unk_1E62F43C8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_3;
  v11[3] = &unk_1E62F5978;
  v11[4] = &v18;
  if ([v7 executeCachedStatementForKey:&concreteIdentityWithTransaction_error__lookupKey error:a4 SQLGenerator:v13 bindingHandler:v12 enumerationHandler:v11])
  {
    id v8 = [HDConcreteSyncIdentity alloc];
    id v9 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:](v8, (void *)v19[5], self, *((unsigned char *)v15 + 24));
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

id __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke()
{
  v0 = NSString;
  v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@, %@ FROM %@ WHERE %@=?", @"hardware_identifier", @"database_identifier", @"instance_discriminator", @"is_child", v1, *MEMORY[0x1E4F65C70]];

  return v2;
}

uint64_t __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) persistentID];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __62__HDSyncIdentityEntity_concreteIdentityWithTransaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [HDSyncIdentity alloc];
  uint64_t v5 = MEMORY[0x1C1879F90](a2, 0);
  id v6 = MEMORY[0x1C1879F90](a2, 1);
  id v7 = MEMORY[0x1C1879F80](a2, 2);
  uint64_t v8 = [(HDSyncIdentity *)v4 initWithHardwareIdentifier:v5 databaseIdentifier:v6 instanceDiscriminator:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F00](a2, 3);
  return 0;
}

+ (BOOL)enumerateConcreteIdentitiesWithTransaction:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 databaseForEntityClass:a1];
  id v13 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke;
  v14[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v14[4] = a1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke_2;
  v12[3] = &unk_1E62F33D0;
  id v10 = v8;
  LOBYTE(a4) = [v9 executeCachedStatementForKey:&enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler__lookupKey error:a4 SQLGenerator:v14 bindingHandler:0 enumerationHandler:v12];

  return (char)a4;
}

id __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = *MEMORY[0x1E4F65C70];
  uint64_t v2 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  sqlite3_int64 v3 = [v0 stringWithFormat:@"SELECT %@, %@, %@, %@, %@ FROM %@", v1, @"hardware_identifier", @"database_identifier", @"instance_discriminator", @"is_child", v2];

  return v3;
}

uint64_t __92__HDSyncIdentityEntity_enumerateConcreteIdentitiesWithTransaction_error_enumerationHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [(HDSQLiteEntity *)[HDSyncIdentityEntity alloc] initWithPersistentID:HDSQLiteColumnAsInt64()];
  uint64_t v5 = [HDSyncIdentity alloc];
  uint64_t v6 = 1;
  id v7 = MEMORY[0x1C1879F90](a2, 1);
  id v8 = MEMORY[0x1C1879F90](a2, 2);
  uint64_t v9 = MEMORY[0x1C1879F80](a2, 3);
  id v10 = [(HDSyncIdentity *)v5 initWithHardwareIdentifier:v7 databaseIdentifier:v8 instanceDiscriminator:v9];

  LOBYTE(a2) = MEMORY[0x1C1879F00](a2, 4);
  id v11 = -[HDConcreteSyncIdentity initWithIdentity:entity:isChild:]([HDConcreteSyncIdentity alloc], v10, v4, a2);
  if (v11) {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return v6;
}

+ (id)childIdentitiesForCurrentSyncIdentityWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__19;
  char v19 = __Block_byref_object_dispose__19;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [v6 unprotectedDatabase];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__19;
  v13[4] = __Block_byref_object_dispose__19;
  id v14 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke;
  v12[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v12[4] = a1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_3;
  v11[3] = &unk_1E62F5978;
  v11[4] = v13;
  v11[5] = &v15;
  if ([v7 executeCachedStatementForKey:&childIdentitiesForCurrentSyncIdentityWithTransaction_error__lookupKey error:a4 SQLGenerator:v12 bindingHandler:&__block_literal_global_23 enumerationHandler:v11])id v8 = (void *)v16[5]; {
  else
  }
    id v8 = 0;
  id v9 = v8;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);

  return v9;
}

id __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke()
{
  v0 = NSString;
  uint64_t v1 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v2 = [v0 stringWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@=?", @"hardware_identifier", @"database_identifier", @"instance_discriminator", v1, @"is_child"];

  return v2;
}

uint64_t __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_2(int a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, 1);
}

uint64_t __83__HDSyncIdentityEntity_childIdentitiesForCurrentSyncIdentityWithTransaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [HDSyncIdentity alloc];
  uint64_t v5 = MEMORY[0x1C1879F90](a2, 0);
  id v6 = MEMORY[0x1C1879F90](a2, 1);
  id v7 = MEMORY[0x1C1879F80](a2, 2);
  uint64_t v8 = [(HDSyncIdentity *)v4 initWithHardwareIdentifier:v5 databaseIdentifier:v6 instanceDiscriminator:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  return 1;
}

+ (id)databaseTable
{
  return @"sync_identities";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_10;
}

+ (id)uniquedColumns
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"hardware_identifier";
  v4[1] = @"database_identifier";
  v4[2] = @"instance_discriminator";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

+ (int64_t)protectionClass
{
  return 1;
}

@end