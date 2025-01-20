@interface _CUINineImagePieces
- (BOOL)tileCenterAndEdges;
- (_CUINineImagePieces)initWithCenter:(id)a3 topLeft:(id)a4 top:(id)a5 topRight:(id)a6 right:(id)a7 bottomRight:(id)a8 bottom:(id)a9 bottomLeft:(id)a10 left:(id)a11 tileCenterAndEdges:(BOOL)a12;
- (id)bottom;
- (id)bottomLeft;
- (id)bottomRight;
- (id)center;
- (id)left;
- (id)right;
- (id)top;
- (id)topLeft;
- (id)topRight;
- (void)dealloc;
@end

@implementation _CUINineImagePieces

- (_CUINineImagePieces)initWithCenter:(id)a3 topLeft:(id)a4 top:(id)a5 topRight:(id)a6 right:(id)a7 bottomRight:(id)a8 bottom:(id)a9 bottomLeft:(id)a10 left:(id)a11 tileCenterAndEdges:(BOOL)a12
{
  v20.receiver = self;
  v20.super_class = (Class)_CUINineImagePieces;
  v18 = [(_CUINineImagePieces *)&v20 init];
  if (v18)
  {
    v18->_center = (CUIImage *)a3;
    v18->_topLeft = (CUIImage *)a4;
    v18->_top = (CUIImage *)a5;
    v18->_topRight = (CUIImage *)a6;
    v18->_right = (CUIImage *)a7;
    v18->_bottomRight = (CUIImage *)a8;
    v18->_bottom = (CUIImage *)a9;
    v18->_bottomLeft = (CUIImage *)a10;
    v18->_left = (CUIImage *)a11;
    v18->_tileCenterAndEdges = a12;
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUINineImagePieces;
  [(_CUINineImagePieces *)&v3 dealloc];
}

- (id)center
{
  return self->_center;
}

- (id)topLeft
{
  return self->_topLeft;
}

- (id)top
{
  return self->_top;
}

- (id)topRight
{
  return self->_topRight;
}

- (id)right
{
  return self->_right;
}

- (id)bottomRight
{
  return self->_bottomRight;
}

- (id)bottom
{
  return self->_bottom;
}

- (id)bottomLeft
{
  return self->_bottomLeft;
}

- (id)left
{
  return self->_left;
}

- (BOOL)tileCenterAndEdges
{
  return self->_tileCenterAndEdges;
}

@end