@interface MDLScatteringFunction
- (MDLMaterialProperty)ambientOcclusion;
- (MDLMaterialProperty)ambientOcclusionScale;
- (MDLMaterialProperty)baseColor;
- (MDLMaterialProperty)emission;
- (MDLMaterialProperty)interfaceIndexOfRefraction;
- (MDLMaterialProperty)materialIndexOfRefraction;
- (MDLMaterialProperty)normal;
- (MDLMaterialProperty)specular;
- (MDLScatteringFunction)init;
- (NSString)name;
- (id).cxx_construct;
- (void)setName:(NSString *)name;
@end

@implementation MDLScatteringFunction

- (MDLScatteringFunction)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3.receiver = self;
  v3.super_class = (Class)MDLScatteringFunction;
  if ([(MDLScatteringFunction *)&v3 init]) {
    operator new();
  }

  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (MDLMaterialProperty)baseColor
{
  return self->_baseColor;
}

- (MDLMaterialProperty)emission
{
  return self->_emission;
}

- (MDLMaterialProperty)specular
{
  return self->_specular;
}

- (MDLMaterialProperty)materialIndexOfRefraction
{
  return self->_materialIndexOfRefraction;
}

- (MDLMaterialProperty)interfaceIndexOfRefraction
{
  return self->_interfaceIndexOfRefraction;
}

- (MDLMaterialProperty)normal
{
  return self->_normal;
}

- (MDLMaterialProperty)ambientOcclusion
{
  return self->_ambientOcclusion;
}

- (MDLMaterialProperty)ambientOcclusionScale
{
  return self->_ambientOcclusionScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientOcclusionScale, 0);
  objc_storeStrong((id *)&self->_ambientOcclusion, 0);
  objc_storeStrong((id *)&self->_normal, 0);
  objc_storeStrong((id *)&self->_interfaceIndexOfRefraction, 0);
  objc_storeStrong((id *)&self->_materialIndexOfRefraction, 0);
  objc_storeStrong((id *)&self->_specular, 0);
  objc_storeStrong((id *)&self->_emission, 0);
  value = self->_bsdf.__ptr_.__value_;
  self->_bsdf.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(BidirectionalScatteringDistributionFunction *))value->var0 + 1))(value);
  }
  objc_storeStrong((id *)&self->_baseColor, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end