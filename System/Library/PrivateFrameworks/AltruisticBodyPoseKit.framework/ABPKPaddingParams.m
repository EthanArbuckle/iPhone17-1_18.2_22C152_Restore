@interface ABPKPaddingParams
- (ABPKPaddingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4;
- (float)scale;
- (unsigned)height;
- (unsigned)offsetHeight;
- (unsigned)offsetWidth;
- (unsigned)width;
- (void)setHeight:(unsigned int)a3;
- (void)setOffsetHeight:(unsigned int)a3;
- (void)setOffsetWidth:(unsigned int)a3;
- (void)setScale:(float)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation ABPKPaddingParams

- (ABPKPaddingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)ABPKPaddingParams;
  v8 = [(ABPKPaddingParams *)&v23 init];
  v9 = v8;
  if (v8)
  {
    float v10 = v6;
    float v11 = v7 / v10;
    float v12 = height;
    double v13 = v12;
    float v14 = width / v13;
    if (v11 == v14)
    {
      *(void *)&v8->_offsetHeight = 0;
      v8->_double height = height;
      v8->_double width = width;
      float v15 = v13 / v6;
      v8->_scale = v15;
    }
    else if (v11 <= v14)
    {
      float v19 = v13 / v6;
      v8->_scale = v19;
      unsigned int v20 = (v7 * v19) & 0xFFFFFFFE;
      v8->_double height = height;
      v8->_double width = v20;
      v8->_offsetHeight = 0;
      v8->_offsetWidth = ((width - (double)v20) * 0.5);
    }
    else
    {
      float v16 = width;
      float v17 = v16 / v7;
      v8->_scale = v17;
      unsigned int v18 = (v6 * v17) & 0xFFFFFFFE;
      v8->_double height = v18;
      v8->_double width = width;
      *(void *)&v8->_offsetHeight = ((height - (double)v18) * 0.5);
    }
    v21 = v8;
  }

  return v9;
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

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

@end