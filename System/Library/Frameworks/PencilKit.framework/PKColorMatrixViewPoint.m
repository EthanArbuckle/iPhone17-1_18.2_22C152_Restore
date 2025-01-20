@interface PKColorMatrixViewPoint
+ (id)pointWithRow:(int64_t)a3 col:(int64_t)a4;
- (PKColorMatrixViewPoint)initWithRow:(int64_t)a3 col:(int64_t)a4;
- (int64_t)col;
- (int64_t)row;
@end

@implementation PKColorMatrixViewPoint

- (PKColorMatrixViewPoint)initWithRow:(int64_t)a3 col:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKColorMatrixViewPoint;
  result = [(PKColorMatrixViewPoint *)&v7 init];
  result->_row = a3;
  result->_col = a4;
  return result;
}

+ (id)pointWithRow:(int64_t)a3 col:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithRow:a3 col:a4];

  return v4;
}

- (int64_t)row
{
  return self->_row;
}

- (int64_t)col
{
  return self->_col;
}

@end