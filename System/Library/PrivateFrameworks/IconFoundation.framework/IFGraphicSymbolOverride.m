@interface IFGraphicSymbolOverride
- (BOOL)isDefault;
- (CGSize)offset;
- (IFGraphicSymbolOverride)initWithShape:(int64_t)a3 enclosureDimension:(int)a4;
- (float)pointSizeAdjuster;
- (id)description;
- (int)enclosureDimension;
- (int64_t)shape;
- (unint64_t)symbolSize;
- (unint64_t)symbolWeight;
- (void)setIsDefault:(BOOL)a3;
- (void)setOffset:(CGSize)a3;
- (void)setPointSizeAdjuster:(float)a3;
- (void)setSymbolSize:(unint64_t)a3;
- (void)setSymbolWeight:(unint64_t)a3;
@end

@implementation IFGraphicSymbolOverride

- (IFGraphicSymbolOverride)initWithShape:(int64_t)a3 enclosureDimension:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IFGraphicSymbolOverride;
  result = [(IFGraphicSymbolOverride *)&v7 init];
  if (result)
  {
    result->_shape = a3;
    result->_enclosureDimension = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)IFGraphicSymbolOverride;
  v4 = [(IFGraphicSymbolOverride *)&v16 description];
  int64_t v5 = [(IFGraphicSymbolOverride *)self shape];
  uint64_t v6 = [(IFGraphicSymbolOverride *)self enclosureDimension];
  unint64_t v7 = [(IFGraphicSymbolOverride *)self symbolWeight];
  unint64_t v8 = [(IFGraphicSymbolOverride *)self symbolSize];
  [(IFGraphicSymbolOverride *)self pointSizeAdjuster];
  double v10 = v9;
  [(IFGraphicSymbolOverride *)self offset];
  uint64_t v12 = v11;
  [(IFGraphicSymbolOverride *)self offset];
  v14 = [v3 stringWithFormat:@"%@ - shape: %lu, dimension: %d :: weight: %lu, size: %lu, adjuster: %f, offset: (%f, %f)", v4, v5, v6, v7, v8, *(void *)&v10, v12, v13];

  return v14;
}

- (int64_t)shape
{
  return self->_shape;
}

- (int)enclosureDimension
{
  return self->_enclosureDimension;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  self->_isDefault = a3;
}

- (unint64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(unint64_t)a3
{
  self->_symbolWeight = a3;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (void)setSymbolSize:(unint64_t)a3
{
  self->_symbolSize = a3;
}

- (float)pointSizeAdjuster
{
  return self->_pointSizeAdjuster;
}

- (void)setPointSizeAdjuster:(float)a3
{
  self->_pointSizeAdjuster = a3;
}

- (CGSize)offset
{
  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

@end