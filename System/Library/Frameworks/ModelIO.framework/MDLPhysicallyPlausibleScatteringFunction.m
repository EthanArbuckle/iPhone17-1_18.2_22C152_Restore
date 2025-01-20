@interface MDLPhysicallyPlausibleScatteringFunction
- (MDLMaterialProperty)anisotropic;
- (MDLMaterialProperty)anisotropicRotation;
- (MDLMaterialProperty)clearcoat;
- (MDLMaterialProperty)clearcoatGloss;
- (MDLMaterialProperty)metallic;
- (MDLMaterialProperty)roughness;
- (MDLMaterialProperty)sheen;
- (MDLMaterialProperty)sheenTint;
- (MDLMaterialProperty)specularAmount;
- (MDLMaterialProperty)specularTint;
- (MDLMaterialProperty)subsurface;
- (MDLPhysicallyPlausibleScatteringFunction)init;
- (NSInteger)version;
@end

@implementation MDLPhysicallyPlausibleScatteringFunction

- (NSInteger)version
{
  return 1;
}

- (MDLPhysicallyPlausibleScatteringFunction)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLPhysicallyPlausibleScatteringFunction;
  v3 = [(MDLScatteringFunction *)&v6 init];
  if (v3 == self)
  {
    name = self->super._name;
    self->super._name = (NSString *)@"SimplifiedPhysical";

    operator new();
  }

  return 0;
}

- (MDLMaterialProperty)subsurface
{
  return self->_subsurface;
}

- (MDLMaterialProperty)metallic
{
  return self->_metallic;
}

- (MDLMaterialProperty)specularAmount
{
  return self->_specularAmount;
}

- (MDLMaterialProperty)specularTint
{
  return self->_specularTint;
}

- (MDLMaterialProperty)roughness
{
  return self->_roughness;
}

- (MDLMaterialProperty)anisotropic
{
  return self->_anisotropic;
}

- (MDLMaterialProperty)anisotropicRotation
{
  return self->_anisotropicRotation;
}

- (MDLMaterialProperty)sheen
{
  return self->_sheen;
}

- (MDLMaterialProperty)sheenTint
{
  return self->_sheenTint;
}

- (MDLMaterialProperty)clearcoat
{
  return self->_clearcoat;
}

- (MDLMaterialProperty)clearcoatGloss
{
  return self->_clearcoatGloss;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearcoatGloss, 0);
  objc_storeStrong((id *)&self->_clearcoat, 0);
  objc_storeStrong((id *)&self->_sheenTint, 0);
  objc_storeStrong((id *)&self->_sheen, 0);
  objc_storeStrong((id *)&self->_anisotropicRotation, 0);
  objc_storeStrong((id *)&self->_anisotropic, 0);
  objc_storeStrong((id *)&self->_roughness, 0);
  objc_storeStrong((id *)&self->_specularTint, 0);
  objc_storeStrong((id *)&self->_specularAmount, 0);
  objc_storeStrong((id *)&self->_metallic, 0);

  objc_storeStrong((id *)&self->_subsurface, 0);
}

@end