@interface ASUSQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation ASUSQLitePropertyPredicate

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ASUSQLitePropertyPredicate;
  v3 = [(ASUSQLitePredicate *)&v7 hash];
  v4 = [(ASUSQLitePropertyPredicate *)self property];
  v5 = &v3[(void)[v4 hash]];

  return (unint64_t)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLitePropertyPredicate;
  if ([(ASUSQLitePredicate *)&v11 isEqual:v4])
  {
    v5 = [(ASUSQLitePropertyPredicate *)self property];
    v6 = [v4 property];
    if (v5 == v6)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      objc_super v7 = [(ASUSQLitePropertyPredicate *)self property];
      v8 = [v4 property];
      unsigned __int8 v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  v3 = [(objc_class *)a3 joinClauseForProperty:self->_property];
  if (v3)
  {
    id v4 = +[NSSet setWithObject:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

@end