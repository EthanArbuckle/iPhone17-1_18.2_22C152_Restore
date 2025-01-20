@interface TDSlice
- (CGRect)primitiveSliceRect;
- (CGRect)sliceRect;
- (void)awakeFromFetch;
- (void)setPrimitiveSliceRect:(CGRect)a3;
- (void)setSliceRect:(CGRect)a3;
@end

@implementation TDSlice

- (void)setPrimitiveSliceRect:(CGRect)a3
{
  self->_sliceRect = a3;
}

- (CGRect)primitiveSliceRect
{
  double x = self->_sliceRect.origin.x;
  double y = self->_sliceRect.origin.y;
  double width = self->_sliceRect.size.width;
  double height = self->_sliceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSliceRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TDSlice *)self willChangeValueForKey:@"sliceRect"];
  self->_sliceRect.origin.CGFloat x = x;
  self->_sliceRect.origin.CGFloat y = y;
  self->_sliceRect.size.CGFloat width = width;
  self->_sliceRect.size.CGFloat height = height;
  [(TDSlice *)self didChangeValueForKey:@"sliceRect"];
  v8 = NSStringFromRect(self->_sliceRect);

  [(TDSlice *)self setSliceRectString:v8];
}

- (CGRect)sliceRect
{
  [(TDSlice *)self willAccessValueForKey:@"sliceRect"];
  [(TDSlice *)self primitiveSliceRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TDSlice *)self didAccessValueForKey:@"sliceRect"];
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)TDSlice;
  [(TDSlice *)&v3 awakeFromFetch];
  NSRect v4 = NSRectFromString((NSString *)[(TDSlice *)self sliceRectString]);
  -[TDSlice setPrimitiveSliceRect:](self, "setPrimitiveSliceRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

@end