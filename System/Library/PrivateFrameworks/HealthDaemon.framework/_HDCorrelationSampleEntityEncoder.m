@interface _HDCorrelationSampleEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
@end

@implementation _HDCorrelationSampleEntityEncoder

+ (int64_t)estimatedEncodedSize
{
  return 150;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v8 = [(HDEntityEncoder *)self superclassEncoder];
  v9 = [v8 codableRepresentationForPersistentID:a3 row:a4 error:a5];

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableCorrelation);
    [(HDCodableCorrelation *)v10 setSample:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F2AE50]) _init];
  if (-[_HDCorrelationSampleEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v9, a3, a4, a5)&& ([v9 objects], v10 = objc_claimAutoreleasedReturnValue(), uint64_t v11 = objc_msgSend(v10, "count"), v10, v11))
  {
    id v12 = v9;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = [(HDEntityEncoder *)self superclassEncoder];
  LODWORD(a5) = [v11 applyPropertiesToObject:v10 persistentID:a4 row:a5 error:a6];

  if (a5)
  {
    id v12 = [(HDEntityEncoder *)self profile];
    v13 = +[HDAssociationEntity objectIDsForAssociationEntityWithPersistentID:a4 profile:v12 error:a6];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      v15 = [(HDEntityEncoder *)self profile];
      id v16 = v13;
      id v17 = v15;
      self;
      v18 = [MEMORY[0x1E4F1CA48] array];
      v19 = [MEMORY[0x1E4F1CA80] set];
      id v20 = v17;
      v21 = +[HDDataEntity entityEnumeratorWithProfile:v17];
      v22 = HDDataEntityPredicateForRowIDs((uint64_t)v16);
      [v21 setPredicate:v22];

      v50[0] = 0;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke;
      v47[3] = &unk_1E62FD310;
      id v23 = v19;
      v24 = v16;
      id v25 = v23;
      id v48 = v23;
      id v26 = v18;
      id v49 = v26;
      [v21 enumerateWithError:v50 handler:v47];
      id v27 = v50[0];
      uint64_t v28 = [v26 count];
      if (v28 == [v24 count])
      {
        id v29 = v26;
        v30 = v20;
      }
      else
      {
        v41 = [MEMORY[0x1E4F1CA80] setWithArray:v24];
        [v41 minusSet:v25];
        v42 = v20;
        +[HDDataEntity entityEnumeratorWithProfile:v20];
        v31 = v43 = v24;

        v32 = [v41 allObjects];
        v33 = HDDataEntityPredicateForRowIDs((uint64_t)v32);
        [v31 setPredicate:v33];

        id v46 = v27;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke_2;
        v44[3] = &unk_1E6300148;
        id v34 = v26;
        id v45 = v34;
        [v31 enumerateWithError:&v46 handler:v44];
        id v35 = v46;

        id v36 = v34;
        v21 = v31;
        v30 = v42;
        v24 = v43;
        id v27 = v35;
      }
      BOOL v14 = 1;

      uint64_t v37 = [(HDEntityEncoder *)self authorizationFilter];
      v38 = (void *)v37;
      if (v37)
      {
        uint64_t v39 = (*(void (**)(uint64_t, id))(v37 + 16))(v37, v26);

        id v26 = (id)v39;
      }
      [v10 _addCorrelatedObjects:v26];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end