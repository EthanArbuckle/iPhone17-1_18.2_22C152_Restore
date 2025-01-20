@interface ABPKCropParams
- (ABPKCropParams)initWithAspectRatio:(float)a3 andInputResolution:(CGSize)a4;
- (ABPKCropParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4;
- (unsigned)height;
- (unsigned)offsetHeight;
- (unsigned)offsetWidth;
- (unsigned)width;
- (void)setHeight:(unsigned int)a3;
- (void)setOffsetHeight:(unsigned int)a3;
- (void)setOffsetWidth:(unsigned int)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation ABPKCropParams

- (ABPKCropParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v6 = a3.width / height;
  *(float *)&CGFloat v6 = v6;
  return [(ABPKCropParams *)self initWithAspectRatio:v6 andInputResolution:width];
}

- (ABPKCropParams)initWithAspectRatio:(float)a3 andInputResolution:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)ABPKCropParams;
  v7 = [(ABPKCropParams *)&v15 init];
  v8 = v7;
  if (v7)
  {
    float v9 = width / height;
    if (v9 == a3)
    {
      *(void *)&v7->_offsetHeight = 0;
      v7->_double height = height;
      uint64_t v10 = 20;
    }
    else if (v9 <= a3)
    {
      unsigned int v12 = (float)((float)width / a3);
      v7->_double height = v12;
      v7->_double width = width;
      v7->_offsetWidth = 0;
      if (v12) {
        v7->_double height = --v12;
      }
      double width = (height - (double)v12) * 0.5;
      uint64_t v10 = 8;
    }
    else
    {
      unsigned int v11 = (float)((float)height * a3);
      v7->_double height = height;
      v7->_double width = v11;
      v7->_offsetHeight = 0;
      if (v11) {
        v7->_double width = --v11;
      }
      double width = (width - (double)v11) * 0.5;
      uint64_t v10 = 12;
    }
    *(_DWORD *)((char *)&v7->super.isa + v10) = width;
    v13 = v7;
  }

  return v8;
}

- (unsigned)offsetHeight
{
  return self->_offsetHeight;
}

- (void)setOffsetHeight:(unsigned int)a3
{
  self->_offsetHeight = a3;
}

- (unsigned)offsetWidth
{
  return self->_offsetWidth;
}

- (void)setOffsetWidth:(unsigned int)a3
{
  self->_offsetWidth = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_double height = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_double width = a3;
}

@end