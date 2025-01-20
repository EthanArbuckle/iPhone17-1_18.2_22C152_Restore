@interface FHDatabaseClause
- (FHDatabaseClause)initWithQuoteWrapOption:(id)a3 fieldName:(id)a4 expression:(id)a5 quoteWrapExpression:(BOOL)a6;
- (NSString)comparisonOperator;
- (NSString)expression;
- (NSString)fieldName;
- (id)description;
- (id)shortDescription;
- (void)setComparisonOperator:(id)a3;
- (void)setExpression:(id)a3;
- (void)setFieldName:(id)a3;
@end

@implementation FHDatabaseClause

- (FHDatabaseClause)initWithQuoteWrapOption:(id)a3 fieldName:(id)a4 expression:(id)a5 quoteWrapExpression:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)FHDatabaseClause;
  v13 = [(FHDatabaseClause *)&v25 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    comparisonOperator = v13->_comparisonOperator;
    v13->_comparisonOperator = (NSString *)v14;

    v16 = (void *)[v11 copy];
    uint64_t v17 = [v16 lowercaseString];
    fieldName = v13->_fieldName;
    v13->_fieldName = (NSString *)v17;

    if (a6)
    {
      v19 = NSString;
      v20 = (NSString *)[v12 copy];
      uint64_t v21 = [v19 stringWithFormat:@"'%@'", v20];
      expression = v13->_expression;
      v13->_expression = (NSString *)v21;
    }
    else
    {
      uint64_t v23 = [v12 copy];
      v20 = v13->_expression;
      v13->_expression = (NSString *)v23;
    }
  }
  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"fieldName: '%@'; ", self->_fieldName];
  [v3 appendFormat:@"comparisonOperator: '%@'; ", self->_comparisonOperator];
  [v3 appendFormat:@"expression: '%@'; ", self->_expression];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)shortDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"%@ %@ %@", self->_fieldName, self->_comparisonOperator, self->_expression];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)comparisonOperator
{
  return self->_comparisonOperator;
}

- (void)setComparisonOperator:(id)a3
{
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_comparisonOperator, 0);
}

@end