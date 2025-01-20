@interface CAEmitterLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)preservesDepth;
- (CAEmitterLayerEmitterMode)emitterMode;
- (CAEmitterLayerEmitterShape)emitterShape;
- (CAEmitterLayerRenderMode)renderMode;
- (CGFloat)emitterDepth;
- (CGFloat)emitterZPosition;
- (CGPath)emitterPath;
- (CGPoint)emitterPosition;
- (CGRect)cullRect;
- (CGSize)emitterSize;
- (NSArray)emitterBehaviors;
- (NSArray)emitterCells;
- (NSArray)emitterRects;
- (double)cullMaxZ;
- (double)cullMinZ;
- (double)updateInterval;
- (float)birthRate;
- (float)emitterDuration;
- (float)lifetime;
- (float)scale;
- (float)spin;
- (float)spinBias;
- (float)velocity;
- (id)implicitAnimationForKeyPath:(id)a3;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (unsigned)seed;
- (void)_colorSpaceDidChange;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)reloadValueForKeyPath:(id)a3;
- (void)setBirthRate:(float)birthRate;
- (void)setCullMaxZ:(double)a3;
- (void)setCullMinZ:(double)a3;
- (void)setCullRect:(CGRect)a3;
- (void)setEmitterBehaviors:(id)a3;
- (void)setEmitterCells:(NSArray *)emitterCells;
- (void)setEmitterDepth:(CGFloat)emitterDepth;
- (void)setEmitterDuration:(float)a3;
- (void)setEmitterMode:(CAEmitterLayerEmitterMode)emitterMode;
- (void)setEmitterPath:(CGPath *)a3;
- (void)setEmitterPosition:(CGPoint)emitterPosition;
- (void)setEmitterRects:(id)a3;
- (void)setEmitterShape:(CAEmitterLayerEmitterShape)emitterShape;
- (void)setEmitterSize:(CGSize)emitterSize;
- (void)setEmitterZPosition:(CGFloat)emitterZPosition;
- (void)setLifetime:(float)lifetime;
- (void)setPreservesDepth:(BOOL)preservesDepth;
- (void)setRenderMode:(CAEmitterLayerRenderMode)renderMode;
- (void)setScale:(float)scale;
- (void)setSeed:(unsigned int)seed;
- (void)setSpin:(float)spin;
- (void)setSpinBias:(float)a3;
- (void)setUpdateInterval:(double)a3;
- (void)setVelocity:(float)velocity;
@end

@implementation CAEmitterLayer

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAEmitterLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setSeed:(unsigned int)seed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = seed;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1EE, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (unsigned)seed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1EEu, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setPreservesDepth:(BOOL)preservesDepth
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = preservesDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1BF, (const CGAffineTransform *)7, (double *)&v3);
}

- (BOOL)preservesDepth
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1BFu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setRenderMode:(CAEmitterLayerRenderMode)renderMode
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = renderMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1D4, (const CGAffineTransform *)3, v3);
}

- (CAEmitterLayerRenderMode)renderMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1D4u, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerRenderMode)v3[0];
}

- (void)setSpin:(float)spin
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = spin;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x210, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)spin
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x210u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setScale:(float)scale
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = scale;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1E6, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)scale
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1E6u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setVelocity:(float)velocity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = velocity;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x24D, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)velocity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x24Du, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setEmitterDepth:(CGFloat)emitterDepth
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = emitterDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCA, (const CGAffineTransform *)0x12, v3);
}

- (CGFloat)emitterDepth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCAu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setEmitterSize:(CGSize)emitterSize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGSize v3 = emitterSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD1, (const CGAffineTransform *)0x14, &v3.width);
}

- (CGSize)emitterSize
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD1u, (const CGAffineTransform *)0x14, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEmitterZPosition:(CGFloat)emitterZPosition
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = emitterZPosition;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD2, (const CGAffineTransform *)0x12, v3);
}

- (CGFloat)emitterZPosition
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD2u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setEmitterPosition:(CGPoint)emitterPosition
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGPoint v3 = emitterPosition;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCE, (const CGAffineTransform *)0x13, &v3.x);
}

- (CGPoint)emitterPosition
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  double v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCEu, (const CGAffineTransform *)0x13, (id *)&v4);
  double v2 = v4;
  double v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEmitterMode:(CAEmitterLayerEmitterMode)emitterMode
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = emitterMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCC, (const CGAffineTransform *)3, v3);
}

- (CAEmitterLayerEmitterMode)emitterMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCCu, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerEmitterMode)v3[0];
}

- (void)setEmitterShape:(CAEmitterLayerEmitterShape)emitterShape
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = emitterShape;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD0, (const CGAffineTransform *)3, v3);
}

- (CAEmitterLayerEmitterShape)emitterShape
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD0u, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerEmitterShape)v3[0];
}

- (void)setLifetime:(float)lifetime
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = lifetime;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15B, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)lifetime
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Bu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setBirthRate:(float)birthRate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = birthRate;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x3D, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)birthRate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x3Du, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setEmitterCells:(NSArray *)emitterCells
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = emitterCells;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC9, (const CGAffineTransform *)3, v3);
}

- (NSArray)emitterCells
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC9u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3
    && ([a4 isEqualToString:@"emitterCells"]
     || [a4 isEqualToString:@"emitterRects"]
     || [a4 isEqualToString:@"emitterBehaviors"]))
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAEmitterLayer;
    return [(CALayer *)&v8 CA_validateValue:a3 forKey:a4];
  }
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(23, (uint64_t)&defines_property::atoms, a3) != -1) {
    return 32;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterLayer;
  return [(CALayer *)&v6 _renderLayerPropertyAnimationFlags:v3];
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(23, (uint64_t)&defines_property::atoms, a3) != -1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterLayer;
  return [(CALayer *)&v6 _renderLayerDefinesProperty:v3];
}

- (void)_colorSpaceDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAEmitterLayer;
  uint64_t v3 = (CA::Transaction *)[(CALayer *)&v5 _colorSpaceDidChange];
  uint64_t v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    uint64_t v4 = (CA::Transaction *)CA::Transaction::create(v3);
  }
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)CAEmitterLayer;
  v68 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v70, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v68)
  {
    if (*((unsigned char *)a5 + 2))
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      uint64_t v7 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xA8uLL, 0x743898A5uLL);
      if (v7)
      {
        objc_super v8 = v7;
        *((_DWORD *)v7 + 2) = 1;
        *((_DWORD *)v7 + 3) = 15;
        ++dword_1EB2ADE04;
        *(void *)uint64_t v7 = &unk_1ED02D270;
        *(_OWORD *)(v7 + 24) = 0u;
        *(_OWORD *)(v7 + 40) = 0u;
        *((void *)v7 + 7) = 0;
        *((void *)v7 + 8) = 0x259000001B4;
        *((_DWORD *)v7 + 18) = 578;
        *(_OWORD *)(v7 + 76) = 0u;
        uint64_t v9 = v7 + 76;
        *((void *)v7 + 20) = 0;
        *(_OWORD *)(v7 + 92) = 0u;
        *(_OWORD *)(v7 + 108) = 0u;
        *(_OWORD *)(v7 + 124) = 0u;
        *(_OWORD *)(v7 + 140) = 0u;
        *((void *)v7 + 2) = self;
        [(CAEmitterLayer *)self birthRate];
        *uint64_t v9 = v10;
        [(CAEmitterLayer *)self lifetime];
        *((_DWORD *)v8 + 20) = v11;
        [(CAEmitterLayer *)self emitterDuration];
        *((_DWORD *)v8 + 21) = v12;
        [(CAEmitterLayer *)self emitterPosition];
        *(float *)&double v13 = v13;
        *(float *)&double v14 = v14;
        *((_DWORD *)v8 + 22) = LODWORD(v13);
        *((_DWORD *)v8 + 23) = LODWORD(v14);
        [(CAEmitterLayer *)self emitterZPosition];
        *(float *)&double v15 = v15;
        *((_DWORD *)v8 + 24) = LODWORD(v15);
        [(CAEmitterLayer *)self emitterSize];
        *(float *)&double v16 = v16;
        *(float *)&double v17 = v17;
        *((_DWORD *)v8 + 25) = LODWORD(v16);
        *((_DWORD *)v8 + 26) = LODWORD(v17);
        [(CAEmitterLayer *)self emitterDepth];
        *(float *)&double v18 = v18;
        *((_DWORD *)v8 + 27) = LODWORD(v18);
        [(CAEmitterLayer *)self velocity];
        *((_DWORD *)v8 + 28) = v19;
        [(CAEmitterLayer *)self scale];
        *((_DWORD *)v8 + 29) = v20;
        [(CAEmitterLayer *)self spin];
        *((_DWORD *)v8 + 30) = v21;
        [(CAEmitterLayer *)self spinBias];
        *((_DWORD *)v8 + 31) = v22;
        [(CAEmitterLayer *)self cullRect];
        double x = v77.origin.x;
        double y = v77.origin.y;
        double width = v77.size.width;
        double height = v77.size.height;
        if (CGRectIsInfinite(v77))
        {
          float v27 = INFINITY;
          float v28 = -INFINITY;
          float v29 = -INFINITY;
          float v30 = INFINITY;
        }
        else
        {
          float v28 = x;
          float v29 = y;
          float v27 = x + width;
          float v30 = y + height;
        }
        *((float *)v8 + 32) = v28;
        *((float *)v8 + 33) = v29;
        *((float *)v8 + 34) = v27;
        *((float *)v8 + 35) = v30;
        [(CAEmitterLayer *)self cullMinZ];
        *(float *)&double v31 = v31;
        *((_DWORD *)v8 + 36) = LODWORD(v31);
        [(CAEmitterLayer *)self cullMaxZ];
        *(float *)&double v32 = v32;
        *((_DWORD *)v8 + 37) = LODWORD(v32);
        v33 = [(CAEmitterLayer *)self emitterCells];
        if (v33)
        {
          v34 = CA::Render::copy_render_array((const __CFArray *)v33, 14);
          v35 = (atomic_uint *)*((void *)v8 + 4);
          if (v35 != v34)
          {
            if (v35 && atomic_fetch_add(v35 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v35 + 16))(v35);
            }
            if (v34)
            {
              v36 = v34;
              if (!atomic_fetch_add(v34 + 2, 1u))
              {
                v36 = 0;
                atomic_fetch_add(v34 + 2, 0xFFFFFFFF);
              }
            }
            else
            {
              v36 = 0;
            }
            *((void *)v8 + 4) = v36;
          }
          if (v34 && atomic_fetch_add(v34 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v34 + 16))(v34);
          }
        }
        v37 = [(CAEmitterLayer *)self emitterBehaviors];
        if (v37)
        {
          v38 = CA::Render::copy_render_array((const __CFArray *)v37, 13);
          v39 = (atomic_uint *)*((void *)v8 + 5);
          if (v39 != v38)
          {
            if (v39 && atomic_fetch_add(v39 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v39 + 16))(v39);
            }
            if (v38)
            {
              v40 = v38;
              if (!atomic_fetch_add(v38 + 2, 1u))
              {
                v40 = 0;
                atomic_fetch_add(v38 + 2, 0xFFFFFFFF);
              }
            }
            else
            {
              v40 = 0;
            }
            *((void *)v8 + 5) = v40;
          }
          if (v38 && atomic_fetch_add(v38 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v38 + 16))(v38);
          }
        }
        v41 = [(CAEmitterLayer *)self emitterPath];
        if (v41)
        {
          v43 = CA::Render::Path::new_path(v41, v42);
          if (v43)
          {
            v44 = v43;
            v45 = (atomic_uint *)*((void *)v8 + 6);
            *((void *)v8 + 6) = v44;
            if (v45)
            {
              if (atomic_fetch_add(v45 + 2, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v45 + 16))(v45);
              }
            }
          }
        }
        v46 = [(CAEmitterLayer *)self emitterRects];
        v47 = v46;
        if (v46)
        {
          uint64_t v48 = [(NSArray *)v46 count];
          v67 = CA::Render::Vector::new_vector((CA::Render::Vector *)(5 * v48), 0, v49);
          if (v67)
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            uint64_t v50 = [(NSArray *)v47 countByEnumeratingWithState:&v72 objects:v71 count:16];
            if (v50)
            {
              uint64_t v51 = 0;
              uint64_t v52 = *(void *)v73;
              uint64_t v53 = (uint64_t)&v67[8 * v48 + 6];
              double v54 = 0.0;
              do
              {
                uint64_t v55 = 0;
                v56 = (double *)&v67[8 * v51 + 12];
                do
                {
                  if (*(void *)v73 != v52) {
                    objc_enumerationMutation(v47);
                  }
                  [*(id *)(*((void *)&v72 + 1) + 8 * v55) rectValue];
                  double v54 = v54 + v57 * v58;
                  *((void *)v56 - 3) = v59;
                  *((void *)v56 - 2) = v60;
                  *(v56 - 1) = v57;
                  double *v56 = v58;
                  *(double *)(v53 + 8 * v51 + 8 * v55++) = v54;
                  v56 += 4;
                }
                while (v50 != v55);
                uint64_t v50 = [(NSArray *)v47 countByEnumeratingWithState:&v72 objects:v71 count:16];
                v51 += v55;
              }
              while (v50);
            }
            v61 = (atomic_uint *)*((void *)v8 + 7);
            *((void *)v8 + 7) = v67;
            if (v61 && atomic_fetch_add(v61 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v61 + 16))(v61);
            }
          }
        }
        CFStringRef v62 = [(CAEmitterLayer *)self emitterShape];
        if (v62) {
          *((_DWORD *)v8 + 16) = CAInternAtom(v62, 0);
        }
        CFStringRef v63 = [(CAEmitterLayer *)self emitterMode];
        if (v63) {
          *((_DWORD *)v8 + 17) = CAInternAtom(v63, 0);
        }
        CFStringRef v64 = [(CAEmitterLayer *)self renderMode];
        if (v64) {
          *((_DWORD *)v8 + 18) = CAInternAtom(v64, 0);
        }
        if ([(CAEmitterLayer *)self preservesDepth]) {
          *((_DWORD *)v8 + 3) |= 0x100u;
        }
        *((_DWORD *)v8 + 38) = [(CAEmitterLayer *)self seed];
        [(CAEmitterLayer *)self updateInterval];
        *((void *)v8 + 20) = v65;
        CA::Render::Layer::set_subclass((uint64_t)v68, (CA::Render::LayerSubclass *)v8);
        if (atomic_fetch_add((atomic_uint *volatile)v8 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(char *))(*(void *)v8 + 16))(v8);
        }
      }
    }
  }
  return v68;
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)CAEmitterLayer;
  id result = -[CALayer implicitAnimationForKeyPath:](&v9, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    uint64_t v6 = [a3 rangeOfString:@"."];
    if (v7)
    {
      unsigned int v8 = 0;
      if ((CAInternAtom((const __CFString *)[a3 substringToIndex:v6], 0) & 0xFFFFFFFE) != 0xC8) {
        return 0;
      }
    }
    else
    {
      unsigned int v8 = CAInternAtom((const __CFString *)a3, 0);
      if (CAAtomIndexInArray(14, (uint64_t)&-[CAEmitterLayer implicitAnimationForKeyPath:]::atoms, v8) == -1) {
        return 0;
      }
    }
    return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v8);
  }
  return result;
}

- (void)reloadValueForKeyPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 rangeOfString:@"."];
  id v6 = a3;
  if (v7) {
    id v6 = (id)[a3 substringToIndex:v5];
  }
  uint64_t v8 = [v6 isEqualToString:@"emitterCells"];
  if ((v8 & 1) != 0 || (uint64_t v8 = [v6 isEqualToString:@"emitterBehaviors"], v8))
  {
    objc_super v9 = CA::Transaction::ensure_compat((CA::Transaction *)v8);
    layer = (CA::Layer *)self->super._attr.layer;
    CA::Layer::set_commit_needed(layer, v9, 0x10000);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CAEmitterLayer;
    [(CALayer *)&v11 reloadValueForKeyPath:a3];
  }
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  id v6 = (CA::Transaction *)CAAtomIndexInArray(24, (uint64_t)&-[CAEmitterLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    uint64_t v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAEmitterLayer;
  [(CAEmitterLayer *)&v8 didChangeValueForKey:a3];
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 207)
  {
    if (v5 > 485)
    {
      if (v5 != 486 && v5 != 528 && v5 != 589) {
        goto LABEL_30;
      }
    }
    else
    {
      if (v5 == 208) {
        return @"point";
      }
      if (v5 != 347)
      {
        if (v5 == 468) {
          return @"unordered";
        }
        goto LABEL_30;
      }
    }
    goto LABEL_19;
  }
  if (v5 <= 157)
  {
    if (v5 != 61)
    {
      if (v5 == 156)
      {
        id v6 = NSNumber;
        double v7 = INFINITY;
        goto LABEL_23;
      }
      if (v5 == 157)
      {
        id v6 = NSNumber;
        double v7 = -INFINITY;
LABEL_23:
        return (id)[v6 numberWithDouble:v7];
      }
LABEL_30:
      v15.receiver = a1;
      v15.super_class = (Class)&OBJC_METACLASS___CAEmitterLayer;
      return objc_msgSendSuper2(&v15, sel_defaultValueForKey_, a3);
    }
    goto LABEL_19;
  }
  if (v5 != 158)
  {
    if (v5 != 203)
    {
      if (v5 == 204) {
        return @"volume";
      }
      goto LABEL_30;
    }
LABEL_19:
    uint64_t v9 = NSNumber;
    return (id)[v9 numberWithInt:1];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F29238];
  double v11 = *MEMORY[0x1E4F1DB10];
  double v12 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 24);

  return (id)objc_msgSend(v10, "valueWithRect:", v11, v12, v13, v14);
}

- (void)setCullMaxZ:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9C, (const CGAffineTransform *)0x12, v3);
}

- (double)cullMaxZ
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x9Cu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setCullMinZ:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9D, (const CGAffineTransform *)0x12, v3);
}

- (double)cullMinZ
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x9Du, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setCullRect:(CGRect)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGRect v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9E, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (CGRect)cullRect
{
  double v2 = CALayer_getter_kCAValueRect((CA::Transaction *)self->super._attr.layer, 0x9Eu);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setSpinBias:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x211, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)spinBias
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x211u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setUpdateInterval:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x244, (const CGAffineTransform *)0x12, v3);
}

- (double)updateInterval
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x244u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setEmitterDuration:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCB, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)emitterDuration
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCBu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setEmitterBehaviors:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC8, (const CGAffineTransform *)3, v3);
}

- (NSArray)emitterBehaviors
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC8u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterRects:(id)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCF, (const CGAffineTransform *)3, v3);
}

- (NSArray)emitterRects
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCFu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CGPath)emitterPath
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCDu, (const CGAffineTransform *)2, v3);
  return (CGPath *)v3[0];
}

- (void)setEmitterPath:(CGPath *)a3
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    double v5 = (const CGPath *)MEMORY[0x1853223C0](a3);
    *(void *)&v6[0] = v5;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCD, (const CGAffineTransform *)2, v6);
    CGPathRelease(v5);
  }
  else
  {
    *(void *)&v6[0] = a3;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCD, (const CGAffineTransform *)2, v6);
  }
}

@end