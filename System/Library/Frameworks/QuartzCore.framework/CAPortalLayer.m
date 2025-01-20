@interface CAPortalLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)allowedInContextTransform;
- (BOOL)allowsBackdropGroups;
- (BOOL)crossDisplay;
- (BOOL)hidesSourceLayer;
- (BOOL)matchesOpacity;
- (BOOL)matchesPosition;
- (BOOL)matchesTransform;
- (CALayer)sourceLayer;
- (NSDictionary)overrides;
- (unint64_t)sourceLayerRenderId;
- (unsigned)sourceContextId;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setAllowedInContextTransform:(BOOL)a3;
- (void)setAllowsBackdropGroups:(BOOL)a3;
- (void)setCrossDisplay:(BOOL)a3;
- (void)setHidesSourceLayer:(BOOL)a3;
- (void)setMatchesOpacity:(BOOL)a3;
- (void)setMatchesPosition:(BOOL)a3;
- (void)setMatchesTransform:(BOOL)a3;
- (void)setOverrides:(id)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayer:(id)a3;
- (void)setSourceLayerRenderId:(unint64_t)a3;
@end

@implementation CAPortalLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(10, (uint64_t)&-[CAPortalLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAPortalLayer;
  [(CAPortalLayer *)&v8 didChangeValueForKey:a3];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)CAPortalLayer;
  int v5 = (CA::Transaction *)-[CALayer layerDidBecomeVisible:](&v7, sel_layerDidBecomeVisible_);
  if (!a3)
  {
    v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6) {
      v6 = (CA::Transaction *)CA::Transaction::create(v5);
    }
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0);
  }
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CAPortalLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v27, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (!v7 || (*((unsigned char *)a5 + 2) & 1) == 0) {
    return v7;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  uint64_t v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x40uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    v9[2] = 1;
    v9[3] = 40;
    ++dword_1EB2ADE68;
    *(void *)uint64_t v9 = &unk_1ED02D0D0;
    *((void *)v9 + 3) = 0;
    *((void *)v9 + 4) = 0;
    v9[10] = 0;
    *((void *)v9 + 6) = 0;
    *((void *)v9 + 7) = 0;
  }
  BOOL v11 = [(CAPortalLayer *)self hidesSourceLayer];
  BOOL v12 = [(CAPortalLayer *)self matchesOpacity];
  BOOL v13 = [(CAPortalLayer *)self matchesPosition];
  BOOL v14 = [(CAPortalLayer *)self matchesTransform];
  BOOL v15 = [(CAPortalLayer *)self allowsBackdropGroups];
  BOOL v16 = [(CAPortalLayer *)self crossDisplay];
  BOOL v17 = [(CAPortalLayer *)self allowedInContextTransform];
  int v18 = v11 | 2;
  if (!v12) {
    int v18 = v11;
  }
  if (v13) {
    v18 |= 4u;
  }
  if (v14) {
    v18 |= 8u;
  }
  if (v15) {
    v18 |= 0x10u;
  }
  if (v16) {
    v18 |= 0x20u;
  }
  if (v17) {
    v18 |= 0x80u;
  }
  if (v18) {
    v10[3] |= v18 << 8;
  }
  *((void *)v10 + 3) = CA::Render::Object::render_id((CA::Render::Object *)self->super._attr.layer);
  v19 = [(CAPortalLayer *)self sourceLayer];
  v20 = v19;
  if (v19)
  {
    *((void *)v10 + 4) = CA::Render::Object::render_id((CA::Render::Object *)v19->_attr.layer);
    unsigned int v21 = objc_msgSend(-[CALayer context](v20, "context"), "contextId");
LABEL_23:
    v10[10] = v21;
    goto LABEL_24;
  }
  unint64_t v22 = [(CAPortalLayer *)self sourceLayerRenderId];
  if (v22)
  {
    *((void *)v10 + 4) = v22;
    unsigned int v21 = [(CAPortalLayer *)self sourceContextId];
    goto LABEL_23;
  }
LABEL_24:
  v23 = [(NSDictionary *)[(CAPortalLayer *)self overrides] CA_copyRenderKeyValueArray];
  if (v23)
  {
    v24 = (atomic_uint *)*((void *)v10 + 6);
    if (v24 != v23)
    {
      if (v24 && atomic_fetch_add(v24 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v24 + 16))(v24);
      }
      v25 = v23;
      if (!atomic_fetch_add(v23 + 2, 1u))
      {
        v25 = 0;
        atomic_fetch_add(v23 + 2, 0xFFFFFFFF);
      }
      *((void *)v10 + 6) = v25;
    }
    if (atomic_fetch_add(v23 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v23 + 16))(v23);
    }
  }
  CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
  if (atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(_DWORD *))(*(void *)v10 + 16))(v10);
  }
  return v7;
}

- (CALayer)sourceLayer
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x209u, (const CGAffineTransform *)4, v3);
  return (CALayer *)v3[0];
}

- (BOOL)matchesPosition
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x17Eu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSDictionary)overrides
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1A3u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (BOOL)matchesTransform
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x17Fu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)matchesOpacity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x17Du, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)hidesSourceLayer
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x102u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)crossDisplay
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x97u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)allowsBackdropGroups
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xAu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)allowedInContextTransform
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 9u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setSourceLayer:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x209, (const CGAffineTransform *)4, v3);
}

- (void)setAllowedInContextTransform:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)9, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setOverrides:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1A3, (const CGAffineTransform *)3, v3);
}

- (void)setCrossDisplay:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x97, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xA, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesTransform:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x17F, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesPosition:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x17E, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesOpacity:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x17D, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setHidesSourceLayer:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x102, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setSourceContextId:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x207, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (unsigned)sourceContextId
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x207u, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x20A, (const CGAffineTransform *)0x10, v3);
}

- (unint64_t)sourceLayerRenderId
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x20Au, (const CGAffineTransform *)0x10, v3);
  return (unint64_t)v3[0];
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(10, (uint64_t)&-[CAPortalLayer _renderLayerDefinesProperty:]::atoms, a3) != -1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAPortalLayer;
  return [(CALayer *)&v6 _renderLayerDefinesProperty:v3];
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAPortalLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

@end