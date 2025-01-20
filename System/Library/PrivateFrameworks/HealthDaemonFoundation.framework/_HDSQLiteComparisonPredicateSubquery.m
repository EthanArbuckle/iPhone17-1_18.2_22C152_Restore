@interface _HDSQLiteComparisonPredicateSubquery
- (BOOL)isEqual:(id)a3;
- (HDSQLiteQueryDescriptor)subqueryDescriptor;
- (NSArray)subqueryProperties;
- (_HDSQLiteComparisonPredicateSubquery)initWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation _HDSQLiteComparisonPredicateSubquery

- (_HDSQLiteComparisonPredicateSubquery)initWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (void *)MEMORY[0x263EFF9D0];
  id v13 = a3;
  v14 = [v12 null];
  v21.receiver = self;
  v21.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  v15 = [(HDSQLiteComparisonPredicate *)&v21 initWithProperty:v13 value:v14 comparisonType:a4];

  if (v15)
  {
    uint64_t v16 = [v10 copy];
    subqueryDescriptor = v15->_subqueryDescriptor;
    v15->_subqueryDescriptor = (HDSQLiteQueryDescriptor *)v16;

    uint64_t v18 = [v11 copy];
    subqueryProperties = v15->_subqueryProperties;
    v15->_subqueryProperties = (NSArray *)v18;
  }
  return v15;
}

- (id)SQLForEntityClass:(Class)a3
{
  v4 = NSString;
  v5 = [(objc_class *)a3 disambiguatedSQLForProperty:self->super.super._property];
  v6 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v7 = [(HDSQLiteQueryDescriptor *)self->_subqueryDescriptor selectSQLForProperties:self->_subqueryProperties];
  v8 = [v4 stringWithFormat:@"(%@ %@ (%@))", v5, v6, v7];

  return v8;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subqueryProperties, 0);

  objc_storeStrong((id *)&self->_subqueryDescriptor, 0);
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  unint64_t v3 = [(HDSQLiteComparisonPredicate *)&v9 hash];
  v4 = [(_HDSQLiteComparisonPredicateSubquery *)self subqueryDescriptor];
  uint64_t v5 = [v4 hash];
  v6 = [(_HDSQLiteComparisonPredicateSubquery *)self subqueryProperties];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDSQLiteComparisonPredicateSubquery;
  if (![(HDSQLiteComparisonPredicate *)&v11 isEqual:v4]) {
    goto LABEL_8;
  }
  subqueryDescriptor = self->_subqueryDescriptor;
  v6 = (HDSQLiteQueryDescriptor *)v4[5];
  if (subqueryDescriptor != v6
    && (!v6 || !-[HDSQLiteQueryDescriptor isEqual:](subqueryDescriptor, "isEqual:")))
  {
    goto LABEL_8;
  }
  subqueryProperties = self->_subqueryProperties;
  v8 = (NSArray *)v4[6];
  if (subqueryProperties == v8)
  {
    char v9 = 1;
    goto LABEL_9;
  }
  if (v8) {
    char v9 = -[NSArray isEqual:](subqueryProperties, "isEqual:");
  }
  else {
LABEL_8:
  }
    char v9 = 0;
LABEL_9:

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(HDSQLitePropertyPredicate *)self property];
  uint64_t v5 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v6 = [(HDSQLiteQueryDescriptor *)self->_subqueryDescriptor selectSQLForProperties:self->_subqueryProperties];
  unint64_t v7 = [v3 stringWithFormat:@"<%@ %@ (%@)>", v4, v5, v6];

  return v7;
}

- (HDSQLiteQueryDescriptor)subqueryDescriptor
{
  return self->_subqueryDescriptor;
}

- (NSArray)subqueryProperties
{
  return self->_subqueryProperties;
}

@end