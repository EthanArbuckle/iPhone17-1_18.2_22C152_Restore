@interface PKTransactionAuthenticationComplexPasscodeTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)textInsets;
- (void)setTextInsets:(UIEdgeInsets)a3;
@end

@implementation PKTransactionAuthenticationComplexPasscodeTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double v5 = a3.origin.x + left;
  double v6 = a3.origin.y + top;
  double v7 = a3.size.width - (left + self->_textInsets.right);
  double v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double v5 = a3.origin.x + left;
  double v6 = a3.origin.y + top;
  double v7 = a3.size.width - (left + self->_textInsets.right);
  double v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double v5 = a3.origin.x + left;
  double v6 = a3.origin.y + top;
  double v7 = a3.size.width - (left + self->_textInsets.right);
  double v8 = a3.size.height - (top + self->_textInsets.bottom);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PKTransactionAuthenticationComplexPasscodeTextField;
  -[PKTransactionAuthenticationComplexPasscodeTextField sizeThatFits:](&v7, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (UIEdgeInsets)textInsets
{
  double top = self->_textInsets.top;
  double left = self->_textInsets.left;
  double bottom = self->_textInsets.bottom;
  double right = self->_textInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextInsets:(UIEdgeInsets)a3
{
  self->_textInsets = a3;
}

@end