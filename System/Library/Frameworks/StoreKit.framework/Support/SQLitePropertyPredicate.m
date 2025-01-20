@interface SQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (SQLiteValueTransform)transform;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (id)_transformedSQLForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
- (void)setTransform:(id)a3;
@end

@implementation SQLitePropertyPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

- (id)_transformedSQLForEntityClass:(Class)a3
{
  v5 = [(SQLitePropertyPredicate *)self property];
  v6 = [(objc_class *)a3 disambiguatedSQLForProperty:v5];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(SQLitePropertyPredicate *)self property];
  }
  v9 = v8;

  v10 = [(SQLitePropertyPredicate *)self transform];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 transformSQLWithRoot:v9];
  }
  else
  {
    id v12 = v9;
  }
  v13 = v12;

  return v13;
}

- (NSString)property
{
  return self->_property;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v8 = a3;
  v6 = [(SQLitePropertyPredicate *)self transform];
  v7 = v6;
  if (v6) {
    [v6 applyTransformBinding:v8 atIndex:a4];
  }
}

- (SQLiteValueTransform)transform
{
  return self->_transform;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  v3 = [(objc_class *)a3 joinClauseForProperty:self->_property];
  if (v3)
  {
    v4 = +[NSSet setWithObject:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)SQLitePropertyPredicate;
  id v3 = [(SQLitePredicate *)&v9 hash];
  v4 = [(SQLitePropertyPredicate *)self property];
  id v5 = [v4 hash];
  v6 = [(SQLitePropertyPredicate *)self transform];
  v7 = (char *)[v6 hash] + (void)v5 + (unint64_t)v3;

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SQLitePropertyPredicate;
  if ([(SQLitePredicate *)&v16 isEqual:v6])
  {
    v7 = [(SQLitePropertyPredicate *)self property];
    id v8 = [v6 property];
    if (v7 == v8
      || ([(SQLitePropertyPredicate *)self property],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v6 property],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      v10 = [(SQLitePropertyPredicate *)self transform];
      uint64_t v11 = [v6 transform];
      if (v10 == (void *)v11)
      {

        unsigned __int8 v9 = 1;
      }
      else
      {
        id v12 = (void *)v11;
        v13 = [(SQLitePropertyPredicate *)self transform];
        v14 = [v6 transform];
        unsigned __int8 v9 = [v13 isEqual:v14];
      }
      if (v7 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  unsigned __int8 v9 = 0;
LABEL_12:

  return v9;
}

- (void)setTransform:(id)a3
{
}

@end