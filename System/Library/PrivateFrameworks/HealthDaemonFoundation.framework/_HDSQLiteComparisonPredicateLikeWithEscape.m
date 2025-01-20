@interface _HDSQLiteComparisonPredicateLikeWithEscape
- (NSString)escapeCharacter;
- (_HDSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5;
- (id)SQLForEntityClass:(Class)a3;
@end

@implementation _HDSQLiteComparisonPredicateLikeWithEscape

- (_HDSQLiteComparisonPredicateLikeWithEscape)initWithProperty:(id)a3 value:(id)a4 escapeCharacter:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HDSQLiteComparisonPredicateLikeWithEscape;
  v10 = [(HDSQLiteComparisonPredicate *)&v13 initWithProperty:a3 value:a4 comparisonType:8];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_escapeCharacter, a5);
  }

  return v11;
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = [(HDSQLitePropertyPredicate *)self property];
  v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  v7 = [NSString stringWithFormat:@"(%@ LIKE ? ESCAPE '%@')", v6, self->_escapeCharacter];

  return v7;
}

- (NSString)escapeCharacter
{
  return self->_escapeCharacter;
}

- (void).cxx_destruct
{
}

@end