@interface MDLAreaLight
- (MDLAreaLight)init;
- (float)areaRadius;
- (float)aspect;
- (vector_float2)superEllipticPower;
- (void)setAreaRadius:(float)areaRadius;
- (void)setAspect:(float)aspect;
- (void)setSuperEllipticPower:(vector_float2)superEllipticPower;
@end

@implementation MDLAreaLight

- (MDLAreaLight)init
{
  v7.receiver = self;
  v7.super_class = (Class)MDLAreaLight;
  v2 = [(MDLPhysicallyPlausibleLight *)&v7 init];
  if (v2)
  {
    light = v2->super.super._light;
    if (light) {
      float32x4_t v3 = (float32x4_t)((__n128 (*)(RTLight *))*((void *)light->var0 + 1))(light);
    }
    v3.i32[0] = 1170939904;
    sub_20B06879C(v3, v4);
    operator new();
  }

  return 0;
}

- (void)setAreaRadius:(float)areaRadius
{
  self->_areaRadius = areaRadius;
  *(float *)&self->super.super._light[1].var2 = areaRadius;
}

- (void)setAspect:(float)aspect
{
  self->_aspect = aspect;
  *(float *)&self->super.super._light[2].var0 = aspect;
}

- (void)setSuperEllipticPower:(vector_float2)superEllipticPower
{
  *(vector_float2 *)self->_superEllipticPower = superEllipticPower;
  *(vector_float2 *)&self->super.super._light[1].var3 = superEllipticPower;
}

- (float)areaRadius
{
  return self->_areaRadius;
}

- (vector_float2)superEllipticPower
{
  return *(vector_float2 *)self->_superEllipticPower;
}

- (float)aspect
{
  return self->_aspect;
}

@end