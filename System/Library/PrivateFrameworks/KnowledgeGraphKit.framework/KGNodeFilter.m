@interface KGNodeFilter
- (BOOL)matchesNode:(id)a3;
- (BOOL)whereNoInAndOutEdges;
- (BOOL)whereNoInEdges;
- (BOOL)whereNoOutEdges;
- (void)setWhereNoInAndOutEdges:(BOOL)a3;
- (void)setWhereNoInEdges:(BOOL)a3;
- (void)setWhereNoOutEdges:(BOOL)a3;
@end

@implementation KGNodeFilter

- (void)setWhereNoOutEdges:(BOOL)a3
{
  self->_whereNoOutEdges = a3;
}

- (BOOL)whereNoOutEdges
{
  return self->_whereNoOutEdges;
}

- (void)setWhereNoInEdges:(BOOL)a3
{
  self->_whereNoInEdges = a3;
}

- (BOOL)whereNoInEdges
{
  return self->_whereNoInEdges;
}

- (void)setWhereNoInAndOutEdges:(BOOL)a3
{
  self->_whereNoInAndOutEdges = a3;
}

- (BOOL)whereNoInAndOutEdges
{
  return self->_whereNoInAndOutEdges;
}

- (BOOL)matchesNode:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KGNodeFilter;
  return [(KGElementFilter *)&v4 matchesElement:a3];
}

@end