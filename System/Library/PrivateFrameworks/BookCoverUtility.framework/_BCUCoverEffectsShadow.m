@interface _BCUCoverEffectsShadow
- (CGImage)image;
- (CGRect)contentsCenter;
- (CGSize)size;
- (NSString)blendMode;
- (UIEdgeInsets)insets;
- (UIEdgeInsets)roundedInsetsWithSize:(CGSize)a3;
- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4;
- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4 blendMode:(id)a5;
@end

@implementation _BCUCoverEffectsShadow

- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4 blendMode:(id)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v12 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BCUCoverEffectsShadow;
  v13 = [(_BCUCoverEffectsShadow *)&v15 init];
  if (v13)
  {
    v13->_image = CGImageRetain(a3);
    v13->_insets.CGFloat top = top;
    v13->_insets.CGFloat left = left;
    v13->_insets.CGFloat bottom = bottom;
    v13->_insets.CGFloat right = right;
    objc_storeStrong((id *)&v13->_blendMode, a5);
  }

  return v13;
}

- (_BCUCoverEffectsShadow)initWithImage:(CGImage *)a3 insets:(UIEdgeInsets)a4
{
  return (_BCUCoverEffectsShadow *)objc_msgSend_initWithImage_insets_blendMode_(self, a2, (uint64_t)a3, 0, a4.top, a4.left, a4.bottom, a4.right);
}

- (CGSize)size
{
  double Width = (double)CGImageGetWidth(self->_image);
  double Height = (double)CGImageGetHeight(self->_image);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGRect)contentsCenter
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  objc_msgSend_size(self, a2, v2);
  double v8 = 1.0 - (left + right) / v7;
  double v10 = 1.0 - (top + bottom) / v9;
  double v11 = top / v9;
  double v12 = left / v7;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)roundedInsetsWithSize:(CGSize)a3
{
  double width = a3.width;
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  objc_msgSend_size(self, a2, v3, a3.width, a3.height);
  double v10 = 1.0;
  if (width > 0.0) {
    double v10 = (v9 - left - right) / width;
  }
  double v11 = floor(top / v10);
  double v12 = floor(left / v10);
  double v13 = floor(bottom / v10);
  double v14 = floor(right / v10);
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGImage)image
{
  return self->_image;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void).cxx_destruct
{
}

@end