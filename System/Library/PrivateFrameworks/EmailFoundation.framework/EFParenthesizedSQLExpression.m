@interface EFParenthesizedSQLExpression
+ (id)parenthesizedValueCollectionExpressable:(id)a3;
+ (id)parenthesizedValueExpressable:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (EFParenthesizedSQLExpression)initWithExpressable:(id)a3;
- (id)ef_SQLExpression;
- (void)ef_renderSQLExpressionInto:(id)a3;
- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4;
@end

@implementation EFParenthesizedSQLExpression

- (void).cxx_destruct
{
}

+ (id)parenthesizedValueCollectionExpressable:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithExpressable:v4];

  return v5;
}

+ (id)parenthesizedValueExpressable:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithExpressable:v4];

  return v5;
}

- (EFParenthesizedSQLExpression)initWithExpressable:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFParenthesizedSQLExpression;
  v6 = [(EFParenthesizedSQLExpression *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_expressable, a3);
  }

  return v7;
}

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendString:", @"(");
  objc_msgSend(self->_expressable, "ef_renderSQLExpressionInto:", v4);
  [v4 appendString:@""]);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)ef_SQLExpression
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [(EFParenthesizedSQLExpression *)self ef_renderSQLExpressionInto:v3];

  return v3;
}

- (void)ef_renderSQLExpressionInto:(id)a3 conjoiner:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_msgSend(v7, "appendString:", @"(");
  objc_msgSend(self->_expressable, "ef_renderSQLExpressionInto:conjoiner:", v7, v6);
  [v7 appendString:@""]);
}

@end