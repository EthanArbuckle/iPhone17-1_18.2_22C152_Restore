@interface AXMathExpressionSubSuperscript
- (AXMathExpression)baseExpression;
- (AXMathExpressionSubSuperscript)initWithBaseExpression:(id)a3 subscriptExpressions:(id)a4 superscriptExpressions:(id)a5;
- (NSArray)subscriptExpressions;
- (NSArray)superscriptExpressions;
- (void)setBaseExpression:(id)a3;
- (void)setSubscriptExpressions:(id)a3;
- (void)setSuperscriptExpressions:(id)a3;
@end

@implementation AXMathExpressionSubSuperscript

- (AXMathExpressionSubSuperscript)initWithBaseExpression:(id)a3 subscriptExpressions:(id)a4 superscriptExpressions:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXMathExpressionSubSuperscript;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(AXMathExpressionSubSuperscript *)&v12 init];
  -[AXMathExpressionSubSuperscript setBaseExpression:](v10, "setBaseExpression:", v9, v12.receiver, v12.super_class);

  [(AXMathExpressionSubSuperscript *)v10 setSubscriptExpressions:v8];
  [(AXMathExpressionSubSuperscript *)v10 setSuperscriptExpressions:v7];

  return v10;
}

- (AXMathExpression)baseExpression
{
  return self->_baseExpression;
}

- (void)setBaseExpression:(id)a3
{
}

- (NSArray)subscriptExpressions
{
  return self->_subscriptExpressions;
}

- (void)setSubscriptExpressions:(id)a3
{
}

- (NSArray)superscriptExpressions
{
  return self->_superscriptExpressions;
}

- (void)setSuperscriptExpressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superscriptExpressions, 0);
  objc_storeStrong((id *)&self->_subscriptExpressions, 0);

  objc_storeStrong((id *)&self->_baseExpression, 0);
}

@end