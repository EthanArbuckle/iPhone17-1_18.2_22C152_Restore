@interface AXMathExpressionRow
- (AXMathExpressionRow)initWithExpressions:(id)a3;
- (NSArray)Expressions;
- (NSArray)expressions;
- (void)setExpressions:(id)a3;
@end

@implementation AXMathExpressionRow

- (AXMathExpressionRow)initWithExpressions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMathExpressionRow;
  id v3 = a3;
  v4 = [(AXMathExpressionRow *)&v6 init];
  -[AXMathExpressionRow setExpressions:](v4, "setExpressions:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (NSArray)expressions
{
  return self->_expressions;
}

- (NSArray)Expressions
{
  return self->_Expressions;
}

- (void)setExpressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Expressions, 0);

  objc_storeStrong((id *)&self->_expressions, 0);
}

@end