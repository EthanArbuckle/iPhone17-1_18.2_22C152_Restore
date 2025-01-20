@interface MRUActivityAccessoryView
- (CGPoint)contentOffset;
- (CGSize)size;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (MRUActivityAccessoryView)initWithContentView:(id)a3 size:(CGSize)a4;
- (UIEdgeInsets)contentInsets;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation MRUActivityAccessoryView

- (MRUActivityAccessoryView)initWithContentView:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRUActivityAccessoryView;
  v9 = [(MRUActivityAccessoryView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentView, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    [(MRUActivityAccessoryView *)v10 addSubview:v8];
  }

  return v10;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)MRUActivityAccessoryView;
  [(MRUActivityAccessoryView *)&v9 layoutSubviews];
  [(MRUActivityAccessoryView *)self bounds];
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  v10.origin.x = v5 + left;
  v10.origin.y = v6 + top;
  v10.size.CGFloat width = v7 - (left + self->_contentInsets.right);
  v10.size.CGFloat height = v8 - (top + self->_contentInsets.bottom);
  CGRect v11 = CGRectOffset(v10, self->_contentOffset.x, self->_contentOffset.y);
  -[UIView setFrame:](self->_contentView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
  [(MRUActivityAccessoryView *)self setNeedsLayout];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
  [(MRUActivityAccessoryView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end