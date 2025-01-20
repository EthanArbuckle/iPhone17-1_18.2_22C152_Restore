@interface AMSSQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation AMSSQLitePropertyPredicate

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)AMSSQLitePropertyPredicate;
  id v3 = [(AMSSQLitePredicate *)&v7 hash];
  v4 = [(AMSSQLitePropertyPredicate *)self property];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSQLitePropertyPredicate;
  if ([(AMSSQLitePredicate *)&v11 isEqual:v4])
  {
    unint64_t v5 = [(AMSSQLitePropertyPredicate *)self property];
    v6 = [v4 property];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      objc_super v7 = [(AMSSQLitePropertyPredicate *)self property];
      v8 = [v4 property];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id v3 = [(objc_class *)a3 joinClauseForProperty:self->_property];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
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