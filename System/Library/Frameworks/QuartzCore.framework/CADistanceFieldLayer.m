@interface CADistanceFieldLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)invertsShape;
- (CGColor)foregroundColor;
- (NSString)renderMode;
- (double)lineWidth;
- (double)offset;
- (double)sharpness;
- (unsigned)_renderImageCopyFlags;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (void)_colorSpaceDidChange;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)setForegroundColor:(CGColor *)a3;
- (void)setInvertsShape:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setOffset:(double)a3;
- (void)setRenderMode:(id)a3;
- (void)setSharpness:(double)a3;
@end

@implementation CADistanceFieldLayer

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CADistanceFieldLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setForegroundColor:(CGColor *)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xEA, (const CGAffineTransform *)2, v3);
}

- (CGColor)foregroundColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xEAu, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)setSharpness:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1FB, (const CGAffineTransform *)0x12, v3);
}

- (double)sharpness
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1FBu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setOffset:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x194, (const CGAffineTransform *)0x12, v3);
}

- (double)offset
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x194u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setLineWidth:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x166, (const CGAffineTransform *)0x12, v3);
}

- (double)lineWidth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x166u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setInvertsShape:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x150, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)invertsShape
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x150u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setRenderMode:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1D4, (const CGAffineTransform *)3, v3);
}

- (NSString)renderMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1D4u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  while ((unsigned __int16)animatable_atoms[v3] != a3)
  {
    if (++v3 == 5)
    {
      v5.receiver = self;
      v5.super_class = (Class)CADistanceFieldLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  while ((unsigned __int16)all_atoms[v3] != a3)
  {
    if (++v3 == 6)
    {
      v5.receiver = self;
      v5.super_class = (Class)CADistanceFieldLayer;
      return -[CALayer _renderLayerDefinesProperty:](&v5, sel__renderLayerDefinesProperty_);
    }
  }
  return 1;
}

- (unsigned)_renderImageCopyFlags
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CADistanceFieldLayer;
  return [(CALayer *)&v3 _renderImageCopyFlags] | 0x28;
}

- (void)_colorSpaceDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CADistanceFieldLayer;
  objc_super v3 = (CA::Transaction *)[(CALayer *)&v5 _colorSpaceDidChange];
  uint64_t v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    uint64_t v4 = (CA::Transaction *)CA::Transaction::create(v3);
  }
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)CADistanceFieldLayer;
  id v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v25, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v8 && (*((unsigned char *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v10 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x28uLL, 0x743898A5uLL);
    v11 = (atomic_uint *)v10;
    if (v10)
    {
      *((_DWORD *)v10 + 2) = 1;
      *(void *)v10 = &unk_1ED02E9F8;
      *(void *)(v10 + 12) = 0x20000000CLL;
      ++dword_1EB2ADDF8;
      *((_DWORD *)v10 + 5) = 255;
      *((void *)v10 + 3) = 0;
      *((_DWORD *)v10 + 8) = 0;
    }
    v12 = [(CADistanceFieldLayer *)self renderMode];
    if (v12)
    {
      v13 = v12;
      if ([(NSString *)v12 isEqualToString:@"fill"])
      {
        int v14 = 1;
      }
      else if ([(NSString *)v13 isEqualToString:@"stroke"])
      {
        int v14 = 2;
      }
      else if ([(NSString *)v13 isEqualToString:@"innerStroke"])
      {
        int v14 = 3;
      }
      else if ([(NSString *)v13 isEqualToString:@"outerStroke"])
      {
        int v14 = 4;
      }
      else
      {
        int v14 = 0;
      }
      v11[4] = v14;
    }
    v15 = [(CADistanceFieldLayer *)self foregroundColor];
    if (v15)
    {
      v17 = v15;
      v18 = (CGColor *)CA::Context::current_colorspace((CA::Context *)a3, v16);
      atomic_uint v24 = 0;
      CA::Render::convert_cgcolor(v17, v18, (CGColorSpace *)&v24, 0, v19);
      v11[5] = v24;
    }
    [(CADistanceFieldLayer *)self lineWidth];
    *(float *)&double v20 = v20;
    v11[6] = LODWORD(v20);
    [(CADistanceFieldLayer *)self offset];
    *(float *)&double v21 = v21;
    v11[7] = LODWORD(v21);
    [(CADistanceFieldLayer *)self sharpness];
    *(float *)&double v22 = v22;
    v11[8] = LODWORD(v22);
    if ([(CADistanceFieldLayer *)self invertsShape]) {
      v11[3] |= 0x100u;
    }
    CA::Render::Layer::set_subclass((uint64_t)v8, (CA::Render::LayerSubclass *)v11);
    if (atomic_fetch_add(v11 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v11 + 16))(v11);
    }
  }
  return v8;
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  uint64_t v6 = 0;
  while (v5 != (unsigned __int16)all_atoms[v6])
  {
    if (++v6 == 6) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v7) {
    uint64_t v7 = (CA::Transaction *)CA::Transaction::create(v5);
  }
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)CADistanceFieldLayer;
  [(CADistanceFieldLayer *)&v8 didChangeValueForKey:a3];
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 1);
  if (v5 == 468) {
    return @"fill";
  }
  if (v5 == 234)
  {
    {
      {
        +[CADistanceFieldLayer defaultValueForKey:]::color = (uint64_t)black();
      }
    }
    return (id)+[CADistanceFieldLayer defaultValueForKey:]::color;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CADistanceFieldLayer;
    return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
  }
}

@end