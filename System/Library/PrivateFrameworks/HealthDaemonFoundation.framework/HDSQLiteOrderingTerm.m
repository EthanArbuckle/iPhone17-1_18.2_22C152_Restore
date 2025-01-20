@interface HDSQLiteOrderingTerm
+ (id)orderingTermWithProperty:(id)a3 entityClass:(Class)a4 ascending:(BOOL)a5;
- (BOOL)ascending;
- (BOOL)isEqual:(id)a3;
- (HDSQLiteOrderingTerm)init;
- (HDSQLiteOrderingTerm)initWithExpression:(id)a3 ascending:(BOOL)a4;
- (NSString)expression;
- (id)SQL;
- (id)description;
- (unint64_t)hash;
@end

@implementation HDSQLiteOrderingTerm

- (void).cxx_destruct
{
}

- (id)SQL
{
  v2 = HDSQLiteOrderAscending;
  if (!self->_ascending) {
    v2 = HDSQLiteOrderDescending;
  }
  return (id)[NSString stringWithFormat:@"%@ %@", self->_expression, *v2];
}

+ (id)orderingTermWithProperty:(id)a3 entityClass:(Class)a4 ascending:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = [(objc_class *)a4 disambiguatedSQLForProperty:a3];
  v8 = (void *)[objc_alloc((Class)a1) initWithExpression:v7 ascending:v5];

  return v8;
}

- (HDSQLiteOrderingTerm)initWithExpression:(id)a3 ascending:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSQLiteOrderingTerm;
  v7 = [(HDSQLiteOrderingTerm *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    expression = v7->_expression;
    v7->_expression = (NSString *)v8;

    v7->_ascending = a4;
  }

  return v7;
}

- (HDSQLiteOrderingTerm)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  BOOL v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  if (self->_ascending) {
    v2 = @"ascending";
  }
  else {
    v2 = @"descending";
  }
  return (id)[NSString stringWithFormat:@"<Order: \"%@\" %@>", self->_expression, v2];
}

- (unint64_t)hash
{
  return [(NSString *)self->_expression hash] ^ self->_ascending;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDSQLiteOrderingTerm *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      expression = self->_expression;
      v7 = v5->_expression;
      BOOL v8 = (expression == v7 || v7 && -[NSString isEqualToString:](expression, "isEqualToString:"))
        && self->_ascending == v5->_ascending;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)expression
{
  return self->_expression;
}

- (BOOL)ascending
{
  return self->_ascending;
}

@end