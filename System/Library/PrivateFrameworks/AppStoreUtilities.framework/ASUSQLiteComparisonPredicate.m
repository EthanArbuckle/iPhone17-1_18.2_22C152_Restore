@interface ASUSQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (__CFString)_comparisonTypeString;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (id)value;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation ASUSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  v6 = (objc_class *)NSNumber;
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithLongLong:a4];
  v9 = [a1 predicateWithProperty:v7 equalToValue:v8];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)[a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v9[2] = a5;
  uint64_t v10 = [v8 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  if ([v7 conformsToProtocol:&unk_26FC1CAC8]) {
    id v12 = (id)[v7 copy];
  }
  else {
    id v12 = v7;
  }
  v13 = (void *)v9[3];
  v9[3] = v12;

  return v9;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 bindString:self->_value atPosition:*a4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 bindNumber:self->_value atPosition:*a4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 bindUUID:self->_value atPosition:*a4];
      }
    }
  }
  ++*a4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  property = self->super._property;
  id v7 = -[ASUSQLiteComparisonPredicate _comparisonTypeString]((__CFString *)self);
  id v8 = [v3 stringWithFormat:@"<%@: %p> %@ %@ '%@'", v5, self, property, v7, self->_value];

  return v8;
}

- (__CFString)_comparisonTypeString
{
  if (result)
  {
    uint64_t v1 = [(__CFString *)result comparisonType];
    if ((unint64_t)(v1 - 1) > 6) {
      return 0;
    }
    else {
      return off_26522FCF0[v1 - 1];
    }
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [(ASUSQLitePropertyPredicate *)self property];
  uint64_t v4 = [v3 hash];
  v5 = [(ASUSQLiteComparisonPredicate *)self value];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASUSQLiteComparisonPredicate;
  if ([(ASUSQLitePropertyPredicate *)&v12 isEqual:v4]
    && (int64_t v5 = [(ASUSQLiteComparisonPredicate *)self comparisonType],
        v5 == [v4 comparisonType]))
  {
    unint64_t v6 = [(ASUSQLiteComparisonPredicate *)self value];
    id v7 = [v4 value];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      id v8 = [(ASUSQLiteComparisonPredicate *)self value];
      v9 = [v4 value];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  int64_t v5 = [(ASUSQLitePropertyPredicate *)self property];
  unint64_t v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];

  id v7 = NSString;
  id v8 = -[ASUSQLiteComparisonPredicate _comparisonTypeString]((__CFString *)self);
  v9 = [v7 stringWithFormat:@"%@ %@ ?", v6, v8];

  return v9;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end