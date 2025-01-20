@interface AXMathExpressionOperator
- (AXMathExpressionOperator)initWithContent:(id)a3;
- (NSString)content;
- (void)setContent:(id)a3;
@end

@implementation AXMathExpressionOperator

- (AXMathExpressionOperator)initWithContent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMathExpressionOperator;
  id v3 = a3;
  v4 = [(AXMathExpressionOperator *)&v6 init];
  -[AXMathExpressionOperator setContent:](v4, "setContent:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end