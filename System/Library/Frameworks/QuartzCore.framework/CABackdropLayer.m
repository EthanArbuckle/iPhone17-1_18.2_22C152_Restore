@interface CABackdropLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)allowsInPlaceFiltering;
- (BOOL)captureOnly;
- (BOOL)disablesOccludedBackdropBlurs;
- (BOOL)ignoresScreenClip;
- (BOOL)isEnabled;
- (BOOL)preallocatesScreenArea;
- (BOOL)reducesCaptureBitDepth;
- (BOOL)tracksLuma;
- (BOOL)usesGlobalGroupNamespace;
- (CGRect)backdropRect;
- (NSString)groupName;
- (NSString)groupNamespace;
- (double)marginWidth;
- (double)scale;
- (double)zoom;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setAllowsInPlaceFiltering:(BOOL)a3;
- (void)setBackdropRect:(CGRect)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setDisablesOccludedBackdropBlurs:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNamespace:(id)a3;
- (void)setIgnoresScreenClip:(BOOL)a3;
- (void)setMarginWidth:(double)a3;
- (void)setPreallocatesScreenArea:(BOOL)a3;
- (void)setReducesCaptureBitDepth:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setTracksLuma:(BOOL)a3;
- (void)setUsesGlobalGroupNamespace:(BOOL)a3;
- (void)setZoom:(double)a3;
@end

@implementation CABackdropLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(13, (uint64_t)&-[CABackdropLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CABackdropLayer;
  [(CABackdropLayer *)&v8 didChangeValueForKey:a3];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CABackdropLayer;
  -[CALayer layerDidBecomeVisible:](&v23, sel_layerDidBecomeVisible_);
  os_unfair_lock_lock(&_all_backdrops_lock);
  uint64_t v5 = _all_backdrops;
  if (!_all_backdrops) {
    operator new();
  }
  v7 = (uint64_t **)(_all_backdrops + 8);
  v6 = *(uint64_t **)(_all_backdrops + 8);
  if (v3)
  {
    objc_super v8 = (uint64_t *)(_all_backdrops + 8);
    if (v6)
    {
      while (1)
      {
        while (1)
        {
          objc_super v8 = v6;
          unint64_t v9 = v6[4];
          if (v9 <= (unint64_t)self) {
            break;
          }
          v6 = (uint64_t *)*v6;
          v7 = (uint64_t **)v8;
          if (!*v8) {
            goto LABEL_10;
          }
        }
        if (v9 >= (unint64_t)self) {
          break;
        }
        v6 = (uint64_t *)v6[1];
        if (!v6)
        {
          v7 = (uint64_t **)(v8 + 1);
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v10 = (uint64_t *)operator new(0x28uLL);
      v10[4] = (uint64_t)self;
      uint64_t *v10 = 0;
      v10[1] = 0;
      v10[2] = (uint64_t)v8;
      CA::Transaction *v7 = v10;
      uint64_t v11 = **(void **)v5;
      if (v11)
      {
        *(void *)uint64_t v5 = v11;
        v10 = *v7;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v5 + 8), v10);
      ++*(void *)(v5 + 16);
    }
    os_unfair_lock_unlock(&_all_backdrops_lock);
  }
  else
  {
    if (v6)
    {
      v12 = (uint64_t *)(_all_backdrops + 8);
      v13 = *(void **)(_all_backdrops + 8);
      do
      {
        unint64_t v14 = v13[4];
        BOOL v15 = v14 >= (unint64_t)self;
        if (v14 >= (unint64_t)self) {
          v16 = v13;
        }
        else {
          v16 = v13 + 1;
        }
        if (v15) {
          v12 = v13;
        }
        v13 = (void *)*v16;
      }
      while (*v16);
      if (v12 != (uint64_t *)v7 && v12[4] <= (unint64_t)self)
      {
        v17 = (uint64_t *)v12[1];
        if (v17)
        {
          do
          {
            v18 = v17;
            v17 = (uint64_t *)*v17;
          }
          while (v17);
        }
        else
        {
          v19 = v12;
          do
          {
            v18 = (uint64_t *)v19[2];
            BOOL v20 = *v18 == (void)v19;
            v19 = v18;
          }
          while (!v20);
        }
        if (*(uint64_t **)_all_backdrops == v12) {
          *(void *)_all_backdrops = v18;
        }
        --*(void *)(v5 + 16);
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, v12);
        operator delete(v12);
      }
    }
    os_unfair_lock_unlock(&_all_backdrops_lock);
    v22 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v22) {
      v22 = (CA::Transaction *)CA::Transaction::create(v21);
    }
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v22, 0);
  }
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 252)
  {
    if (v5 == 253) {
      return @"owningContext";
    }
    if (v5 != 486) {
      goto LABEL_16;
    }
    objc_super v8 = NSNumber;
    return (id)[v8 numberWithInt:1];
  }
  else
  {
    if (v5 != 53)
    {
      if (v5 == 212)
      {
        v6 = NSNumber;
        return (id)[v6 numberWithBool:1];
      }
LABEL_16:
      v14.receiver = a1;
      v14.super_class = (Class)&OBJC_METACLASS___CABackdropLayer;
      return objc_msgSendSuper2(&v14, sel_defaultValueForKey_, a3);
    }
    unint64_t v9 = (void *)MEMORY[0x1E4F29238];
    double v10 = *MEMORY[0x1E4F28AD8];
    double v11 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
    return (id)objc_msgSend(v9, "valueWithRect:", v10, v11, v12, v13);
  }
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CABackdropLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)CABackdropLayer;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v42, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (!v7 || (*((unsigned char *)a5 + 2) & 1) == 0) {
    return v7;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  unint64_t v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x60uLL, 0x743898A5uLL);
  double v10 = v9;
  if (v9)
  {
    v9[2] = 1;
    v9[3] = 3;
    ++dword_1EB2ADDD4;
    *(void *)unint64_t v9 = &unk_1ED02D828;
    *((void *)v9 + 2) = 0;
    *((void *)v9 + 3) = 0;
    *((void *)v9 + 4) = 1065353216;
    v9[10] = 0;
    *((void *)v9 + 11) = 0;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((unsigned char *)v9 + 80) = 0;
  }
  BOOL v11 = [(CABackdropLayer *)self isEnabled];
  BOOL v12 = [(CABackdropLayer *)self captureOnly];
  BOOL v13 = [(CABackdropLayer *)self reducesCaptureBitDepth];
  BOOL v14 = [(CABackdropLayer *)self ignoresScreenClip];
  BOOL v15 = [(CABackdropLayer *)self preallocatesScreenArea];
  int v16 = v11 | 0x10;
  if (!v12) {
    int v16 = v11;
  }
  if (v13) {
    v16 |= 0x20u;
  }
  if (v14) {
    v16 |= 0x100u;
  }
  if (v15) {
    int v17 = v16 | 0x200;
  }
  else {
    int v17 = v16;
  }
  if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1) {
    dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_13615);
  }
  v18 = (char *)self + CA::Render::_render_id_slide;
  if (!self) {
    v18 = 0;
  }
  *((void *)v10 + 2) = v18;
  [(CABackdropLayer *)self scale];
  *(float *)&double v19 = v19;
  v10[8] = LODWORD(v19);
  [(CABackdropLayer *)self backdropRect];
  *(double *)v23.i64 = v22;
  v23.i64[1] = v20;
  v24.f64[0] = 0.0;
  v26.i64[0] = *(void *)&v25.f64[0];
  v26.i64[1] = v21;
  int8x16_t v27 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v24, v25).i64[0], 0);
  v28.i64[1] = v20;
  *(double *)v28.i64 = v25.f64[0] + v22;
  int8x16_t v29 = vbslq_s8(v27, v28, v23);
  v23.i64[1] = v21;
  *(double *)v23.i64 = -v25.f64[0];
  int8x16_t v30 = vbslq_s8(v27, v23, v26);
  if (*(double *)&v21 < 0.0)
  {
    *(double *)&v29.i64[1] = *(double *)&v21 + *(double *)&v20;
    *(double *)&v30.i64[1] = -*(double *)&v21;
  }
  *((int8x16_t *)v10 + 3) = v29;
  *((int8x16_t *)v10 + 4) = v30;
  [(CABackdropLayer *)self zoom];
  *(float *)&double v31 = v31;
  v10[10] = LODWORD(v31);
  [(CABackdropLayer *)self marginWidth];
  *(float *)&double v32 = v32;
  v10[9] = LODWORD(v32);
  if ((__CFString *)[(CABackdropLayer *)self groupNamespace] != @"owningContext")
  {
    if ([(NSString *)[(CABackdropLayer *)self groupNamespace] isEqualToString:@"global"])
    {
      char v41 = 2;
    }
    else
    {
      if (![(NSString *)[(CABackdropLayer *)self groupNamespace] isEqualToString:@"hostingNamespacedContext"])goto LABEL_21; {
      char v41 = 1;
      }
    }
    *((unsigned char *)v10 + 80) = v41;
  }
LABEL_21:
  if ([(CABackdropLayer *)self allowsInPlaceFiltering])
  {
    v17 |= 2u;
  }
  else
  {
    CFStringRef v33 = [(CABackdropLayer *)self groupName];
    if (v33)
    {
      v35 = CA::Render::String::new_string(v33, v34);
      v36 = (atomic_uint *)*((void *)v10 + 3);
      if (v36 != v35)
      {
        if (v36 && atomic_fetch_add(v36 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v36 + 16))(v36);
        }
        if (v35)
        {
          v37 = v35;
          if (!atomic_fetch_add(v35 + 2, 1u))
          {
            v37 = 0;
            atomic_fetch_add(v35 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v37 = 0;
        }
        *((void *)v10 + 3) = v37;
      }
      if (v35 && atomic_fetch_add(v35 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v35 + 16))(v35);
      }
    }
  }
  BOOL v38 = [(CABackdropLayer *)self tracksLuma];
  int v39 = v17 | 4;
  if (!v38) {
    int v39 = v17;
  }
  if (v39) {
    v10[3] |= v39 << 8;
  }
  CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v10);
  if (atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(_DWORD *))(*(void *)v10 + 16))(v10);
  }
  return v7;
}

- (BOOL)tracksLuma
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x237u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)scale
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1E6u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)reducesCaptureBitDepth
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1CFu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSString)groupName
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xFCu, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (double)zoom
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x268u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)preallocatesScreenArea
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B7u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)marginWidth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x177u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)isEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD4u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)ignoresScreenClip
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x10Du, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSString)groupNamespace
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xFDu, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (BOOL)captureOnly
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x52u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (CGRect)backdropRect
{
  double v2 = CALayer_getter_kCAValueRect((CA::Transaction *)self->super._attr.layer, 0x35u);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)allowsInPlaceFiltering
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x12u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(13, (uint64_t)&-[CABackdropLayer _renderLayerDefinesProperty:]::atoms, a3) != -1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CABackdropLayer;
  return [(CALayer *)&v6 _renderLayerDefinesProperty:v3];
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3 = 0;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  while ((unsigned __int16)-[CABackdropLayer _renderLayerPropertyAnimationFlags:]::atoms[v3] != a3)
  {
    if (++v3 == 4)
    {
      v5.receiver = self;
      v5.super_class = (Class)CABackdropLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (void)setScale:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1E6, (const CGAffineTransform *)0x12, v3);
}

- (void)setGroupName:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xFC, (const CGAffineTransform *)3, v3);
}

- (void)setGroupNamespace:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xFD, (const CGAffineTransform *)3, v3);
}

- (void)setTracksLuma:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x237, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAllowsInPlaceFiltering:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x12, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD4, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setCaptureOnly:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x52, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setDisablesOccludedBackdropBlurs:(BOOL)a3
{
  self->_disablesOccludedBackdropBlurs = a3;
}

- (BOOL)disablesOccludedBackdropBlurs
{
  return self->_disablesOccludedBackdropBlurs;
}

- (void)setPreallocatesScreenArea:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B7, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x10D, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setReducesCaptureBitDepth:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1CF, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMarginWidth:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x177, (const CGAffineTransform *)0x12, v3);
}

- (void)setZoom:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x268, (const CGAffineTransform *)0x12, v3);
}

- (void)setBackdropRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x35, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (BOOL)usesGlobalGroupNamespace
{
  double v2 = [(CABackdropLayer *)self groupNamespace];

  return [(NSString *)v2 isEqualToString:@"global"];
}

- (void)setUsesGlobalGroupNamespace:(BOOL)a3
{
}

@end