@interface EFSQLOrderExpression
- (BOOL)isAscending;
- (EFSQLExpressable)expression;
- (EFSQLOrderExpression)initWithExpression:(id)a3 ascending:(BOOL)a4;
- (NSString)ef_SQLExpression;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLOrderExpression

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v5 = a3;
  -[EFSQLExpressable ef_renderSQLExpressionInto:](self->_expression, "ef_renderSQLExpressionInto:");
  if (self->_isAscending) {
    v4 = @" ASC";
  }
  else {
    v4 = @" DESC";
  }
  [v5 appendString:v4];
}

- (void).cxx_destruct
{
}

- (EFSQLOrderExpression)initWithExpression:(id)a3 ascending:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLOrderExpression;
  v8 = [(EFSQLOrderExpression *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_expression, a3);
    v9->_isAscending = a4;
  }

  return v9;
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLOrderExpression *)self ef_renderSQLExpressionInto:v3];

  return (NSString *)v3;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

@end