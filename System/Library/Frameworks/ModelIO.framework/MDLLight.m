@interface MDLLight
- (CGColorRef)irradianceAtPoint:(vector_float3)point;
- (CGColorRef)irradianceAtPoint:(vector_float3)point colorSpace:(CGColorSpaceRef)colorSpace;
- (MDLLight)init;
- (MDLLightType)lightType;
- (NSString)colorSpace;
- (RTLight)rtLight;
- (__n128)position;
- (void)dealloc;
- (void)setColorSpace:(NSString *)colorSpace;
- (void)setLightType:(MDLLightType)lightType;
- (void)setTransform:(id)a3;
@end

@implementation MDLLight

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(NSString *)colorSpace
{
  name = colorSpace;
  objc_storeStrong((id *)&self->_colorSpace, colorSpace);
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace) {
    CGColorSpaceRelease(cgColorSpace);
  }
  self->_cgColorSpace = CGColorSpaceCreateWithName(name);
}

- (MDLLight)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)MDLLight;
  v2 = [(MDLObject *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(MDLTransform);
    objc_msgSend_setTransform_(v2, v4, (uint64_t)v3);

    CFStringRef v5 = (const __CFString *)*MEMORY[0x263F002D8];
    objc_storeStrong((id *)&v2->_colorSpace, (id)*MEMORY[0x263F002D8]);
    v6 = CGColorSpaceCreateWithName(v5);
    v2->_cgColorSpace = v6;
    *(_OWORD *)components = xmmword_20B1E76B0;
    long long v10 = unk_20B1E76C0;
    CGColorCreate(v6, components);
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  light = self->_light;
  if (light)
  {
    (*((void (**)(RTLight *, SEL))light->var0 + 1))(light, a2);
    self->_light = 0;
  }
  cgColorSpace = self->_cgColorSpace;
  if (cgColorSpace)
  {
    CGColorSpaceRelease(cgColorSpace);
    self->_cgColorSpace = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MDLLight;
  [(MDLLight *)&v5 dealloc];
}

- (void)setLightType:(MDLLightType)lightType
{
  self->_lightType = lightType;
  if (lightType - 1 > 3) {
    int v3 = 3;
  }
  else {
    int v3 = dword_20B1E7690[lightType - 1];
  }
  self->_light->var3 = v3;
}

- (RTLight)rtLight
{
  return self->_light;
}

- (CGColorRef)irradianceAtPoint:(vector_float3)point
{
  return (CGColorRef)(*((uint64_t (**)(void))self->_light->var0 + 2))();
}

- (CGColorRef)irradianceAtPoint:(vector_float3)point colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CGColorRef)(*((uint64_t (**)(RTLight *, uint64_t))self->_light->var0 + 3))(self->_light, point.i64[0]);
}

- (void)setTransform:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MDLLight;
  [(MDLObject *)&v6 setTransform:v5];
  if (self->_light) {
    objc_storeStrong(&self->_light->var2, a3);
  }
}

- (__n128)position
{
  objc_super v6 = objc_msgSend_transform(a1, a2, a3);
  if (v6)
  {
    v7 = objc_msgSend_transform(a1, v4, v5);
    objc_msgSend_matrix(v7, v8, v9);
    long long v12 = v10;
  }
  else
  {
    long long v12 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  }

  return (__n128)v12;
}

- (MDLLightType)lightType
{
  return self->_lightType;
}

- (void).cxx_destruct
{
}

@end