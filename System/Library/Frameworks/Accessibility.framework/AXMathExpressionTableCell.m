@interface AXMathExpressionTableCell
- (AXMathExpressionTableCell)initWithExpressions:(id)a3;
- (NSArray)expressions;
- (void)setExpressions:(id)a3;
@end

@implementation AXMathExpressionTableCell

- (AXMathExpressionTableCell)initWithExpressions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMathExpressionTableCell;
  id v3 = a3;
  v4 = [(AXMathExpressionTableCell *)&v6 init];
  -[AXMathExpressionTableCell setExpressions:](v4, "setExpressions:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (NSArray)expressions
{
  return self->_expressions;
}

- (void)setExpressions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end