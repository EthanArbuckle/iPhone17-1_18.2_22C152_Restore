@interface NSCollectionLayoutGroupCustomItem
+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame;
+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame zIndex:(NSInteger)zIndex;
- (CGRect)frame;
- (NSCollectionLayoutGroupCustomItem)initWithFrame:(CGRect)a3 zIndex:(int64_t)a4;
- (NSInteger)zIndex;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NSCollectionLayoutGroupCustomItem

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame
{
  return (NSCollectionLayoutGroupCustomItem *)objc_msgSend(a1, "customItemWithFrame:zIndex:", 0, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

+ (NSCollectionLayoutGroupCustomItem)customItemWithFrame:(CGRect)frame zIndex:(NSInteger)zIndex
{
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:zIndex:", zIndex, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  return (NSCollectionLayoutGroupCustomItem *)v4;
}

- (NSCollectionLayoutGroupCustomItem)initWithFrame:(CGRect)a3 zIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)NSCollectionLayoutGroupCustomItem;
  CGRect result = [(NSCollectionLayoutGroupCustomItem *)&v10 init];
  if (result)
  {
    result->_frame.origin.CGFloat x = x;
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
    result->_zIndeCGFloat x = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(NSCollectionLayoutGroupCustomItem *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  NSInteger v13 = [(NSCollectionLayoutGroupCustomItem *)self zIndex];
  return (id)objc_msgSend(v4, "initWithFrame:zIndex:", v13, v6, v8, v10, v12);
}

@end