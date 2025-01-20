@interface PKSearchQueryItem
- (CGRect)bounds;
- (NSArray)strokes;
- (PKSearchQueryItem)initWithBounds:(CGRect)a3;
- (PKSearchQueryItem)initWithBounds:(CGRect)a3 strokes:(id)a4;
@end

@implementation PKSearchQueryItem

- (PKSearchQueryItem)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PKSearchQueryItem;
  result = [(PKSearchQueryItem *)&v8 init];
  result->_bounds.origin.CGFloat x = x;
  result->_bounds.origin.CGFloat y = y;
  result->_bounds.size.CGFloat width = width;
  result->_bounds.size.CGFloat height = height;
  return result;
}

- (PKSearchQueryItem)initWithBounds:(CGRect)a3 strokes:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (NSArray *)a4;
  v10 = -[PKSearchQueryItem initWithBounds:](self, "initWithBounds:", x, y, width, height);
  strokes = v10->_strokes;
  v10->_strokes = v9;

  return v10;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (void).cxx_destruct
{
}

@end