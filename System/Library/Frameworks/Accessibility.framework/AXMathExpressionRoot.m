@interface AXMathExpressionRoot
- (AXMathExpression)rootIndexExpression;
- (AXMathExpressionRoot)initWithRadicandExpressions:(id)a3 rootIndexExpression:(id)a4;
- (NSArray)radicandExpressions;
- (void)setRadicandExpressions:(id)a3;
- (void)setRootIndexExpression:(id)a3;
@end

@implementation AXMathExpressionRoot

- (AXMathExpressionRoot)initWithRadicandExpressions:(id)a3 rootIndexExpression:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXMathExpressionRoot;
  id v5 = a4;
  id v6 = a3;
  v7 = [(AXMathExpressionRoot *)&v9 init];
  -[AXMathExpressionRoot setRadicandExpressions:](v7, "setRadicandExpressions:", v6, v9.receiver, v9.super_class);

  [(AXMathExpressionRoot *)v7 setRootIndexExpression:v5];
  return v7;
}

- (NSArray)radicandExpressions
{
  return self->_radicandExpressions;
}

- (void)setRadicandExpressions:(id)a3
{
}

- (AXMathExpression)rootIndexExpression
{
  return self->_rootIndexExpression;
}

- (void)setRootIndexExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIndexExpression, 0);

  objc_storeStrong((id *)&self->_radicandExpressions, 0);
}

@end