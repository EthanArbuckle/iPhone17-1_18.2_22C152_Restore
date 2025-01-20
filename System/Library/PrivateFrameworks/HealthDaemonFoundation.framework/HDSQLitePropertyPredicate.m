@interface HDSQLitePropertyPredicate
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation HDSQLitePropertyPredicate

- (void).cxx_destruct
{
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return (id)[(objc_class *)a3 joinClausesForProperty:self->_property];
}

- (NSString)property
{
  return self->_property;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)HDSQLitePropertyPredicate;
  id v3 = [(HDSQLitePredicate *)&v7 hash];
  v4 = [(HDSQLitePropertyPredicate *)self property];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSQLitePropertyPredicate;
  if ([(HDSQLitePredicate *)&v12 isEqual:v4])
  {
    unint64_t v5 = [(HDSQLitePropertyPredicate *)self property];
    v6 = [v4 property];
    if (v5 == v6)
    {
      char v10 = 1;
    }
    else
    {
      objc_super v7 = [v4 property];
      if (v7)
      {
        v8 = [(HDSQLitePropertyPredicate *)self property];
        v9 = [v4 property];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLitePropertyPredicate;
  if (![(HDSQLitePredicate *)&v9 isCompatibleWithPredicate:v4]) {
    goto LABEL_5;
  }
  property = self->_property;
  v6 = (NSString *)v4[1];
  if (property == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSString isEqual:](property, "isEqual:");
  }
  else {
LABEL_5:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

@end