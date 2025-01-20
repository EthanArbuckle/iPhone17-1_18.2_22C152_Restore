@interface _HDSQLiteTwoPropertyComparisonPredicate
- (_HDSQLiteTwoPropertyComparisonPredicate)initWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation _HDSQLiteTwoPropertyComparisonPredicate

- (_HDSQLiteTwoPropertyComparisonPredicate)initWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_HDSQLiteTwoPropertyComparisonPredicate;
  return [(HDSQLiteComparisonPredicate *)&v6 initWithProperty:a3 value:a5 comparisonType:a4];
}

- (id)description
{
  v3 = NSString;
  v4 = [(HDSQLitePropertyPredicate *)self property];
  v5 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  objc_super v6 = [(_HDSQLiteTwoPropertyComparisonPredicate *)self otherProperty];
  v7 = [v3 stringWithFormat:@"<%@ %@ %@>", v4, v5, v6];

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = NSString;
  objc_super v6 = [(objc_class *)a3 disambiguatedSQLForProperty:self->super.super._property];
  v7 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v8 = [(_HDSQLiteTwoPropertyComparisonPredicate *)self otherProperty];
  v9 = [(objc_class *)a3 disambiguatedSQLForProperty:v8];
  v10 = [v5 stringWithFormat:@"(%@ %@ %@)", v6, v7, v9];

  return v10;
}

@end