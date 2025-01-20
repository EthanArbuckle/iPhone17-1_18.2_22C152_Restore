@interface HUQuickControlCollectionViewGridLayoutRowInfo
- (CGPoint)rowOrigin;
- (CGSize)contentSize;
- (NSArray)itemLayouts;
- (unint64_t)numberOfItems;
- (void)setContentSize:(CGSize)a3;
- (void)setItemLayouts:(id)a3;
- (void)setNumberOfItems:(unint64_t)a3;
- (void)setRowOrigin:(CGPoint)a3;
@end

@implementation HUQuickControlCollectionViewGridLayoutRowInfo

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setNumberOfItems:(unint64_t)a3
{
  self->_numberOfItems = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGPoint)rowOrigin
{
  double x = self->_rowOrigin.x;
  double y = self->_rowOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRowOrigin:(CGPoint)a3
{
  self->_rowOrigin = a3;
}

- (NSArray)itemLayouts
{
  return self->_itemLayouts;
}

- (void)setItemLayouts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end