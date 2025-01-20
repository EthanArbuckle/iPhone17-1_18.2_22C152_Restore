@interface CACloningTerminatorLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
@end

@implementation CACloningTerminatorLayer

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CACloningTerminatorLayer;
  id v6 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v12, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v6 && (*((unsigned char *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v8 = (atomic_uint *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
    if (v8)
    {
      v9 = v8;
      v8[2] = 1;
      v10 = v8 + 2;
      v8[3] = 8;
      ++dword_1EB2ADDE8;
      *(void *)v8 = &unk_1ED02EEB0;
      CA::Render::Layer::set_subclass((uint64_t)v6, (CA::Render::LayerSubclass *)v8);
      if (atomic_fetch_add(v10, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v9 + 16))(v9);
      }
    }
    else
    {
      CA::Render::Layer::set_subclass((uint64_t)v6, 0);
    }
  }
  return v6;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CACloningTerminatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

@end