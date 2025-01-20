@interface _TDPackerNode
- (BOOL)fit;
- (BOOL)used;
- (CGPoint)origin;
- (CGSize)size;
- (_TDPackerNode)down;
- (_TDPackerNode)right;
- (void)dealloc;
- (void)node;
- (void)setDown:(id)a3;
- (void)setFit:(BOOL)a3;
- (void)setNode:(void *)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setRight:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setUsed:(BOOL)a3;
@end

@implementation _TDPackerNode

- (void)dealloc
{
  [(_TDPackerNode *)self setDown:0];
  [(_TDPackerNode *)self setRight:0];
  v3.receiver = self;
  v3.super_class = (Class)_TDPackerNode;
  [(_TDPackerNode *)&v3 dealloc];
}

- (BOOL)used
{
  return self->_used;
}

- (void)setUsed:(BOOL)a3
{
  self->_used = a3;
}

- (_TDPackerNode)down
{
  return self->_down;
}

- (void)setDown:(id)a3
{
}

- (_TDPackerNode)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
}

- (BOOL)fit
{
  return self->_fit;
}

- (void)setFit:(BOOL)a3
{
  self->_fit = a3;
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

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (void)node
{
  return self->_node;
}

- (void)setNode:(void *)a3
{
  self->_node = a3;
}

@end