@interface _HKStretchableImage
- (UIImage)bottomImage;
- (UIImage)centerImage;
- (UIImage)singlePointImage;
- (UIImage)topImage;
- (double)_desiredWidth;
- (void)_renderSingleImageInContext:(CGContext *)a3 point:(CGPoint)a4 contextBounds:(CGRect)a5 alpha:(double)a6;
- (void)_renderStretchedInContext:(CGContext *)a3 frame:(CGRect)a4 contextBounds:(CGRect)a5 alpha:(double)a6;
- (void)renderInContext:(CGContext *)a3 topCenter:(CGPoint)a4 bottomCenter:(CGPoint)a5 contextBounds:(CGRect)a6 alpha:(double)a7;
- (void)setBottomImage:(id)a3;
- (void)setCenterImage:(id)a3;
- (void)setSinglePointImage:(id)a3;
- (void)setTopImage:(id)a3;
@end

@implementation _HKStretchableImage

- (void)_renderStretchedInContext:(CGContext *)a3 frame:(CGRect)a4 contextBounds:(CGRect)a5 alpha:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (CGRectIntersectsRect(a4, a5))
  {
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v27);
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    CGFloat v13 = CGRectGetWidth(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v14 = CGRectGetHeight(v29);
    [(UIImage *)self->_topImage size];
    double v16 = v14 - v15;
    [(UIImage *)self->_bottomImage size];
    if (v16 - v17 >= 0.0) {
      double v18 = v16 - v17;
    }
    else {
      double v18 = 0.0;
    }
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v30);
    [(UIImage *)self->_topImage size];
    v31.size.CGFloat height = v19;
    CGFloat v23 = v19;
    v31.origin.CGFloat x = MinX;
    v31.origin.CGFloat y = MinY;
    v31.size.CGFloat width = v13;
    CGFloat MaxY = CGRectGetMaxY(v31);
    v32.origin.CGFloat x = MinX;
    v32.origin.CGFloat y = MaxY;
    v32.size.CGFloat width = v13;
    v32.size.CGFloat height = v18;
    CGFloat v25 = CGRectGetMaxY(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v21 = CGRectGetMaxY(v33);
    v34.origin.CGFloat x = MinX;
    v34.origin.CGFloat y = MaxY;
    v34.size.CGFloat width = v13;
    v34.size.CGFloat height = v18;
    CGFloat v22 = v21 - CGRectGetMaxY(v34);
    CGContextSaveGState(a3);
    _RenderImageInRect(a3, self->_topImage, MinX, MinY, v13, v23, a6);
    _RenderImageInRect(a3, self->_centerImage, MinX, MaxY, v13, v18, a6);
    _RenderImageInRect(a3, self->_bottomImage, MinX, v25, v13, v22, a6);
    CGContextRestoreGState(a3);
  }
}

- (void)_renderSingleImageInContext:(CGContext *)a3 point:(CGPoint)a4 contextBounds:(CGRect)a5 alpha:(double)a6
{
  singlePointImage = self->_singlePointImage;
  if (singlePointImage)
  {
    CGFloat y = a5.origin.y;
    CGFloat x = a5.origin.x;
    double v10 = a4.y;
    double v11 = a4.x;
    CGFloat height = a5.size.height;
    CGFloat width = a5.size.width;
    [(UIImage *)singlePointImage size];
    double v15 = v14;
    double v17 = v16;
    double v18 = v11 - v14 * 0.5;
    double v19 = v10 - v16 * 0.5;
    v23.origin.CGFloat x = v18;
    v23.origin.CGFloat y = v19;
    v23.size.CGFloat width = v15;
    v23.size.CGFloat height = v17;
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    if (CGRectIntersectsRect(v23, v24))
    {
      v20 = self->_singlePointImage;
      -[UIImage drawInRect:blendMode:alpha:](v20, "drawInRect:blendMode:alpha:", 0, v18, v19, v15, v17, a6);
    }
  }
}

- (void)renderInContext:(CGContext *)a3 topCenter:(CGPoint)a4 bottomCenter:(CGPoint)a5 contextBounds:(CGRect)a6 alpha:(double)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a5.y;
  double v12 = a4.y;
  double v13 = a4.x;
  if (HKUIEqualDoubles(a4.y, a5.y))
  {
    -[_HKStretchableImage _renderSingleImageInContext:point:contextBounds:alpha:](self, "_renderSingleImageInContext:point:contextBounds:alpha:", a3, v13, v12, x, y, width, height, a7);
  }
  else
  {
    [(_HKStretchableImage *)self _desiredWidth];
    double v22 = height;
    double v17 = v16;
    [(UIImage *)self->_topImage size];
    double v21 = width;
    double v19 = v18;
    [(UIImage *)self->_bottomImage size];
    -[_HKStretchableImage _renderStretchedInContext:frame:contextBounds:alpha:](self, "_renderStretchedInContext:frame:contextBounds:alpha:", a3, v13 + v17 * -0.5, v12 - v19, v17, v11 - v12 + v19 + v20, x, y, v21, v22);
  }
}

- (double)_desiredWidth
{
  [(UIImage *)self->_topImage size];
  double v4 = v3;
  [(UIImage *)self->_bottomImage size];
  if (v4 >= result) {
    return v4;
  }
  return result;
}

- (UIImage)topImage
{
  return self->_topImage;
}

- (void)setTopImage:(id)a3
{
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (void)setCenterImage:(id)a3
{
}

- (UIImage)bottomImage
{
  return self->_bottomImage;
}

- (void)setBottomImage:(id)a3
{
}

- (UIImage)singlePointImage
{
  return self->_singlePointImage;
}

- (void)setSinglePointImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singlePointImage, 0);
  objc_storeStrong((id *)&self->_bottomImage, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_topImage, 0);
}

@end