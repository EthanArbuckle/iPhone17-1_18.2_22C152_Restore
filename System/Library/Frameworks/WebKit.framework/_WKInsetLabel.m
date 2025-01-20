@interface _WKInsetLabel
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)edgeInsets;
- (void)drawTextInRect:(CGRect)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation _WKInsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_WKInsetLabel *)self edgeInsets];
  v12.receiver = self;
  v12.super_class = (Class)_WKInsetLabel;
  -[_WKInsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)_WKInsetLabel;
  [(_WKInsetLabel *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(_WKInsetLabel *)self edgeInsets];
  double v8 = v7;
  [(_WKInsetLabel *)self edgeInsets];
  double v10 = v4 + v8 + v9;
  [(_WKInsetLabel *)self edgeInsets];
  double v12 = v11;
  [(_WKInsetLabel *)self edgeInsets];
  double v14 = v6 + v12 + v13;
  double v15 = v10;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

@end