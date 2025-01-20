@interface EFSQLNotExpression
- (EFSQLNotExpression)initWithExpression:(id)a3;
- (EFSQLValueExpressable)expression;
- (NSString)ef_SQLExpression;
- (id)ef_SQLIsolatedExpression;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLNotExpression

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueExpressable:self];
}

- (EFSQLNotExpression)initWithExpression:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLNotExpression;
  v6 = [(EFSQLNotExpression *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expression, a3);
  }

  return v7;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendString:", @"NOT (");
  [(EFSQLValueExpressable *)self->_expression ef_renderSQLExpressionInto:v4];
  [v4 appendString:@""]);
}

- (void).cxx_destruct
{
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLNotExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (EFSQLValueExpressable)expression
{
  return self->_expression;
}

@end