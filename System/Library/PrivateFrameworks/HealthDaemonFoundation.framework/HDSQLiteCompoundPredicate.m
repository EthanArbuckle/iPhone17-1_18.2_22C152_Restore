@interface HDSQLiteCompoundPredicate
+ (id)negatedPredicate:(id)a3;
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4;
+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)predicates;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDSQLiteCompoundPredicate

+ (id)predicateMatchingAllPredicates:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    goto LABEL_16;
  }
  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[8] = 0;
  v5[9] = 1;
  v6 = (void *)*((void *)v5 + 2);
  v17 = v5;
  *((void *)v5 + 2) = @" AND ";

  v7 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = v3;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        if ([*((id *)v14 + 2) isEqualToString:@" AND "])
        {
          [v7 addObjectsFromArray:*((void *)v14 + 3)];

          continue;
        }
      }
      objc_msgSend(v7, "addObject:", v13, v17);
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v10);
LABEL_15:

  v4 = v17;
  v15 = (void *)*((void *)v17 + 3);
  *((void *)v17 + 3) = v7;

  id v3 = v18;
LABEL_16:

  return v4;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_predicates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "SQLJoinClausesForEntityClass:", a3, (void)v12);
        if (v10)
        {
          if (!v7)
          {
            v7 = [MEMORY[0x263EFF9C0] set];
          }
          [v7 unionSet:v10];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);

  objc_storeStrong((id *)&self->_combinationOperation, 0);
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4 comparisonType:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:value:comparisonType:](HDSQLiteComparisonPredicate, "predicateWithProperty:value:comparisonType:", v8, *(void *)(*((void *)&v19 + 1) + 8 * i), a5, (void)v19);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [a1 predicateMatchingAnyPredicates:v10];

  return v17;
}

- (id)SQLForEntityClass:(Class)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_predicates count])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
    uint64_t v6 = v5;
    if (self->_unary)
    {
      [v5 appendString:self->_combinationOperation];
      v7 = [(NSArray *)self->_predicates objectAtIndex:0];
      id v8 = [v7 SQLForEntityClass:a3];
      [v6 appendString:v8];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = self->_predicates;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "SQLForEntityClass:", a3, (void)v17);
            if (v15)
            {
              if ((unint64_t)[v6 length] >= 2) {
                [v6 appendString:self->_combinationOperation];
              }
              [v6 appendString:v15];
            }
          }
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    [v6 appendString:@""], (void)v17);
  }
  else
  {
    if (self->_trueIfNoPredicates) {
      id v9 = @"1";
    }
    else {
      id v9 = @"0";
    }
    uint64_t v6 = [MEMORY[0x263F089D8] stringWithString:v9];
  }

  return v6;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_predicates;
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "bindToStatement:bindingIndex:", a3, a4, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

+ (id)negatedPredicate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init((Class)objc_opt_class());
    v4[8] = 1;
    uint64_t v5 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = @"NOT ";

    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v3, 0);
    uint64_t v7 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    goto LABEL_16;
  }
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  v5[8] = 0;
  v5[9] = 0;
  uint64_t v6 = (void *)*((void *)v5 + 2);
  long long v17 = v5;
  *((void *)v5 + 2) = @" OR ";

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v18 = v3;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        if ([*((id *)v14 + 2) isEqualToString:@" OR "])
        {
          [v7 addObjectsFromArray:*((void *)v14 + 3)];

          continue;
        }
      }
      objc_msgSend(v7, "addObject:", v13, v17);
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v10);
LABEL_15:

  v4 = v17;
  long long v15 = (void *)*((void *)v17 + 3);
  *((void *)v17 + 3) = v7;

  id v3 = v18;
LABEL_16:

  return v4;
}

+ (id)predicateWithProperty:(id)a3 equalToValues:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 values:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 notEqualToValues:(id)a4
{
  v4 = +[HDSQLiteCompoundPredicate predicateWithProperty:a3 equalToValues:a4];
  uint64_t v5 = +[HDSQLiteCompoundPredicate negatedPredicate:v4];

  return v5;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)HDSQLiteCompoundPredicate;
  id v3 = [(HDSQLitePredicate *)&v8 hash];
  NSUInteger v4 = [(NSString *)self->_combinationOperation hash];
  uint64_t v5 = [(HDSQLiteCompoundPredicate *)self predicates];
  unint64_t v6 = (unint64_t)v3 + [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSQLiteCompoundPredicate;
  if ([(HDSQLitePredicate *)&v14 isEqual:v4]
    && ((combinationOperation = self->_combinationOperation, unint64_t v6 = (NSString *)v4[2], combinationOperation == v6)
     || v6 && -[NSString isEqual:](combinationOperation, "isEqual:")))
  {
    predicates = self->_predicates;
    objc_super v8 = [v4 predicates];
    if (predicates == v8)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v9 = [v4 predicates];
      if (v9)
      {
        uint64_t v10 = self->_predicates;
        uint64_t v11 = [v4 predicates];
        char v12 = [(NSArray *)v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteCompoundPredicate;
  if ([(HDSQLitePredicate *)&v16 isCompatibleWithPredicate:v4])
  {
    uint64_t v5 = (id *)v4;
    NSUInteger v6 = [(NSArray *)self->_predicates count];
    uint64_t v7 = [v5[3] count];
    combinationOperation = self->_combinationOperation;
    uint64_t v9 = (NSString *)v5[2];
    if (combinationOperation == v9 || v9 && -[NSString isEqual:](combinationOperation, "isEqual:"))
    {
      LOBYTE(v7) = v6 == v7;
      if ((_BYTE)v7) {
        BOOL v10 = v6 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        unint64_t v11 = 1;
        do
        {
          char v12 = [(NSArray *)self->_predicates objectAtIndexedSubscript:v11 - 1];
          long long v13 = [v5[3] objectAtIndexedSubscript:v11 - 1];
          LODWORD(v7) = [v12 isCompatibleWithPredicate:v13];

          if (v7) {
            BOOL v14 = v11 >= v6;
          }
          else {
            BOOL v14 = 1;
          }
          ++v11;
        }
        while (!v14);
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_predicates, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_predicates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  BOOL v10 = NSString;
  combinationOperation = self->_combinationOperation;
  char v12 = [v3 componentsJoinedByString:@",\n\t"];
  long long v13 = [v10 stringWithFormat:@"{%@:\n\t%@\n}", combinationOperation, v12, (void)v15];

  return v13;
}

- (NSArray)predicates
{
  return self->_predicates;
}

@end