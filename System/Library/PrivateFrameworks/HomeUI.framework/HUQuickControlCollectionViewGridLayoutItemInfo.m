@interface HUQuickControlCollectionViewGridLayoutItemInfo
- (CGSize)preferredSize;
- (CGSize)size;
- (unint64_t)titlePosition;
- (void)setPreferredSize:(CGSize)a3;
- (void)setSize:(CGSize)a3;
- (void)setTitlePosition:(unint64_t)a3;
@end

@implementation HUQuickControlCollectionViewGridLayoutItemInfo

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
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

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (void)setTitlePosition:(unint64_t)a3
{
  self->_titlePosition = a3;
}

@end