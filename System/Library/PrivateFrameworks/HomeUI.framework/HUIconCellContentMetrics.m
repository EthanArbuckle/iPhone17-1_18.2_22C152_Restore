@interface HUIconCellContentMetrics
+ (id)compactMetrics;
+ (id)defaultMetrics;
- (CGSize)iconSize;
- (UIEdgeInsets)contentInset;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setIconSize:(CGSize)a3;
@end

@implementation HUIconCellContentMetrics

+ (id)defaultMetrics
{
  id v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIconSize:", 44.0, 44.0);
  objc_msgSend(v2, "setContentInset:", 8.0, 0.0, 8.0, 0.0);

  return v2;
}

+ (id)compactMetrics
{
  id v2 = objc_alloc_init((Class)a1);
  HUDefaultSizeForIconSize();
  objc_msgSend(v2, "setIconSize:");
  objc_msgSend(v2, "setContentInset:", 4.0, 0.0, 4.0, 0.0);

  return v2;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end