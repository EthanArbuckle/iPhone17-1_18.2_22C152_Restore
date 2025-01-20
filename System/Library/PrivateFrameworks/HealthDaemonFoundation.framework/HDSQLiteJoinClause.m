@interface HDSQLiteJoinClause
+ (id)innerJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7;
+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7;
+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7 additionalPredicate:(id)a8;
- (BOOL)isEqual:(id)a3;
- (Class)targetEntityClass;
- (NSString)additionalPredicate;
- (NSString)joinAsName;
- (NSString)localReferenceProperty;
- (NSString)localTable;
- (NSString)targetKeyProperty;
- (id)SQLJoinClause;
- (id)_initWithJoinType:(void *)a3 fromTable:(void *)a4 toTargetEntity:(void *)a5 as:(void *)a6 localReference:(void *)a7 targetKey:(void *)a8 additionalPredicate:;
- (id)copyWithJoinType:(int64_t)a3;
- (id)description;
- (int64_t)joinType;
- (unint64_t)hash;
@end

@implementation HDSQLiteJoinClause

- (unint64_t)hash
{
  v3 = NSStringFromClass(self->_targetEntityClass);
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_localTable hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_joinAsName hash] ^ v4;
  NSUInteger v7 = [(NSString *)self->_localReferenceProperty hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_targetKeyProperty hash] ^ self->_joinType;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPredicate, 0);
  objc_storeStrong((id *)&self->_targetKeyProperty, 0);
  objc_storeStrong((id *)&self->_localReferenceProperty, 0);
  objc_storeStrong((id *)&self->_targetEntityClass, 0);
  objc_storeStrong((id *)&self->_localTable, 0);

  objc_storeStrong((id *)&self->_joinAsName, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    Class targetEntityClass = self->_targetEntityClass;
    if (targetEntityClass == (Class)[v7 targetEntityClass])
    {
      localTable = self->_localTable;
      v12 = [v7 localTable];
      if (![(NSString *)localTable isEqualToString:v12]
        || (int64_t joinType = self->_joinType, joinType != [v7 joinType]))
      {
        BOOL v9 = 0;
LABEL_19:

        goto LABEL_4;
      }
      v14 = [(HDSQLiteJoinClause *)self joinAsName];
      v15 = [v7 joinAsName];
      if (v14 == v15) {
        goto LABEL_12;
      }
      uint64_t v16 = [v7 joinAsName];
      if (!v16)
      {
        BOOL v9 = 0;
        goto LABEL_18;
      }
      v3 = (void *)v16;
      uint64_t v4 = [(HDSQLiteJoinClause *)self joinAsName];
      NSUInteger v5 = [v7 joinAsName];
      if ([v4 isEqualToString:v5])
      {
LABEL_12:
        localReferenceProperty = self->_localReferenceProperty;
        v18 = [v7 localReferenceProperty];
        if ([(NSString *)localReferenceProperty isEqualToString:v18])
        {
          targetKeyProperty = self->_targetKeyProperty;
          v20 = [v7 targetKeyProperty];
          BOOL v9 = [(NSString *)targetKeyProperty isEqualToString:v20];
        }
        else
        {

          BOOL v9 = 0;
        }
        if (v14 == v15) {
          goto LABEL_18;
        }
      }
      else
      {
        BOOL v9 = 0;
      }

LABEL_18:
      goto LABEL_19;
    }
  }
  BOOL v9 = 0;
LABEL_4:

  return v9;
}

- (NSString)joinAsName
{
  joinAsName = self->_joinAsName;
  if (joinAsName)
  {
    v3 = joinAsName;
  }
  else
  {
    v3 = [(objc_class *)self->_targetEntityClass disambiguatedDatabaseTable];
  }

  return v3;
}

- (Class)targetEntityClass
{
  return self->_targetEntityClass;
}

- (NSString)localTable
{
  return self->_localTable;
}

- (NSString)targetKeyProperty
{
  return self->_targetKeyProperty;
}

- (NSString)localReferenceProperty
{
  return self->_localReferenceProperty;
}

- (int64_t)joinType
{
  return self->_joinType;
}

+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7 additionalPredicate:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  v18 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], (void *)1, v17, a4, v16, v15, v14, v13);

  return v18;
}

+ (id)leftJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], (void *)1, v14, a4, v13, v12, v11, 0);

  return v15;
}

+ (id)innerJoinClauseFromTable:(id)a3 toTargetEntity:(Class)a4 as:(id)a5 localReference:(id)a6 targetKey:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)[HDSQLiteJoinClause alloc], 0, v14, a4, v13, v12, v11, 0);

  return v15;
}

- (id)_initWithJoinType:(void *)a3 fromTable:(void *)a4 toTargetEntity:(void *)a5 as:(void *)a6 localReference:(void *)a7 targetKey:(void *)a8 additionalPredicate:
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!a1) {
    goto LABEL_8;
  }
  if (v15)
  {
    if (a4) {
      goto LABEL_4;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, @"HDSQLiteJoinClause.m", 91, @"Invalid parameter not satisfying: %@", @"localTable != nil" object file lineNumber description];

    if (a4)
    {
LABEL_4:
      if (v17) {
        goto LABEL_5;
      }
LABEL_11:
      v33 = [MEMORY[0x263F08690] currentHandler];
      [v33 handleFailureInMethod:sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, @"HDSQLiteJoinClause.m", 93, @"Invalid parameter not satisfying: %@", @"localReferenceProperty != nil" object file lineNumber description];

      if (v18) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, @"HDSQLiteJoinClause.m", 92, @"Invalid parameter not satisfying: %@", @"targetEntityClass != nil" object file lineNumber description];

  if (!v17) {
    goto LABEL_11;
  }
LABEL_5:
  if (v18) {
    goto LABEL_6;
  }
LABEL_12:
  v34 = [MEMORY[0x263F08690] currentHandler];
  [v34 handleFailureInMethod:sel__initWithJoinType_fromTable_toTargetEntity_as_localReference_targetKey_additionalPredicate_, a1, @"HDSQLiteJoinClause.m", 94, @"Invalid parameter not satisfying: %@", @"targetKeyProperty != nil" object file lineNumber description];

LABEL_6:
  v35.receiver = a1;
  v35.super_class = (Class)HDSQLiteJoinClause;
  a1 = (id *)objc_msgSendSuper2(&v35, sel_init);
  if (a1)
  {
    uint64_t v20 = [v15 copy];
    id v21 = a1[2];
    a1[2] = (id)v20;

    objc_storeStrong(a1 + 3, a4);
    uint64_t v22 = [v16 copy];
    id v23 = a1[1];
    a1[1] = (id)v22;

    uint64_t v24 = [v17 copy];
    id v25 = a1[4];
    a1[4] = (id)v24;

    uint64_t v26 = [v18 copy];
    id v27 = a1[5];
    a1[5] = (id)v26;

    uint64_t v28 = [v19 copy];
    id v29 = a1[7];
    a1[7] = (id)v28;

    a1[6] = a2;
  }
LABEL_8:

  return a1;
}

- (id)SQLJoinClause
{
  v3 = [(objc_class *)self->_targetEntityClass disambiguatedDatabaseTable];
  BOOL v4 = [(NSString *)self->_localReferenceProperty isEqualToString:self->_targetKeyProperty];
  NSUInteger v5 = NSString;
  if (v4)
  {
    NSUInteger v6 = [NSString stringWithFormat:@"USING(%@)", self->_localReferenceProperty];
  }
  else
  {
    localTable = self->_localTable;
    localReferenceProperty = self->_localReferenceProperty;
    BOOL v9 = [(HDSQLiteJoinClause *)self joinAsName];
    v10 = [v5 stringWithFormat:@"%@.%@=%@.%@", localTable, localReferenceProperty, v9, self->_targetKeyProperty];

    additionalPredicate = self->_additionalPredicate;
    if (additionalPredicate) {
      [NSString stringWithFormat:@"ON (%@ AND %@)", v10, additionalPredicate];
    }
    else {
    NSUInteger v6 = [NSString stringWithFormat:@"ON %@", v10, v17];
    }
  }
  int64_t joinType = self->_joinType;
  id v13 = @"LEFT";
  if (joinType != 1) {
    id v13 = 0;
  }
  if (joinType) {
    id v14 = v13;
  }
  else {
    id v14 = @"INNER";
  }
  if (self->_joinAsName) {
    [NSString stringWithFormat:@"%@ JOIN %@ AS %@ %@", v14, v3, self->_joinAsName, v6];
  }
  else {
  id v15 = [NSString stringWithFormat:@"%@ JOIN %@ %@", v14, v3, v6, v18];
  }

  return v15;
}

- (id)copyWithJoinType:(int64_t)a3
{
  if (self->_joinType == a3)
  {
    return self;
  }
  else
  {
    NSUInteger v5 = [HDSQLiteJoinClause alloc];
    joinAsName = self->_joinAsName;
    localTable = self->_localTable;
    Class targetEntityClass = self->_targetEntityClass;
    localReferenceProperty = self->_localReferenceProperty;
    targetKeyProperty = self->_targetKeyProperty;
    additionalPredicate = self->_additionalPredicate;
    return -[HDSQLiteJoinClause _initWithJoinType:fromTable:toTargetEntity:as:localReference:targetKey:additionalPredicate:]((id *)&v5->super.isa, (void *)a3, localTable, targetEntityClass, joinAsName, localReferenceProperty, targetKeyProperty, additionalPredicate);
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, localTable:%@, targetEntity:%@>", objc_opt_class(), self, self->_localTable, self->_targetEntityClass];
}

- (NSString)additionalPredicate
{
  return self->_additionalPredicate;
}

@end