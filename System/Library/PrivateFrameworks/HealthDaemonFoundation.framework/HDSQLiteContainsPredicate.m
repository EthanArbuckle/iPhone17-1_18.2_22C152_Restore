@interface HDSQLiteContainsPredicate
+ (HDSQLiteContainsPredicate)_containsPredicateWithProperty:(void *)a3 values:(uint64_t)a4 contains:;
+ (id)_arrayFromValues:(uint64_t)a1;
+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4;
+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)contains;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 contains:(BOOL)a5;
- (NSArray)values;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDSQLiteContainsPredicate

+ (id)containsPredicateWithProperty:(id)a3 values:(id)a4
{
  return +[HDSQLiteContainsPredicate _containsPredicateWithProperty:values:contains:]((uint64_t)a1, a3, a4, 1);
}

+ (HDSQLiteContainsPredicate)_containsPredicateWithProperty:(void *)a3 values:(uint64_t)a4 contains:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  v9 = +[HDSQLiteContainsPredicate _arrayFromValues:](v8, v6);

  if ([v9 count] == 1)
  {
    if (a4) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    uint64_t v11 = [v9 firstObject];
    v12 = +[HDSQLiteComparisonPredicate predicateWithProperty:v7 value:v11 comparisonType:v10];

    id v7 = (id)v11;
  }
  else
  {
    v12 = [[HDSQLiteContainsPredicate alloc] initWithProperty:v7 values:v9 contains:a4];
  }

  return v12;
}

+ (id)_arrayFromValues:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 allObjects];
    goto LABEL_5;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

LABEL_14:

  return v4;
}

- (HDSQLiteContainsPredicate)initWithProperty:(id)a3 values:(id)a4 contains:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSQLiteContainsPredicate;
  uint64_t v10 = [(HDSQLiteContainsPredicate *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    property = v10->super._property;
    v10->super._property = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    values = v10->_values;
    v10->_values = (NSArray *)v13;

    v10->_contains = a5;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  uint64_t v6 = [(HDSQLitePropertyPredicate *)self property];
  uint64_t v7 = [(objc_class *)a3 disambiguatedSQLForProperty:v6];
  [v5 appendString:v7];

  if (self->_contains) {
    id v8 = CFSTR(" IN (");
  }
  else {
    id v8 = CFSTR(" NOT IN (");
  }
  [v5 appendString:v8];
  NSUInteger v9 = [(NSArray *)self->_values count];
  if (v9)
  {
    NSUInteger v10 = v9;
    [v5 appendString:@"?"];
    NSUInteger v11 = v10 - 1;
    if (v10 != 1)
    {
      do
      {
        [v5 appendString:@", ?"];
        --v11;
      }
      while (v11);
    }
  }
  [v5 appendString:@""]);
  [v5 appendString:@""]);

  return v5;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_values;
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
        HDSQLiteBindFoundationValueToStatement(a3, *a4, *(void **)(*((void *)&v11 + 1) + 8 * v10));
        ++*a4;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
}

+ (id)doesNotContainPredicateWithProperty:(id)a3 values:(id)a4
{
  return +[HDSQLiteContainsPredicate _containsPredicateWithProperty:values:contains:]((uint64_t)a1, a3, a4, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSQLiteContainsPredicate;
  if ([(HDSQLitePropertyPredicate *)&v13 isEqual:v4]
    && (int v5 = -[HDSQLiteContainsPredicate contains](self, "contains"), v5 == [v4 contains]))
  {
    uint64_t v7 = [(HDSQLiteContainsPredicate *)self values];
    uint64_t v8 = [v4 values];
    if (v7 == v8)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v9 = [v4 values];
      if (v9)
      {
        uint64_t v10 = [(HDSQLiteContainsPredicate *)self values];
        long long v11 = [v4 values];
        char v6 = [v10 isEqual:v11];
      }
      else
      {
        char v6 = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteContainsPredicate;
  if ([(HDSQLitePropertyPredicate *)&v9 isCompatibleWithPredicate:v4])
  {
    int v5 = (id *)v4;
    if (self->_contains == *((unsigned __int8 *)v5 + 16))
    {
      NSUInteger v6 = [(NSArray *)self->_values count];
      BOOL v7 = v6 == [v5[3] count];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = [(NSArray *)self->_values hk_map:&__block_literal_global_4];
  id v4 = [v3 componentsJoinedByString:@", "];
  int v5 = NSString;
  uint64_t v6 = [(HDSQLitePropertyPredicate *)self property];
  BOOL v7 = (void *)v6;
  if (self->_contains) {
    uint64_t v8 = "";
  }
  else {
    uint64_t v8 = "NOT ";
  }
  objc_super v9 = [v5 stringWithFormat:@"<\"%@\" %sIN (%@)>", v6, v8, v4];

  return v9;
}

uint64_t __40__HDSQLiteContainsPredicate_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (BOOL)contains
{
  return self->_contains;
}

- (NSArray)values
{
  return self->_values;
}

@end