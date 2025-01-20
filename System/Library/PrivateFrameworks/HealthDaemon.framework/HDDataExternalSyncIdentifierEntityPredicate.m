@interface HDDataExternalSyncIdentifierEntityPredicate
+ (__CFString)_propertyForKey:(uint64_t)a1;
+ (id)_valueClassForKey:(uint64_t)a1;
+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4;
+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4;
+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5;
- (NSString)description;
- (id)SQLForEntityClass:(Class)a3;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDDataExternalSyncIdentifierEntityPredicate

+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = self;
  v12 = +[HDDataExternalSyncIdentifierEntityPredicate _propertyForKey:](v11, v9);
  if (v12)
  {
    +[HDDataExternalSyncIdentifierEntityPredicate _valueClassForKey:](v11, v9);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if (objc_opt_isKindOfClass()) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    if ([v14 count]) {
      [MEMORY[0x1E4F65D10] containsPredicateWithProperty:v12 values:v14];
    }
    else {
    uint64_t v20 = [MEMORY[0x1E4F65D58] falsePredicate];
    }

    id v10 = v23;
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  v21 = (void *)v8[1];
  v8[1] = v20;

  *((unsigned char *)v8 + 16) = 0;

  return v8;
}

+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = +[HDDataExternalSyncIdentifierEntityPredicate _propertyForKey:](v13, v11);
  if (v14)
  {
    if (v12 || a5 != 5)
    {
      +[HDDataExternalSyncIdentifierEntityPredicate _valueClassForKey:](v13, v11);
      if (objc_opt_isKindOfClass()) {
        [MEMORY[0x1E4F65D00] predicateWithProperty:v14 value:v12 comparisonType:HDSQLiteComparisonTypeForPredicateOperator()];
      }
      else {
      uint64_t v15 = [MEMORY[0x1E4F65D58] BOOLeanPredicateWithValue:a5 == 5];
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:v14];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F65D58] falsePredicate];
  }
  uint64_t v16 = v15;

  uint64_t v17 = (void *)v10[1];
  v10[1] = v16;

  if (v12) {
    BOOL v18 = a5 == 5;
  }
  else {
    BOOL v18 = 0;
  }
  char v19 = v18;
  *((unsigned char *)v10 + 16) = v19;

  return v10;
}

+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  v5 = objc_alloc_init((Class)a1);
  id v6 = (void *)v5[1];
  v5[1] = 0;

  *((unsigned char *)v5 + 16) = !a4;

  return v5;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v6 = (void *)[(objc_class *)a3 entityClassForEnumeration];
  id v7 = [v6 disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
  id v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"object_id"];
  id v9 = [(HDSQLitePredicate *)self->_valuePredicate SQLForEntityClass:objc_opt_class()];
  id v10 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
  id v11 = v10;
  if (!self->_valuePredicate) {
    goto LABEL_15;
  }
  [v10 appendFormat:@"EXISTS (SELECT 1 FROM %@ WHERE (%@=%@ AND %@))", v5, v7, v8, v9, 0];
  if (self->_matchObjectsWithoutKey) {
    [v11 appendString:@" OR "];
  }
  if (!self->_valuePredicate || self->_matchObjectsWithoutKey)
  {
LABEL_15:
    if (self->_matchObjectsWithoutKey) {
      id v12 = @"NOT EXISTS";
    }
    else {
      id v12 = @"EXISTS";
    }
    [v11 appendFormat:@"%@ (SELECT 1 FROM %@ WHERE (%@=%@))", v12, v5, v7, v8, 0];
  }
  [v11 appendString:@""]);

  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

- (NSString)description
{
  valuePredicate = self->_valuePredicate;
  if (valuePredicate)
  {
    if (self->_matchObjectsWithoutKey)
    {
      v4 = NSString;
      v5 = [(HDSQLitePredicate *)valuePredicate description];
      id v6 = [v4 stringWithFormat:@"does not exist OR %@", v5];

      goto LABEL_10;
    }
    uint64_t v8 = [(HDSQLitePredicate *)valuePredicate description];
  }
  else
  {
    if (self->_matchObjectsWithoutKey) {
      id v7 = @"does not exist";
    }
    else {
      id v7 = @"exists";
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@", v7];
  }
  id v6 = (void *)v8;
LABEL_10:
  id v9 = [NSString stringWithFormat:@"<%@: %@>", *MEMORY[0x1E4F2A1F0], v6];

  return (NSString *)v9;
}

+ (__CFString)_propertyForKey:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 isEqualToString:*MEMORY[0x1E4F2A1F0]])
  {
    v3 = @"sid";
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F2A1F8]])
  {
    v3 = @"version";
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)_valueClassForKey:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (([v2 isEqualToString:*MEMORY[0x1E4F2A1F0]] & 1) != 0
    || [v2 isEqualToString:*MEMORY[0x1E4F2A1F8]])
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end