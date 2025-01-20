@interface JFXEffectPreviewOptions
- (PVColorSpace)outputColorSpace;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPreviewOptions;
- (unint64_t)quality;
- (unsigned)parentCode;
- (void)setOutputColorSpace:(id)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setQuality:(unint64_t)a3;
@end

@implementation JFXEffectPreviewOptions

- (id)initPreviewOptions
{
  v7.receiver = self;
  v7.super_class = (Class)JFXEffectPreviewOptions;
  v2 = [(JFXEffectPreviewOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_quality = 0;
    uint64_t v4 = [MEMORY[0x263F61230] rec709GammaColorSpace];
    outputColorSpace = v3->_outputColorSpace;
    v3->_outputColorSpace = (PVColorSpace *)v4;

    v3->_parentCode = -1;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initPreviewOptions];
  *(_DWORD *)(v4 + 8) = self->_parentCode;
  objc_storeStrong((id *)(v4 + 24), self->_outputColorSpace);
  *(void *)(v4 + 16) = self->_quality;
  return (id)v4;
}

- (unint64_t)quality
{
  return self->_quality;
}

- (void)setQuality:(unint64_t)a3
{
  self->_quality = a3;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void)setOutputColorSpace:(id)a3
{
}

- (void).cxx_destruct
{
}

@end