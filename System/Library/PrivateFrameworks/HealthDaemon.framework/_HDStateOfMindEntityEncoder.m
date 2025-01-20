@interface _HDStateOfMindEntityEncoder
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)orderedProperties;
@end

@implementation _HDStateOfMindEntityEncoder

- (id)orderedProperties
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"reflective_interval";
  v8[1] = @"valence";
  v8[2] = @"context";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v4 = [(HDEntityEncoder *)self superclassEncoder];
  v5 = [v4 orderedProperties];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2B590]) _init];

  return v3;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v9 = [(HDEntityEncoder *)self transaction];
  v10 = +[HDStateOfMindLabelEntity labelsForObjectID:a3 transaction:v9 error:a5];

  if (v10)
  {
    v11 = [(HDEntityEncoder *)self transaction];
    v12 = +[HDStateOfMindDomainEntity domainsForObjectID:a3 transaction:v11 error:a5];

    if (v12)
    {
      v13 = [(HDEntityEncoder *)self superclassEncoder];
      v14 = [v13 codableRepresentationForPersistentID:a3 row:a4 error:a5];

      if (v14)
      {
        v15 = objc_alloc_init(HDCodableStateOfMind);
        [(HDCodableStateOfMind *)v15 setSample:v14];
        [(HDCodableStateOfMind *)v15 setReflectiveInterval:HDSQLiteColumnWithNameAsInt64()];
        HDSQLiteColumnWithNameAsDouble();
        -[HDCodableStateOfMind setValence:](v15, "setValence:");
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v16 = v10;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v16);
              }
              -[HDCodableStateOfMind addLabels:](v15, "addLabels:", [*(id *)(*((void *)&v32 + 1) + 8 * i) longLongValue]);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v18);
        }

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v21 = v12;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v29 != v24) {
                objc_enumerationMutation(v21);
              }
              -[HDCodableStateOfMind addDomains:](v15, "addDomains:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "longLongValue", (void)v28));
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v23);
        }

        v26 = HDSQLiteColumnWithNameAsString();
        if (v26) {
          [(HDCodableStateOfMind *)v15 setContext:v26];
        }
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(HDEntityEncoder *)self superclassEncoder];
  int v12 = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (v12)
  {
    v13 = [(HDEntityEncoder *)self transaction];
    v14 = +[HDStateOfMindLabelEntity labelsForObjectID:a4 transaction:v13 error:a6];

    if (v14)
    {
      v15 = [(HDEntityEncoder *)self transaction];
      id v16 = +[HDStateOfMindDomainEntity domainsForObjectID:a4 transaction:v15 error:a6];

      BOOL v17 = v16 != 0;
      if (v16)
      {
        HDSQLiteColumnWithNameAsInt64();
        [v10 _setKind:HKStateOfMindKindFromReflectiveInterval()];
        HDSQLiteColumnWithNameAsDouble();
        objc_msgSend(v10, "_setValence:");
        uint64_t v18 = HDSQLiteColumnWithNameAsString();
        [v10 _setContext:v18];

        [v10 _setLabels:v14];
        uint64_t v19 = objc_msgSend(v16, "hk_map:", &__block_literal_global_206);
        [v10 _setAssociations:v19];
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end