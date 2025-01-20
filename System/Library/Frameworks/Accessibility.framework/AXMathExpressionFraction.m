@interface AXMathExpressionFraction
- (AXMathExpression)denimonatorExpression;
- (AXMathExpression)numeratorExpression;
- (AXMathExpressionFraction)initWithNumeratorExpression:(id)a3 denimonatorExpression:(id)a4;
- (void)setDenimonatorExpression:(id)a3;
- (void)setNumeratorExpression:(id)a3;
@end

@implementation AXMathExpressionFraction

- (AXMathExpressionFraction)initWithNumeratorExpression:(id)a3 denimonatorExpression:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AXMathExpressionFraction;
  id v5 = a4;
  id v6 = a3;
  v7 = [(AXMathExpressionFraction *)&v9 init];
  -[AXMathExpressionFraction setNumeratorExpression:](v7, "setNumeratorExpression:", v6, v9.receiver, v9.super_class);

  [(AXMathExpressionFraction *)v7 setDenimonatorExpression:v5];
  return v7;
}

- (AXMathExpression)numeratorExpression
{
  return self->_numeratorExpression;
}

- (void)setNumeratorExpression:(id)a3
{
}

- (AXMathExpression)denimonatorExpression
{
  return self->_denimonatorExpression;
}

- (void)setDenimonatorExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denimonatorExpression, 0);

  objc_storeStrong((id *)&self->_numeratorExpression, 0);
}

@end