@interface CAReplicatorLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)preservesDepth;
- (CAReplicatorLayer)init;
- (CATransform3D)instanceTransform;
- (CFTimeInterval)instanceDelay;
- (CGColorRef)instanceColor;
- (NSInteger)instanceCount;
- (float)instanceAlphaOffset;
- (float)instanceBlueOffset;
- (float)instanceGreenOffset;
- (float)instanceRedOffset;
- (id)implicitAnimationForKeyPath:(id)a3;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)_renderSublayersInContext:(CGContext *)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)setInstanceAlphaOffset:(float)instanceAlphaOffset;
- (void)setInstanceBlueOffset:(float)instanceBlueOffset;
- (void)setInstanceColor:(CGColorRef)instanceColor;
- (void)setInstanceCount:(NSInteger)instanceCount;
- (void)setInstanceDelay:(CFTimeInterval)instanceDelay;
- (void)setInstanceGreenOffset:(float)instanceGreenOffset;
- (void)setInstanceRedOffset:(float)instanceRedOffset;
- (void)setInstanceTransform:(CATransform3D *)instanceTransform;
- (void)setPreservesDepth:(BOOL)preservesDepth;
@end

@implementation CAReplicatorLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  int v6 = (int)v5;
  uint64_t v7 = 0;
  while (v5 != (unsigned __int16)-[CAReplicatorLayer didChangeValueForKey:]::atoms[v7])
  {
    if (++v7 == 9) {
      goto LABEL_6;
    }
  }
  v8 = CA::Transaction::ensure_compat(v5);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v8, 0x10000);
LABEL_6:
  if (v6 == 447)
  {
    BOOL v9 = [(CAReplicatorLayer *)self preservesDepth];
    v10 = (atomic_uint *)((char *)self->super._attr.layer + 4);
    if (v9) {
      atomic_fetch_or(v10, 0x10000u);
    }
    else {
      atomic_fetch_and(v10, 0xFFFEFFFF);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CAReplicatorLayer;
  [(CAReplicatorLayer *)&v11 didChangeValueForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 325)
  {
    id result = (id)+[CAReplicatorLayer defaultValueForKey:]::white;
    if (!+[CAReplicatorLayer defaultValueForKey:]::white)
    {
      v8 = (CGColorSpace *)CAGetColorSpace(0x1Du);
      id result = CGColorCreate(v8, +[CAReplicatorLayer defaultValueForKey:]::values);
      +[CAReplicatorLayer defaultValueForKey:]::white = (uint64_t)result;
    }
  }
  else if (v5 == 326)
  {
    int v6 = NSNumber;
    return (id)[v6 numberWithInt:1];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___CAReplicatorLayer;
    return objc_msgSendSuper2(&v9, sel_defaultValueForKey_, a3);
  }
  return result;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAReplicatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 - 323 < 8) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CAReplicatorLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a3 - 323 < 8) {
    return dword_1849A7E34[a3 - 323];
  }
  v4.receiver = self;
  v4.super_class = (Class)CAReplicatorLayer;
  return -[CALayer _renderLayerPropertyAnimationFlags:](&v4, sel__renderLayerPropertyAnimationFlags_);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (void)setInstanceTransform:(CATransform3D *)instanceTransform
{
}

- (void)setInstanceCount:(NSInteger)instanceCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v3 = instanceCount;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x146, (const CGAffineTransform *)0xB, (double *)&v3);
}

- (CAReplicatorLayer)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAReplicatorLayer;
  v2 = [(CALayer *)&v5 init];
  int v3 = v2;
  if (v2 && [(CAReplicatorLayer *)v2 preservesDepth]) {
    atomic_fetch_or((atomic_uint *volatile)v3->super._attr.layer + 1, 0x10000u);
  }
  return v3;
}

- (BOOL)preservesDepth
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1BFu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setInstanceAlphaOffset:(float)instanceAlphaOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = instanceAlphaOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x143, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)CAReplicatorLayer;
  id v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v39, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v8)
  {
    if (*((unsigned char *)a5 + 2))
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      uint64_t v10 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x48uLL, 0x743898A5uLL);
      if (v10)
      {
        uint64_t v12 = v10;
        *((_DWORD *)v10 + 2) = 1;
        ++dword_1EB2ADE78;
        *(void *)uint64_t v10 = &unk_1ED02E208;
        *(void *)(v10 + 12) = 0x10000002CLL;
        long long v40 = xmmword_184997D50;
        float64x2_t v41 = 0u;
        long long v42 = xmmword_184997D60;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = xmmword_184997D50;
        long long v46 = 0u;
        long long v47 = xmmword_184997D60;
        *((void *)v10 + 3) = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, &v40, v11);
        *((_OWORD *)v12 + 2) = xmmword_1849985B0;
        *((_DWORD *)v12 + 12) = 1065353216;
        *(void *)(v12 + 60) = 0;
        *(void *)(v12 + 52) = 0;
        *((_DWORD *)v12 + 4) = [(CAReplicatorLayer *)self instanceCount];
        [(CAReplicatorLayer *)self instanceDelay];
        *(float *)&double v14 = v14;
        *((_DWORD *)v12 + 8) = LODWORD(v14);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        float64x2_t v31 = 0u;
        float64x2_t v32 = 0u;
        if (self && ([(CAReplicatorLayer *)self instanceTransform], v31.f64[0] == 1.0))
        {
          uint64_t v18 = 1;
          while (v18 != 16)
          {
            uint64_t v19 = v18;
            double v20 = v31.f64[v18];
            double v21 = *(&CATransform3DIdentity.m11 + v18++);
            if (v20 != v21)
            {
              if ((unint64_t)(v19 - 1) <= 0xE) {
                goto LABEL_6;
              }
              break;
            }
          }
        }
        else
        {
LABEL_6:
          long long v40 = (__int128)v31;
          float64x2_t v41 = v32;
          long long v42 = v33;
          long long v43 = v34;
          long long v44 = v35;
          long long v45 = v36;
          long long v46 = v37;
          long long v47 = v38;
          v15 = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, &v40, v13);
          v16 = (atomic_uint *)*((void *)v12 + 3);
          if (v16 != v15)
          {
            if (v16 && atomic_fetch_add(v16 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v16 + 16))(v16);
            }
            if (v15)
            {
              v17 = v15;
              if (!atomic_fetch_add(v15 + 2, 1u))
              {
                v17 = 0;
                atomic_fetch_add(v15 + 2, 0xFFFFFFFF);
              }
            }
            else
            {
              v17 = 0;
            }
            *((void *)v12 + 3) = v17;
          }
          if (v15 && atomic_fetch_add(v15 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v15 + 16))(v15);
          }
        }
        v22 = [(CAReplicatorLayer *)self instanceColor];
        if (v22)
        {
          v24 = v22;
          v25 = (CGColorSpace *)CA::Context::current_colorspace((CA::Context *)a3, v23);
          long long v40 = 0u;
          float64x2_t v41 = 0u;
          CA_CGColorGetRGBComponents(v24, v25, (CGFloat *)&v40);
          *(float32x4_t *)(v12 + 36) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v40), v41);
        }
        [(CAReplicatorLayer *)self instanceRedOffset];
        *((_DWORD *)v12 + 13) = v26;
        [(CAReplicatorLayer *)self instanceGreenOffset];
        *((_DWORD *)v12 + 14) = v27;
        [(CAReplicatorLayer *)self instanceBlueOffset];
        *((_DWORD *)v12 + 15) = v28;
        [(CAReplicatorLayer *)self instanceAlphaOffset];
        *((_DWORD *)v12 + 16) = v29;
        CA::Render::Layer::set_subclass((uint64_t)v8, (CA::Render::LayerSubclass *)v12);
        if (atomic_fetch_add((atomic_uint *volatile)v12 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(char *))(*(void *)v12 + 16))(v12);
        }
      }
    }
  }
  return v8;
}

- (float)instanceAlphaOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x143u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CATransform3D)instanceTransform
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x14Au, (const CGAffineTransform *)0x16, (id *)retstr);
  return result;
}

- (float)instanceRedOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x149u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (float)instanceGreenOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x148u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CFTimeInterval)instanceDelay
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x147u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSInteger)instanceCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x146u, (const CGAffineTransform *)0xB, (id *)&v3);
  return v3;
}

- (CGColorRef)instanceColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x145u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (float)instanceBlueOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x144u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setInstanceColor:(CGColorRef)instanceColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = instanceColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x145, (const CGAffineTransform *)2, v3);
}

- (void)setInstanceBlueOffset:(float)instanceBlueOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = instanceBlueOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x144, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceGreenOffset:(float)instanceGreenOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = instanceGreenOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x148, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceRedOffset:(float)instanceRedOffset
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = instanceRedOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x149, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceDelay:(CFTimeInterval)instanceDelay
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = instanceDelay;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x147, (const CGAffineTransform *)0x12, v3);
}

- (void)setPreservesDepth:(BOOL)preservesDepth
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = preservesDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1BF, (const CGAffineTransform *)7, (double *)&v3);
}

- (void)_renderSublayersInContext:(CGContext *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_super v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    objc_super v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  uint64_t v7 = (void *)[(NSArray *)[(CALayer *)self sublayers] copy];
  uint64_t v8 = [v7 count];
  NSInteger v9 = [(CAReplicatorLayer *)self instanceCount];
  long long v10 = 0uLL;
  long long v11 = 0uLL;
  long long v12 = 0uLL;
  long long v13 = 0uLL;
  long long v14 = 0uLL;
  long long v15 = 0uLL;
  long long v16 = 0uLL;
  long long v17 = 0uLL;
  float64x2_t v18 = 0uLL;
  if (self)
  {
    [(CAReplicatorLayer *)self instanceTransform];
    long long v10 = 0uLL;
    float64x2_t v18 = (float64x2_t)v33;
    long long v17 = v34;
    long long v16 = v35;
    long long v15 = v36;
    long long v14 = v37;
    long long v13 = v38;
    long long v12 = v39;
    long long v11 = v40;
  }
  v41[0] = v18;
  v41[1] = v17;
  v41[2] = v16;
  v41[3] = v15;
  v41[4] = v14;
  v41[5] = v13;
  v41[6] = v12;
  v41[7] = v11;
  long long v33 = xmmword_184997D50;
  long long v34 = v10;
  long long v35 = xmmword_184997D60;
  long long v36 = v10;
  long long v37 = v10;
  long long v38 = xmmword_184997D50;
  long long v39 = v10;
  long long v40 = xmmword_184997D60;
  CA::Transaction::unlock(v5);
  CGContextSaveGState(a3);
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (v8)
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          v22 = (uint64_t *)[v7 objectAtIndex:j];
          CGContextSaveGState(a3);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          memset(v26, 0, sizeof(v26));
          CA::Layer::get_frame_transform(v22[2], v26, 0, (const double *)&v33, 0.0, v23, v24);
          *(float64x2_t *)&v25.a = v26[0];
          *(_OWORD *)&v25.c = v27;
          *(_OWORD *)&v25.tx = v31;
          CGContextConcatCTM(a3, &v25);
          [v22 renderInContext:a3];
          CGContextRestoreGState(a3);
        }
      }
      CA::Mat4Impl::mat4_concat((float64x2_t *)&v33, (double *)v41, (const double *)&v33, v19);
    }
  }
  CGContextRestoreGState(a3);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CAReplicatorLayer;
  id result = -[CALayer implicitAnimationForKeyPath:](&v12, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    uint64_t v6 = [a3 rangeOfString:@"."];
    if (!v7)
    {
      unsigned int v10 = CAInternAtom((const __CFString *)a3, 0);
      unsigned int v9 = v10;
      uint64_t v11 = 0;
      while (v10 != (unsigned __int16)-[CAReplicatorLayer implicitAnimationForKeyPath:]::atoms[v11])
      {
        if (++v11 == 8) {
          return 0;
        }
      }
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
    }
    int v8 = CAInternAtom((const __CFString *)[a3 substringToIndex:v6], 0);
    unsigned int v9 = 0;
    if (v8 == 330) {
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
    }
    return 0;
  }
  return result;
}

@end