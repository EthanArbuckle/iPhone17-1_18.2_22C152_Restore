@interface HDEntityEncoder
+ (int64_t)estimatedEncodedSize;
- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6;
- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7;
- (Class)entityClass;
- (HDDatabaseTransaction)transaction;
- (HDEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8;
- (HDEntityEncoder)superclassEncoder;
- (HDProfile)profile;
- (HDSQLiteDatabase)database;
- (NSDictionary)encodingOptions;
- (id)authorizationFilter;
- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)createBareObjectWithRow:(HDSQLiteRow *)a3;
- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5;
- (id)orderedProperties;
- (int64_t)purpose;
- (void)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5;
- (void)finish;
@end

@implementation HDEntityEncoder

- (HDEntityEncoder)superclassEncoder
{
  return self->_superclassEncoder;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (HDSQLiteDatabase)database
{
  return self->_database;
}

- (void)finish
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superclassEncoder, 0);
  objc_storeStrong(&self->_authorizationFilter, 0);
  objc_storeStrong((id *)&self->_encodingOptions, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  v11 = (uint64_t (**)(id, void *, void, uint64_t, id *))a7;
  v12 = [(HDEntityEncoder *)self codableRepresentationForPersistentID:a3 row:a4 error:a6];
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 encodedByteCount];
    uint64_t v15 = [(id)objc_opt_class() estimatedEncodedSize];
    if (v14 <= v15) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v14;
    }
    BOOL v17 = v11[2](v11, v13, v16, 1, a6) != 2;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (int64_t)estimatedEncodedSize
{
  return 250;
}

- (HDEntityEncoder)initWithHealthEntityClass:(Class)a3 profile:(id)a4 transaction:(id)a5 purpose:(int64_t)a6 encodingOptions:(id)a7 authorizationFilter:(id)a8
{
  id v12 = a4;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (a3)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_15:
    [MEMORY[0x1E4F28B00] currentHandler];
    v44 = int64_t v43 = a6;
    [v44 handleFailureInMethod:a2, self, @"HDEntityEncoder.m", 32, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];

    a6 = v43;
    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_16;
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v42 = int64_t v41 = a6;
  [v42 handleFailureInMethod:a2, self, @"HDEntityEncoder.m", 31, @"Invalid parameter not satisfying: %@", @"entityClass != nil" object file lineNumber description];

  a6 = v41;
  if (!v15) {
    goto LABEL_15;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_16:
  [MEMORY[0x1E4F28B00] currentHandler];
  v46 = int64_t v45 = a6;
  [v46 handleFailureInMethod:a2, self, @"HDEntityEncoder.m", 33, @"Invalid parameter not satisfying: %@", @"transaction != nil" object file lineNumber description];

  a6 = v45;
LABEL_4:
  v19 = [v16 protectedDatabase];
  Class obj = a3;
  if ((Class)objc_opt_class() == a3)
  {
    v21 = v16;
    if (v19) {
      goto LABEL_6;
    }
  }
  else
  {
    Class v20 = a3;
    v21 = v16;
    [v16 databaseForEntityClass:v20];
    id v22 = v15;
    id v23 = v18;
    id v24 = v12;
    id v25 = v17;
    id v26 = a5;
    v27 = self;
    v29 = int64_t v28 = a6;

    v19 = (void *)v29;
    a6 = v28;
    self = v27;
    a5 = v26;
    id v17 = v25;
    id v12 = v24;
    id v18 = v23;
    id v15 = v22;
    if (v19) {
      goto LABEL_6;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v40 = int64_t v47 = a6;
  [v40 handleFailureInMethod:a2, self, @"HDEntityEncoder.m", 41, @"Invalid parameter not satisfying: %@", @"entityClassDatabase != nil" object file lineNumber description];

  a6 = v47;
LABEL_6:
  v50.receiver = self;
  v50.super_class = (Class)HDEntityEncoder;
  v30 = [(HDEntityEncoder *)&v50 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_entityClass, obj);
    objc_storeStrong((id *)&v31->_profile, v12);
    objc_storeStrong((id *)&v31->_transaction, a5);
    objc_storeStrong((id *)&v31->_database, v19);
    v31->_purpose = a6;
    uint64_t v32 = [v17 copy];
    v33 = (void *)v32;
    if (v32) {
      v34 = (void *)v32;
    }
    else {
      v34 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v31->_encodingOptions, v34);

    v35 = _Block_copy(v18);
    id authorizationFilter = v31->_authorizationFilter;
    v31->_id authorizationFilter = v35;

    uint64_t v37 = [(objc_class *)class_getSuperclass(obj) entityEncoderForProfile:v15 transaction:v21 purpose:a6 encodingOptions:v17 authorizationFilter:v18];
    superclassEncoder = v31->_superclassEncoder;
    v31->_superclassEncoder = (HDEntityEncoder *)v37;
  }
  return v31;
}

- (id)orderedProperties
{
  v2 = [(HDEntityEncoder *)self->_superclassEncoder orderedProperties];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  return 0;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  id v3 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);

  return v3;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  v9 = [(HDEntityEncoder *)self createBareObjectWithRow:a4];
  if ([(HDEntityEncoder *)self applyPropertiesToObject:v9 persistentID:a3 row:a4 error:a5])
  {
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  return 0;
}

- (HDDatabaseTransaction)transaction
{
  return self->_transaction;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSDictionary)encodingOptions
{
  return self->_encodingOptions;
}

- (id)authorizationFilter
{
  return self->_authorizationFilter;
}

@end