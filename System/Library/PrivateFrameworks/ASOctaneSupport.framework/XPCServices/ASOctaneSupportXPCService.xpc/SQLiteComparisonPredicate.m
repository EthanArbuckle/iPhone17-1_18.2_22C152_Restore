@interface SQLiteComparisonPredicate
+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)_comparisonTypeString;
- (id)description;
- (id)value;
- (int64_t)comparisonType;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToLongLong:(int64_t)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];
  v8 = [a1 predicateWithProperty:v6 equalToValue:v7];

  return v8;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return [a1 predicateWithProperty:a3 value:a4 comparisonType:1];
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class());
  v9[3] = a5;
  id v10 = [v8 copy];

  v11 = (void *)v9[1];
  v9[1] = v10;

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___NSCopying]) {
    id v12 = [v7 copy];
  }
  else {
    id v12 = v7;
  }
  v13 = (void *)v9[4];
  v9[4] = v12;

  return v9;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SQLiteComparisonPredicate;
  [(SQLitePropertyPredicate *)&v7 applyBinding:v6 atIndex:a4];
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
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  property = self->super._property;
  id v6 = [(SQLiteComparisonPredicate *)self _comparisonTypeString];
  objc_super v7 = +[NSString stringWithFormat:@"<%@: %p> %@ %@ '%@'", v4, self, property, v6, self->_value];

  return v7;
}

- (unint64_t)hash
{
  v3 = [(SQLitePropertyPredicate *)self property];
  v4 = (char *)[v3 hash];
  v5 = [(SQLiteComparisonPredicate *)self value];
  id v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SQLiteComparisonPredicate;
  if ([(SQLitePropertyPredicate *)&v12 isEqual:v4]
    && (id v5 = [(SQLiteComparisonPredicate *)self comparisonType],
        v5 == [v4 comparisonType]))
  {
    id v6 = [(SQLiteComparisonPredicate *)self value];
    objc_super v7 = [v4 value];
    if (v6 == v7)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      id v8 = [(SQLiteComparisonPredicate *)self value];
      v9 = [v4 value];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v4 = [(SQLitePropertyPredicate *)self _transformedSQLForEntityClass:a3];
  id v5 = [(SQLiteComparisonPredicate *)self _comparisonTypeString];
  id v6 = +[NSString stringWithFormat:@"%@ %@ ?", v4, v5];

  return v6;
}

- (id)_comparisonTypeString
{
  int64_t v2 = [(SQLiteComparisonPredicate *)self comparisonType];
  if ((unint64_t)(v2 - 1) > 6) {
    return 0;
  }
  else {
    return off_1002D50B8[v2 - 1];
  }
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