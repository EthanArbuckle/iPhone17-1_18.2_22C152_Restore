@interface HUQuickControlCollectionViewLayoutInfo
- (CGRect)availableContentFrame;
- (CGSize)collectionViewContentSize;
- (NSMutableArray)layoutDetailsArray;
- (void)setAvailableContentFrame:(CGRect)a3;
- (void)setCollectionViewContentSize:(CGSize)a3;
- (void)setLayoutDetailsArray:(id)a3;
@end

@implementation HUQuickControlCollectionViewLayoutInfo

- (CGRect)availableContentFrame
{
  double x = self->_availableContentFrame.origin.x;
  double y = self->_availableContentFrame.origin.y;
  double width = self->_availableContentFrame.size.width;
  double height = self->_availableContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvailableContentFrame:(CGRect)a3
{
  self->_availableContentFrame = a3;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_collectionViewContentSize.width;
  double height = self->_collectionViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCollectionViewContentSize:(CGSize)a3
{
  self->_collectionViewContentSize = a3;
}

- (NSMutableArray)layoutDetailsArray
{
  return self->_layoutDetailsArray;
}

- (void)setLayoutDetailsArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end