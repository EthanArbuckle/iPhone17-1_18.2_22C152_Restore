@interface HDSQLiteRawPredicate
+ (id)predicateWithSQL:(id)a3 overProperties:(id)a4 values:(id)a5;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDSQLiteRawPredicate

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_properties count])
  {
    v5 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_properties;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[objc_class joinClausesForProperty:](a3, "joinClausesForProperty:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 unionSet:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = [MEMORY[0x263EFFA08] set];
  }

  return v5;
}

+ (id)predicateWithSQL:(id)a3 overProperties:(id)a4 values:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"HDSQLitePredicate.m", 946, @"Invalid parameter not satisfying: %@", @"sql != nil" object file lineNumber description];
  }
  v12 = objc_opt_new();
  uint64_t v13 = [v9 copy];
  long long v14 = (void *)v12[1];
  v12[1] = v13;

  uint64_t v15 = [v10 copy];
  long long v16 = (void *)v12[2];
  v12[2] = v15;

  uint64_t v17 = [v11 copy];
  uint64_t v18 = (void *)v12[3];
  v12[3] = v17;

  return v12;
}

- (id)SQLForEntityClass:(Class)a3
{
  return self->_sql;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_values;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        _BindValueToStatement(*(void **)(*((void *)&v11 + 1) + 8 * v10++), a3, a4);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_sql, 0);
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteRawPredicate;
  if (![(HDSQLitePredicate *)&v9 isCompatibleWithPredicate:v4]) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(NSString *)self->_sql isEqualToString:v4[1]]) {
    goto LABEL_7;
  }
  properties = self->_properties;
  v6 = (NSArray *)v4[2];
  if (properties == v6)
  {
    char v7 = 1;
    goto LABEL_8;
  }
  if (v6) {
    char v7 = -[NSArray isEqual:](properties, "isEqual:");
  }
  else {
LABEL_7:
  }
    char v7 = 0;
LABEL_8:

  return v7;
}

- (id)description
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = self->_sql;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = self->_values;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [(NSString *)v3 rangeOfString:@"?"];
        if (v11)
        {
          uint64_t v12 = v10;
          uint64_t v13 = v11;
          long long v14 = [v9 description];
          uint64_t v15 = -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", v12, v13, v14);

          v3 = (NSString *)v15;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v16 = NSString;
  uint64_t v17 = [(NSArray *)self->_properties componentsJoinedByString:@", "];
  uint64_t v18 = [v16 stringWithFormat:@"<SQL: '%@>' joining over (%@)", v3, v17, (void)v20];

  return v18;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteRawPredicate;
  id v3 = [(HDSQLitePredicate *)&v7 hash];
  NSUInteger v4 = (NSUInteger)v3 + [(NSString *)self->_sql hash];
  uint64_t v5 = [(NSArray *)self->_values hash];
  return v4 + v5 + [(NSArray *)self->_properties hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteRawPredicate;
  if (![(HDSQLitePredicate *)&v13 isEqual:v4]) {
    goto LABEL_12;
  }
  sql = self->_sql;
  uint64_t v6 = (NSString *)v4[1];
  if (sql != v6 && (!v6 || !-[NSString isEqual:](sql, "isEqual:"))) {
    goto LABEL_12;
  }
  properties = self->_properties;
  uint64_t v8 = (NSArray *)v4[2];
  if (properties != v8 && (!v8 || !-[NSArray isEqual:](properties, "isEqual:"))) {
    goto LABEL_12;
  }
  values = self->_values;
  uint64_t v10 = (NSArray *)v4[3];
  if (values == v10)
  {
    char v11 = 1;
    goto LABEL_13;
  }
  if (v10) {
    char v11 = -[NSArray isEqual:](values, "isEqual:");
  }
  else {
LABEL_12:
  }
    char v11 = 0;
LABEL_13:

  return v11;
}

@end