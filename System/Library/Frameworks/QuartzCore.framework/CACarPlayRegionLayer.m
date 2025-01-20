@interface CACarPlayRegionLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
- (NSString)identifier;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)setIdentifier:(id)a3;
@end

@implementation CACarPlayRegionLayer

- (void)setIdentifier:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x109, (const CGAffineTransform *)3, v3);
}

- (NSString)identifier
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x109u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CACarPlayRegionLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v14, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v7 && (*((unsigned char *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v10 = v9;
    if (v9)
    {
      v9[2] = 1;
      v9[3] = 6;
      ++dword_1EB2ADDE0;
      *(void *)v9 = &unk_1ED02E8E8;
      *((void *)v9 + 2) = 0;
    }
    v11 = [(CACarPlayRegionLayer *)self identifier];
    v12 = (NSString *)*((void *)v10 + 2);
    if (v12 != v11)
    {
      if (v12) {
        CFRelease(v12);
      }
      *((void *)v10 + 2) = v11;
      if (v11) {
        CFRetain(v11);
      }
    }
    CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
    if (atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(_DWORD *))(*(void *)v10 + 16))(v10);
    }
  }
  return v7;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CACarPlayRegionLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

@end