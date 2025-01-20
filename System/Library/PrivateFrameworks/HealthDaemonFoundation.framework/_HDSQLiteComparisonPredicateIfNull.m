@interface _HDSQLiteComparisonPredicateIfNull
- (BOOL)isEqual:(id)a3;
- (NSObject)ifPropertyIsNullValue;
- (_HDSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation _HDSQLiteComparisonPredicateIfNull

- (_HDSQLiteComparisonPredicateIfNull)initWithProperty:(id)a3 ifPropertyIsNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  v11 = [(HDSQLiteComparisonPredicate *)&v15 initWithProperty:a3 value:a5 comparisonType:a6];
  if (v11)
  {
    if ([v10 conformsToProtocol:&unk_26CC25A00]) {
      v12 = [v10 copy];
    }
    else {
      v12 = v10;
    }
    ifPropertyIsNullValue = v11->_ifPropertyIsNullValue;
    v11->_ifPropertyIsNullValue = v12;
  }
  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  _BindValueToStatement(self->_ifPropertyIsNullValue, a3, a4);
  id v7 = [(HDSQLiteComparisonPredicate *)self value];
  _BindValueToStatement(v7, a3, a4);
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  unint64_t v3 = [(HDSQLiteComparisonPredicate *)&v7 hash];
  v4 = [(_HDSQLiteComparisonPredicateIfNull *)self ifPropertyIsNullValue];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HDSQLiteComparisonPredicateIfNull;
  if (![(HDSQLiteComparisonPredicate *)&v9 isEqual:v4]) {
    goto LABEL_5;
  }
  ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  v6 = v4[5];
  if (ifPropertyIsNullValue == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSObject isEqual:](ifPropertyIsNullValue, "isEqual:");
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
  unint64_t v5 = [(HDSQLitePropertyPredicate *)self property];
  v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  char v7 = NSString;
  v8 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  objc_super v9 = [v7 stringWithFormat:@"(IFNULL(%@, ?) %@ ?)", v6, v8];

  return v9;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(HDSQLitePropertyPredicate *)self property];
  ifPropertyIsNullValue = self->_ifPropertyIsNullValue;
  v6 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  char v7 = [(HDSQLiteComparisonPredicate *)self value];
  v8 = [v3 stringWithFormat:@"<\"(%@, %@)\" %@ %@>", v4, ifPropertyIsNullValue, v6, v7];

  return v8;
}

- (NSObject)ifPropertyIsNullValue
{
  return self->_ifPropertyIsNullValue;
}

- (void).cxx_destruct
{
}

@end