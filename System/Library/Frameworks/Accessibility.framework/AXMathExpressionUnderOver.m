@interface AXMathExpressionUnderOver
- (AXMathExpression)baseExpression;
- (AXMathExpression)overExpression;
- (AXMathExpression)underExpression;
- (AXMathExpressionUnderOver)initWithBaseExpression:(id)a3 underExpression:(id)a4 overExpression:(id)a5;
- (void)setBaseExpression:(id)a3;
- (void)setOverExpression:(id)a3;
- (void)setUnderExpression:(id)a3;
@end

@implementation AXMathExpressionUnderOver

- (AXMathExpressionUnderOver)initWithBaseExpression:(id)a3 underExpression:(id)a4 overExpression:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AXMathExpressionUnderOver;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(AXMathExpressionUnderOver *)&v12 init];
  -[AXMathExpressionUnderOver setBaseExpression:](v10, "setBaseExpression:", v9, v12.receiver, v12.super_class);

  [(AXMathExpressionUnderOver *)v10 setUnderExpression:v8];
  [(AXMathExpressionUnderOver *)v10 setOverExpression:v7];

  return v10;
}

- (AXMathExpression)baseExpression
{
  return self->_baseExpression;
}

- (void)setBaseExpression:(id)a3
{
}

- (AXMathExpression)underExpression
{
  return self->_underExpression;
}

- (void)setUnderExpression:(id)a3
{
}

- (AXMathExpression)overExpression
{
  return self->_overExpression;
}

- (void)setOverExpression:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overExpression, 0);
  objc_storeStrong((id *)&self->_underExpression, 0);

  objc_storeStrong((id *)&self->_baseExpression, 0);
}

@end