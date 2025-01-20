@interface AXMathExpressionNumber
- (AXMathExpressionNumber)initWithContent:(id)a3;
- (NSString)content;
- (void)setContent:(id)a3;
@end

@implementation AXMathExpressionNumber

- (AXMathExpressionNumber)initWithContent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMathExpressionNumber;
  id v3 = a3;
  v4 = [(AXMathExpressionNumber *)&v6 init];
  -[AXMathExpressionNumber setContent:](v4, "setContent:", v3, v6.receiver, v6.super_class);

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