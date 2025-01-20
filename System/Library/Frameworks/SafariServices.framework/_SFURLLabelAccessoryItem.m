@interface _SFURLLabelAccessoryItem
- (BOOL)centerAligned;
- (CGRect)frame;
- (CGSize)size;
- (UIImageView)squishedView;
- (UIImageView)view;
- (UIView)viewForLayout;
- (UIVisualEffectView)effectView;
- (UIVisualEffectView)squishedEffectView;
- (double)spacing;
- (void)setCenterAligned:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSize:(CGSize)a3;
- (void)setSpacing:(double)a3;
- (void)setSquishedEffectView:(id)a3;
- (void)setSquishedView:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _SFURLLabelAccessoryItem

- (UIView)viewForLayout
{
  effectView = self->_effectView;
  if (!effectView) {
    effectView = self->_view;
  }
  id v3 = effectView;

  return (UIView *)v3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = [(_SFURLLabelAccessoryItem *)self viewForLayout];
  -[UIImageView setFrame:](v9, "setFrame:", x, y, width, height);
  v8 = v9;
  if (self->_view != v9)
  {
    [(UIImageView *)v9 bounds];
    -[UIImageView setFrame:](self->_view, "setFrame:");
    v8 = v9;
  }
}

- (CGRect)frame
{
  v2 = [(_SFURLLabelAccessoryItem *)self viewForLayout];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIImageView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (UIImageView)squishedView
{
  return self->_squishedView;
}

- (void)setSquishedView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIVisualEffectView)squishedEffectView
{
  return self->_squishedEffectView;
}

- (void)setSquishedEffectView:(id)a3
{
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
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

- (BOOL)centerAligned
{
  return self->_centerAligned;
}

- (void)setCenterAligned:(BOOL)a3
{
  self->_centerAligned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_squishedEffectView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_squishedView, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end