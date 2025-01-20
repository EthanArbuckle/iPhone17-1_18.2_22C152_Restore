@interface GKInsetTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)textInsets;
- (void)setTextInsets:(CGSize)a3;
@end

@implementation GKInsetTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(GKInsetTextField *)self textInsets];
  CGFloat v9 = v8;
  [(GKInsetTextField *)self textInsets];
  CGFloat v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;

  return CGRectInset(*(CGRect *)&v12, v9, v11);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(GKInsetTextField *)self textInsets];
  CGFloat v9 = v8;
  [(GKInsetTextField *)self textInsets];
  CGFloat v11 = v10;
  CGFloat v12 = x;
  CGFloat v13 = y;
  CGFloat v14 = width;
  CGFloat v15 = height;

  return CGRectInset(*(CGRect *)&v12, v9, v11);
}

- (CGSize)textInsets
{
  double width = self->_textInsets.width;
  double height = self->_textInsets.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTextInsets:(CGSize)a3
{
  self->_textInsets = a3;
}

@end