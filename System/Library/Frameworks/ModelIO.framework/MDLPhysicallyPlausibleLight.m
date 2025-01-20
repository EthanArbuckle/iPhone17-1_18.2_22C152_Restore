@interface MDLPhysicallyPlausibleLight
- (CGColorRef)color;
- (MDLPhysicallyPlausibleLight)init;
- (float)attenuationEndDistance;
- (float)attenuationFalloffExponent;
- (float)attenuationStartDistance;
- (float)innerConeAngle;
- (float)lumens;
- (float)outerConeAngle;
- (void)setAttenuationEndDistance:(float)attenuationEndDistance;
- (void)setAttenuationFalloffExponent:(float)a3;
- (void)setAttenuationStartDistance:(float)attenuationStartDistance;
- (void)setColor:(CGColorRef)color;
- (void)setColorByTemperature:(float)temperature;
- (void)setInnerConeAngle:(float)innerConeAngle;
- (void)setLumens:(float)lumens;
- (void)setOuterConeAngle:(float)outerConeAngle;
@end

@implementation MDLPhysicallyPlausibleLight

- (MDLPhysicallyPlausibleLight)init
{
  v5.receiver = self;
  v5.super_class = (Class)MDLPhysicallyPlausibleLight;
  v2 = [(MDLLight *)&v5 init];
  if (v2)
  {
    light = v2->super._light;
    if (light) {
      (*((void (**)(RTLight *))light->var0 + 1))(light);
    }
    operator new();
  }

  return 0;
}

- (void)setColor:(CGColorRef)color
{
  light = self->super._light;
  if (color)
  {
    v6 = self->super._light;
    v7 = color;
  }
  else
  {
    v3.i32[0] = 1170939904;
    v7 = sub_20B06879C(v3, v4);
    v6 = light;
  }

  sub_20B10DAF8((uint64_t)v6, v7);
}

- (CGColorRef)color
{
  return self->super._light->var1;
}

- (void)setColorByTemperature:(float)temperature
{
  light = self->super._light;
  objc_super v5 = sub_20B06879C(*(float32x4_t *)&temperature, v3);

  sub_20B10DAF8((uint64_t)light, v5);
}

- (void)setInnerConeAngle:(float)innerConeAngle
{
  self->_innerConeAngle = innerConeAngle;
  *((float *)&self->super._light->var3 + 1) = innerConeAngle;
}

- (void)setOuterConeAngle:(float)outerConeAngle
{
  self->_outerConeAngle = outerConeAngle;
  *(float *)&self->super._light[1].var0 = outerConeAngle;
}

- (void)setAttenuationEndDistance:(float)attenuationEndDistance
{
  self->_attenuationEndDistance = attenuationEndDistance;
  *(float *)&self->super._light[1].var1 = attenuationEndDistance;
}

- (void)setAttenuationStartDistance:(float)attenuationStartDistance
{
  self->_attenuationStartDistance = attenuationStartDistance;
  *((float *)&self->super._light[1].var0 + 1) = attenuationStartDistance;
}

- (void)setAttenuationFalloffExponent:(float)a3
{
  self->_attenuationFalloffExponent = a3;
  *((float *)&self->super._light[1].var1 + 1) = a3;
}

- (void)setLumens:(float)lumens
{
  self->_lumens = lumens;
  *((float *)&self->super._light[1].var2 + 1) = lumens;
}

- (float)lumens
{
  return self->_lumens;
}

- (float)innerConeAngle
{
  return self->_innerConeAngle;
}

- (float)outerConeAngle
{
  return self->_outerConeAngle;
}

- (float)attenuationStartDistance
{
  return self->_attenuationStartDistance;
}

- (float)attenuationEndDistance
{
  return self->_attenuationEndDistance;
}

- (float)attenuationFalloffExponent
{
  return self->_attenuationFalloffExponent;
}

@end