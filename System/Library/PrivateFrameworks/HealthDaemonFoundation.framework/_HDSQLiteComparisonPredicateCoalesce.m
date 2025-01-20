@interface _HDSQLiteComparisonPredicateCoalesce
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)properties;
- (_HDSQLiteComparisonPredicateCoalesce)initWithProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _HDSQLiteComparisonPredicateCoalesce

- (_HDSQLiteComparisonPredicateCoalesce)initWithProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  v9 = [(HDSQLiteComparisonPredicate *)&v13 initWithProperty:0 value:a4 comparisonType:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    properties = v9->_properties;
    v9->_properties = (NSArray *)v10;
  }
  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  unint64_t v3 = [(HDSQLiteComparisonPredicate *)&v7 hash];
  v4 = [(_HDSQLiteComparisonPredicateCoalesce *)self properties];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  if (![(HDSQLiteComparisonPredicate *)&v9 isEqual:v4]) {
    goto LABEL_5;
  }
  properties = self->_properties;
  v6 = (NSArray *)v4[5];
  if (properties == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSArray isEqual:](properties, "isEqual:");
  }
  else {
LABEL_5:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  properties = self->_properties;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58___HDSQLiteComparisonPredicateCoalesce_SQLForEntityClass___block_invoke;
  v11[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8lu32l8;
  v11[4] = a3;
  unint64_t v5 = [(NSArray *)properties hk_map:v11];
  v6 = [v5 componentsJoinedByString:@", "];
  char v7 = NSString;
  id v8 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  objc_super v9 = [v7 stringWithFormat:@"(COALESCE(%@) %@ ?)", v6, v8];

  return v9;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_properties count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
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
    id v5 = [MEMORY[0x263EFFA08] set];
  }

  return v5;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateCoalesce;
  if (![(HDSQLiteComparisonPredicate *)&v9 isCompatibleWithPredicate:v4]) {
    goto LABEL_5;
  }
  properties = self->_properties;
  v6 = (NSArray *)v4[5];
  if (properties == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSArray isEqual:](properties, "isEqual:");
  }
  else {
LABEL_5:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(NSArray *)self->_properties componentsJoinedByString:@", "];
  id v5 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v6 = [(HDSQLiteComparisonPredicate *)self value];
  char v7 = [v3 stringWithFormat:@"<\"(%@)\" %@ %@>", v4, v5, v6];

  return v7;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end