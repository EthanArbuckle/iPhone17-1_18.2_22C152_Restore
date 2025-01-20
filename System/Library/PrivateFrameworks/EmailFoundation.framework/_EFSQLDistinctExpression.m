@interface _EFSQLDistinctExpression
- (EFSQLExpressable)expression;
- (NSString)ef_SQLExpression;
- (_EFSQLDistinctExpression)initWithExpression:(id)a3;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation _EFSQLDistinctExpression

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  [v4 appendString:@"DISTINCT "];
  [(EFSQLExpressable *)self->_expression ef_renderSQLExpressionInto:v4];
}

- (void).cxx_destruct
{
}

- (_EFSQLDistinctExpression)initWithExpression:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EFSQLDistinctExpression;
  v6 = [(_EFSQLDistinctExpression *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expression, a3);
  }

  return v7;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(_EFSQLDistinctExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

@end