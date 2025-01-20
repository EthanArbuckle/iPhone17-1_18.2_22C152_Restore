@interface SiriGKBasePod
- (CGSize)footerSize;
- (CGSize)headerSize;
- (UIEdgeInsets)edgeInsets;
- (UIEdgeInsets)footerInsets;
- (UIEdgeInsets)headerInsets;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (id)footerView;
- (id)headerView;
- (id)viewAtIndex:(int64_t)a3;
- (id)views;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKBasePod

- (id)views
{
  return +[NSArray array];
}

- (int64_t)viewCount
{
  return 0;
}

- (id)viewAtIndex:(int64_t)a3
{
  return 0;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (double)minimumInteritemSpacing
{
  return 0.0;
}

- (UIEdgeInsets)edgeInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)keylineType
{
  return 2;
}

- (CGSize)headerSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)footerSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)headerView
{
  return 0;
}

- (id)footerView
{
  return 0;
}

- (UIEdgeInsets)headerInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)footerInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

@end