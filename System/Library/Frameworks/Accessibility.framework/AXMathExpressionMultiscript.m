@interface AXMathExpressionMultiscript
- (AXMathExpression)baseExpression;
- (AXMathExpressionMultiscript)initWithBaseExpression:(id)a3 prescriptExpressions:(id)a4 postscriptExpressions:(id)a5;
- (NSArray)postscriptExpressions;
- (NSArray)prescriptExpressions;
- (void)setBaseExpression:(id)a3;
- (void)setPostscriptExpressions:(id)a3;
- (void)setPrescriptExpressions:(id)a3;
@end

@implementation AXMathExpressionMultiscript

- (AXMathExpressionMultiscript)initWithBaseExpression:(id)a3 prescriptExpressions:(id)a4 postscriptExpressions:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXMathExpressionMultiscript;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(AXMathExpressionMultiscript *)&v12 init];
  -[AXMathExpressionMultiscript setBaseExpression:](v10, "setBaseExpression:", v9, v12.receiver, v12.super_class);

  [(AXMathExpressionMultiscript *)v10 setPrescriptExpressions:v8];
  [(AXMathExpressionMultiscript *)v10 setPostscriptExpressions:v7];

  return v10;
}

- (AXMathExpression)baseExpression
{
  return self->_baseExpression;
}

- (void)setBaseExpression:(id)a3
{
}

- (NSArray)prescriptExpressions
{
  return self->_prescriptExpressions;
}

- (void)setPrescriptExpressions:(id)a3
{
}

- (NSArray)postscriptExpressions
{
  return self->_postscriptExpressions;
}

- (void)setPostscriptExpressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postscriptExpressions, 0);
  objc_storeStrong((id *)&self->_prescriptExpressions, 0);

  objc_storeStrong((id *)&self->_baseExpression, 0);
}

@end