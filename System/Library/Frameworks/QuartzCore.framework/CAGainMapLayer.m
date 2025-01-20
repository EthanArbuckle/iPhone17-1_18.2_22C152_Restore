@interface CAGainMapLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (NSString)renderMode;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)setRenderMode:(id)a3;
@end

@implementation CAGainMapLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 468)
  {
    v6 = CA::Transaction::ensure_compat(v5);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAGainMapLayer;
  [(CAGainMapLayer *)&v7 didChangeValueForKey:a3];
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CAGainMapLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v14, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (!v7 || (*((unsigned char *)a5 + 2) & 1) == 0) {
    return v7;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    v9[2] = 0;
    *((_DWORD *)v9 + 2) = 1;
    *((_DWORD *)v9 + 3) = 19;
    ++dword_1EB2ADE14;
    void *v9 = &unk_1ED02D3E8;
  }
  v11 = [(CAGainMapLayer *)self renderMode];
  if ([(NSString *)v11 isEqualToString:@"gainBorder"])
  {
    char v12 = 1;
LABEL_11:
    *((unsigned char *)v10 + 16) = v12;
    goto LABEL_12;
  }
  if ([(NSString *)v11 isEqualToString:@"gainFill"])
  {
    char v12 = 2;
    goto LABEL_11;
  }
  if ([(NSString *)v11 isEqualToString:@"gainBorderRenderFill"])
  {
    char v12 = 3;
    goto LABEL_11;
  }
  *((unsigned char *)v10 + 16) = 0;
LABEL_12:
  CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
  if (atomic_fetch_add((atomic_uint *volatile)v10 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(void *))(*v10 + 16))(v10);
  }
  return v7;
}

- (NSString)renderMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1D4u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (void)setRenderMode:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1D4, (const CGAffineTransform *)3, v3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGainMapLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 == 468) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAGainMapLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"renderMode"]) {
    return @"gainBorder";
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGainMapLayer;
  return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

@end