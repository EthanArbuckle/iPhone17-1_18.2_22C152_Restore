@interface TDAbstractLayerReference
- (CGRect)frameRect;
- (CGRect)primitiveFrameRect;
- (void)awakeFromFetch;
- (void)setFrameRect:(CGRect)a3;
- (void)setPrimitiveFrameRect:(CGRect)a3;
@end

@implementation TDAbstractLayerReference

- (void)setPrimitiveFrameRect:(CGRect)a3
{
  self->_frameRect = a3;
}

- (CGRect)primitiveFrameRect
{
  double x = self->_frameRect.origin.x;
  double y = self->_frameRect.origin.y;
  double width = self->_frameRect.size.width;
  double height = self->_frameRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TDAbstractLayerReference *)self willChangeValueForKey:@"frameRect"];
  self->_frameRect.origin.CGFloat x = x;
  self->_frameRect.origin.CGFloat y = y;
  self->_frameRect.size.CGFloat width = width;
  self->_frameRect.size.CGFloat height = height;
  [(TDAbstractLayerReference *)self didChangeValueForKey:@"frameRect"];
  v8 = NSStringFromRect(self->_frameRect);

  [(TDAbstractLayerReference *)self setFrameRectString:v8];
}

- (CGRect)frameRect
{
  [(TDAbstractLayerReference *)self willAccessValueForKey:@"frameRect"];
  [(TDAbstractLayerReference *)self primitiveFrameRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TDAbstractLayerReference *)self didAccessValueForKey:@"frameRect"];
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
  v3.super_class = (Class)TDAbstractLayerReference;
  [(TDAbstractLayerReference *)&v3 awakeFromFetch];
  NSRect v4 = NSRectFromString((NSString *)[(TDAbstractLayerReference *)self frameRectString]);
  -[TDAbstractLayerReference setPrimitiveFrameRect:](self, "setPrimitiveFrameRect:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

@end