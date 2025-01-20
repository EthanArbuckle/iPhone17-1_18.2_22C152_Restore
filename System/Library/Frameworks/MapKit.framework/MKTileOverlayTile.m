@interface MKTileOverlayTile
- ($4479F518DFD59EF68F6FA14DAF968345)path;
- ($FD2884BA735A6398BD92EEF91FE53E55)frame;
- (NSData)image;
- (double)scale;
- (id)description;
- (void)setFrame:(id)a3;
- (void)setImage:(id)a3;
- (void)setPath:(id *)a3;
- (void)setScale:(double)a3;
@end

@implementation MKTileOverlayTile

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MKTileOverlayTile;
  v4 = [(MKTileOverlayTile *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ (x:%ld y:%ld z:%ld image:%ld bytes)", v4, self->_path.x, self->_path.y, self->_path.z, -[NSData length](self->_image, "length")];

  return v5;
}

- ($4479F518DFD59EF68F6FA14DAF968345)path
{
  long long v3 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setPath:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_path.z = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_path.x = v3;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setFrame:(id)a3
{
  self->_frame = ($B4107F3CF54D6A10AA3E39D325AB6F2C)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end