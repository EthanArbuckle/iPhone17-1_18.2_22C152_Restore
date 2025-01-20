@interface EFSQLAndExpression
+ (id)combined:(id)a3;
- (EFSQLAndExpression)initWithExpressions:(id)a3;
- (NSArray)expressions;
- (NSString)ef_SQLExpression;
- (id)ef_SQLIsolatedExpression;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLAndExpression

- (id)ef_SQLIsolatedExpression
{
  return +[EFParenthesizedSQLExpression parenthesizedValueExpressable:self];
}

- (void).cxx_destruct
{
}

+ (id)combined:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = [[EFSQLAndExpression alloc] initWithExpressions:v3];
  }
  v5 = v4;

  return v5;
}

- (EFSQLAndExpression)initWithExpressions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFSQLAndExpression;
  v6 = [(EFSQLAndExpression *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expressions, a3);
  }

  return v7;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
}

- (NSString)ef_SQLExpression
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLAndExpression *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (NSArray)expressions
{
  return self->_expressions;
}

@end