@interface BoundingBoxWithLabel
- (BoundingBoxWithLabel)initWithLabel:(unsigned __int16)a3;
- (float)depth;
- (unint64_t)computeArea;
- (unint64_t)maxX;
- (unint64_t)maxY;
- (unint64_t)minX;
- (unint64_t)minY;
- (unsigned)alias;
- (unsigned)label;
- (void)setAlias:(unsigned __int16)a3;
- (void)setDepth:(float)a3;
- (void)setMaxX:(unint64_t)a3;
- (void)setMaxY:(unint64_t)a3;
- (void)setMinX:(unint64_t)a3;
- (void)setMinY:(unint64_t)a3;
@end

@implementation BoundingBoxWithLabel

- (BoundingBoxWithLabel)initWithLabel:(unsigned __int16)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BoundingBoxWithLabel;
  v4 = [(BoundingBoxWithLabel *)&v9 init];
  v5 = v4;
  if (v4)
  {
    *(void *)&long long v6 = 0xFFFFLL;
    *((void *)&v6 + 1) = 0xFFFFLL;
    *(_OWORD *)&v4->_minX = v6;
    v4->_depth = 0.0;
    v4->_maxX = 0;
    v4->_maxY = 0;
    v4->_label = a3;
    v4->_alias = 0;
    v7 = v4;
  }

  return v5;
}

- (unint64_t)computeArea
{
  return (self->_maxY - self->_minY) * (self->_maxX - self->_minX);
}

- (unint64_t)minX
{
  return self->_minX;
}

- (void)setMinX:(unint64_t)a3
{
  self->_minX = a3;
}

- (unint64_t)minY
{
  return self->_minY;
}

- (void)setMinY:(unint64_t)a3
{
  self->_minY = a3;
}

- (unint64_t)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(unint64_t)a3
{
  self->_maxX = a3;
}

- (unint64_t)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(unint64_t)a3
{
  self->_maxY = a3;
}

- (float)depth
{
  return self->_depth;
}

- (void)setDepth:(float)a3
{
  self->_depth = a3;
}

- (unsigned)alias
{
  return self->_alias;
}

- (void)setAlias:(unsigned __int16)a3
{
  self->_alias = a3;
}

- (unsigned)label
{
  return self->_label;
}

@end