@interface _Flower
- (NSNumber)tex;
- (float)height;
- (float)width;
- (void)setHeight:(float)a3;
- (void)setTex:(id)a3;
- (void)setWidth:(float)a3;
@end

@implementation _Flower

- (NSNumber)tex
{
  return self->_tex;
}

- (void)setTex:(id)a3
{
}

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

- (void).cxx_destruct
{
}

@end