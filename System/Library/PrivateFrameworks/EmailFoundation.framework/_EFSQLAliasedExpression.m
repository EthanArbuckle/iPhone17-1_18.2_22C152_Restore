@interface _EFSQLAliasedExpression
- (EFSQLValueExpressable)expression;
- (NSString)alias;
- (NSString)ef_SQLExpression;
- (_EFSQLAliasedExpression)initWithExpression:(id)a3 alias:(id)a4;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation _EFSQLAliasedExpression

- (_EFSQLAliasedExpression)initWithExpression:(id)a3 alias:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EFSQLAliasedExpression;
  v9 = [(_EFSQLAliasedExpression *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expression, a3);
    uint64_t v11 = [v8 copy];
    alias = v10->_alias;
    v10->_alias = (NSString *)v11;
  }
  return v10;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v5 = a3;
  v4 = [(EFSQLValueExpressable *)self->_expression ef_SQLIsolatedExpression];
  objc_msgSend(v4, "ef_renderSQLExpressionInto:", v5);

  [v5 appendFormat:@" AS %@", self->_alias];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_expression, 0);
}

- (NSString)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(_EFSQLAliasedExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (EFSQLValueExpressable)expression
{
  return self->_expression;
}

- (NSString)alias
{
  return self->_alias;
}

@end