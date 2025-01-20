@interface HDSQLiteComparisonPredicate
+ (id)predicateWithCoalescedProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4;
+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5;
+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6;
+ (id)predicateWithProperty:(id)a3 containsString:(id)a4;
+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 ifNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6;
+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4;
+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5;
+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (id)value;
- (int64_t)comparisonType;
- (uint64_t)_comparisonTypeString;
- (unint64_t)hash;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

- (void).cxx_destruct
{
}

+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[_HDSQLiteComparisonPredicateSubquery alloc] initWithProperty:v11 comparisonType:a4 subqueryDescriptor:v10 subqueryProperties:v9];

  return v12;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v8 value:v7 comparisonType:a5];

  return v9;
}

- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDSQLiteComparisonPredicate;
  v12 = [(HDSQLiteComparisonPredicate *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_comparisonType = a5;
    uint64_t v14 = [v10 copy];
    property = v13->super._property;
    v13->super._property = (NSString *)v14;

    v13->_influenceIndexUsage = a6;
    if ([v11 conformsToProtocol:&unk_26CC25A00]) {
      v16 = [v11 copy];
    }
    else {
      v16 = v11;
    }
    value = v13->_value;
    v13->_value = v16;
  }
  return v13;
}

- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  return [(HDSQLiteComparisonPredicate *)self initWithProperty:a3 value:a4 comparisonType:a5 influenceIndexUsage:1];
}

- (id)SQLForEntityClass:(Class)a3
{
  v5 = [(HDSQLitePropertyPredicate *)self property];
  v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  id v7 = NSString;
  if (self->_influenceIndexUsage) {
    id v8 = &stru_26CC1AE10;
  }
  else {
    id v8 = @"+";
  }
  id v9 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  id v10 = [v7 stringWithFormat:@"(%@%@ %@ ?)", v8, v6, v9];

  return v10;
}

- (uint64_t)_comparisonTypeString
{
  if (a1)
  {
    HDSQLOperatorForComparisonType(a1[2]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:2];
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:5];
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:3];
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:6];
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:4];
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:8];
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[_HDSQLiteComparisonPredicateLikeWithEscape alloc] initWithProperty:v9 value:v8 escapeCharacter:v7];

  return v10;
}

+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = [v6 length];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = ___StringEscapingGlobPatternsForLikePredicate_block_invoke;
  v15 = &unk_2643D4C68;
  v17 = v18;
  id v9 = v7;
  id v16 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, &v12);

  _Block_object_dispose(v18, 8);
  id v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5, v9, @"~", v12, v13, v14, v15 likeValue escapeCharacter];

  return v10;
}

+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = _StringEscapingSpecialCharactersForLikePredicate(a4);
  uint64_t v8 = [v5 stringWithFormat:@"%@%%", v7];

  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = _StringEscapingSpecialCharactersForLikePredicate(a4);
  uint64_t v8 = [v5 stringWithFormat:@"%%%@", v7];

  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 containsString:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = _StringEscapingSpecialCharactersForLikePredicate(a4);
  uint64_t v8 = [v5 stringWithFormat:@"%%%@%%", v7];

  id v9 = +[HDSQLiteComparisonPredicate predicateWithProperty:v6 likeValue:v8 escapeCharacter:@"~"];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v10 value:v9 comparisonType:a5 influenceIndexUsage:v6];

  return v11;
}

+ (id)predicateWithProperty:(id)a3 ifNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [[_HDSQLiteComparisonPredicateIfNull alloc] initWithProperty:v11 ifPropertyIsNullValue:v10 value:v9 comparisonType:a6];

  return v12;
}

+ (id)predicateWithCoalescedProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[_HDSQLiteComparisonPredicateCoalesce alloc] initWithProperties:v8 value:v7 comparisonType:a5];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[_HDSQLiteTwoPropertyComparisonPredicate alloc] initWithProperty:v8 comparisonType:a4 otherProperty:v7];

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->super._property hash];
  return [self->_value hash] ^ v3 ^ self->_influenceIndexUsage;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteComparisonPredicate;
  BOOL v7 = [(HDSQLitePropertyPredicate *)&v9 isEqual:v4]
    && self->_comparisonType == v4[2]
    && ((value = self->_value, BOOL v6 = v4[3], value == v6)
     || v6 && -[NSObject isEqual:](value, "isEqual:"))
    && self->_influenceIndexUsage == *((unsigned __int8 *)v4 + 32);

  return v7;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteComparisonPredicate;
  if ([(HDSQLitePropertyPredicate *)&v7 isCompatibleWithPredicate:v4]) {
    BOOL v5 = self->_comparisonType == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  NSUInteger v3 = NSString;
  if (self->_influenceIndexUsage) {
    v4 = &stru_26CC1AE10;
  }
  else {
    v4 = @"+";
  }
  property = self->super._property;
  BOOL v6 = -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  objc_super v7 = [v3 stringWithFormat:@"<\"%@%@\" %@ %@>", v4, property, v6, self->_value];

  return v7;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

@end