@interface IFSymbolImageDescriptor
- (IFSymbolImageDescriptor)init;
- (double)pointSize;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)digest;
- (int64_t)layoutDirection;
- (int64_t)symbolWeight;
- (unint64_t)symbolSize;
- (void)setLayoutDirection:(int64_t)a3;
- (void)setPointSize:(double)a3;
- (void)setScale:(double)a3;
- (void)setSymbolSize:(unint64_t)a3;
- (void)setSymbolWeight:(int64_t)a3;
@end

@implementation IFSymbolImageDescriptor

- (IFSymbolImageDescriptor)init
{
  v8.receiver = self;
  v8.super_class = (Class)IFSymbolImageDescriptor;
  v2 = [(IFSymbolImageDescriptor *)&v8 init];
  if (v2)
  {
    MGGetFloat32Answer();
    *((double *)v2 + 2) = v3;
    *((void *)v2 + 1) = 0x4031000000000000;
    *(_OWORD *)(v2 + 24) = xmmword_1DC701F20;
    *((void *)v2 + 5) = 5;
    v4 = (void *)MEMORY[0x1E4F1CA20];
    v5 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    uint64_t v6 = [v4 characterDirectionForLanguage:v5];

    if (v6 == 2) {
      *((void *)v2 + 5) = 4;
    }
  }
  return (IFSymbolImageDescriptor *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *((void *)result + 1) = *(void *)&self->_pointSize;
  *((void *)result + 2) = *(void *)&self->_scale;
  *((void *)result + 4) = self->_symbolWeight;
  *((void *)result + 3) = self->_symbolSize;
  *((void *)result + 5) = self->_layoutDirection;
  return result;
}

- (id)digest
{
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f:%.0f:%ld:%ld", *(void *)&self->_pointSize, *(void *)&self->_scale, self->_symbolSize, self->_symbolWeight);
  float v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v2);

  return v3;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (void)setSymbolSize:(unint64_t)a3
{
  self->_symbolSize = a3;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(int64_t)a3
{
  self->_symbolWeight = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

@end