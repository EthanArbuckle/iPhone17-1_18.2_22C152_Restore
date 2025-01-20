@interface CPZoneBorderNeighbor
- (CPZoneBorderNeighbor)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initSuper;
- (id)neighborShape;
- (int)shapeSide;
- (void)dealloc;
- (void)setNeighborShape:(id)a3;
- (void)setShapeSide:(int)a3;
@end

@implementation CPZoneBorderNeighbor

- (int)shapeSide
{
  return self->shapeSide;
}

- (void)setShapeSide:(int)a3
{
  self->shapeSide = a3;
}

- (id)neighborShape
{
  return self->neighborShape;
}

- (void)setNeighborShape:(id)a3
{
  neighborShape = self->neighborShape;
  if (neighborShape != a3)
  {

    self->neighborShape = (CPShape *)a3;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  [(CPZoneBorderNeighbor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = (id *)CPCopyObject(self, a3);
  id v4 = v3[1];
  return v3;
}

- (id)initSuper
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  return [(CPZoneBorderNeighbor *)&v3 init];
}

- (CPZoneBorderNeighbor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderNeighbor;
  result = [(CPZoneBorderNeighbor *)&v3 init];
  if (result)
  {
    result->neighborShape = 0;
    result->shapeSide = 0;
  }
  return result;
}

@end