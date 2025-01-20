@interface _AKInsetTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)insetSize;
- (_AKInsetTextField)initWithFrame:(CGRect)a3;
- (void)setInsetSize:(CGSize)a3;
@end

@implementation _AKInsetTextField

- (_AKInsetTextField)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  result = -[_AKInsetTextField initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_insetSize = (CGSize)xmmword_1C392E410;
  }
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField textRectForBounds:](&v4, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField editingRectForBounds:](&v4, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectInset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField leftViewRectForBounds:](&v4, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectOffset(v5, self->_insetSize.width, self->_insetSize.height);
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_AKInsetTextField;
  -[_AKInsetTextField rightViewRectForBounds:](&v4, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return CGRectOffset(v5, -self->_insetSize.width, self->_insetSize.height);
}

- (CGSize)insetSize
{
  double width = self->_insetSize.width;
  double height = self->_insetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInsetSize:(CGSize)a3
{
  self->_insetSize = a3;
}

@end