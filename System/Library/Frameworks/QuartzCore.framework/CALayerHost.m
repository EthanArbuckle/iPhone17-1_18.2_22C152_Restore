@interface CALayerHost
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)allLayerHosts;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (BOOL)asynchronousOpaque;
- (BOOL)inheritsSecurity;
- (BOOL)preservesFlip;
- (BOOL)rendersAsynchronously;
- (BOOL)resizesHostedContext;
- (BOOL)sequestered;
- (BOOL)stopsHitTestTransformAccumulation;
- (BOOL)stopsSecureSuperlayersValidation;
- (BOOL)transformsToScreenSpace;
- (CALayerHost)init;
- (NSArray)asynchronousRenderTimes;
- (double)asynchronousRenderPeriod;
- (float)asynchronousRenderMaxAPL;
- (float)asynchronousRenderMaxAPLStrength;
- (unsigned)contextId;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)dealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setAsynchronousOpaque:(BOOL)a3;
- (void)setAsynchronousRenderMaxAPL:(float)a3;
- (void)setAsynchronousRenderMaxAPLStrength:(float)a3;
- (void)setAsynchronousRenderPeriod:(double)a3;
- (void)setAsynchronousRenderTimes:(id)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setPreservesFlip:(BOOL)a3;
- (void)setRendersAsynchronously:(BOOL)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setSequestered:(BOOL)a3;
- (void)setStopsHitTestTransformAccumulation:(BOOL)a3;
- (void)setStopsSecureSuperlayersValidation:(BOOL)a3;
- (void)setTransformsToScreenSpace:(BOOL)a3;
@end

@implementation CALayerHost

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
  v3 = (CALayerHost **)_all_hosts;
  if (_all_hosts != (_UNKNOWN *)qword_1EB2A83D0)
  {
    while (*v3 != self)
    {
      if (++v3 == (CALayerHost **)qword_1EB2A83D0)
      {
        v3 = (CALayerHost **)qword_1EB2A83D0;
        break;
      }
    }
  }
  if (v3 != (CALayerHost **)qword_1EB2A83D0)
  {
    *v3 = *(CALayerHost **)(qword_1EB2A83D0 - 8);
    if (qword_1EB2A83D0 <= (unint64_t)_all_hosts) {
      __assert_rtn("pop_back", "x-small-vector.h", 410, "_end > _begin && \"pop_back on empty container\"");
    }
    qword_1EB2A83D0 -= 8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  v4.receiver = self;
  v4.super_class = (Class)CALayerHost;
  [(CALayer *)&v4 dealloc];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v5, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)CALayerHost;
  [(CALayer *)&v6 layerDidBecomeVisible:v3];
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  objc_super v6 = (CA::Transaction *)CAAtomIndexInArray(12, (uint64_t)-[CALayerHost didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    uint64_t v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CALayerHost;
  [(CALayerHost *)&v8 didChangeValueForKey:a3];
}

- (void)setAsynchronousRenderMaxAPL:(float)a3
{
  self->_asynchronousRenderMaxAPL = a3;
}

- (void)setAsynchronousRenderPeriod:(double)a3
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x2B, (const CGAffineTransform *)0x12, v3);
}

- (void)setAsynchronousOpaque:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x2A, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CALayerHost;
  id v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v21, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v7 && (*((unsigned char *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    uint64_t v9 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x58uLL, 0x743898A5uLL);
    if (v9)
    {
      unsigned int v10 = [(CALayerHost *)self contextId];
      *((_DWORD *)v9 + 2) = 1;
      *((_DWORD *)v9 + 3) = 30;
      ++dword_1EB2ADE40;
      *(void *)uint64_t v9 = &unk_1ED0300E8;
      *((_DWORD *)v9 + 4) = v10;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 40) = 0u;
      *(_OWORD *)(v9 + 56) = 0u;
      *(_OWORD *)(v9 + 72) = 0u;
    }
    if ([(CALayerHost *)self inheritsSecurity]) {
      *((_DWORD *)v9 + 3) |= 0x200u;
    }
    if ([(CALayerHost *)self rendersAsynchronously]) {
      *((_DWORD *)v9 + 3) |= 0x400u;
    }
    if ([(CALayerHost *)self asynchronousOpaque]) {
      *((_DWORD *)v9 + 3) |= 0x800u;
    }
    v11 = [(CALayerHost *)self asynchronousRenderTimes];
    if ([(NSArray *)v11 count])
    {
      int v12 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v11, "indexOfObject:inSortedRange:options:usingComparator:", [NSNumber numberWithLongLong:mach_continuous_time()], 0, -[NSArray count](v11, "count"), 1024, &__block_literal_global_17985);
      int v13 = [(NSArray *)v11 count] - v12;
      uint64_t v14 = v13;
      std::vector<unsigned long long>::resize((char **)v9 + 5, v13);
      if (v13 >= 1)
      {
        uint64_t v15 = 0;
        v16 = (void *)*((void *)v9 + 5);
        uint64_t v17 = -v14;
        do
          *v16++ = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", -[NSArray count](v11, "count") + v15-- - 1), "unsignedLongLongValue");
        while (v17 != v15);
      }
    }
    [(CALayerHost *)self asynchronousRenderPeriod];
    if (v18 >= 0.0)
    {
      [(CALayerHost *)self asynchronousRenderPeriod];
      *((void *)v9 + 8) = v19;
    }
    if ([(CALayerHost *)self preservesFlip]) {
      *((_DWORD *)v9 + 3) |= 0x100u;
    }
    if ([(CALayerHost *)self resizesHostedContext]) {
      *((_DWORD *)v9 + 3) |= 0x1000u;
    }
    if ([(CALayerHost *)self transformsToScreenSpace]) {
      *((_DWORD *)v9 + 3) |= 0x4000u;
    }
    if ([(CALayerHost *)self sequestered]) {
      *((_DWORD *)v9 + 3) |= 0x8000u;
    }
    if ([(CALayerHost *)self stopsHitTestTransformAccumulation]) {
      *((_DWORD *)v9 + 3) |= 0x2000u;
    }
    if ([(CALayerHost *)self stopsSecureSuperlayersValidation])
    {
      *((_DWORD *)v9 + 3) |= 0x10000u;
      CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v9);
    }
    else
    {
      CA::Render::Layer::set_subclass((uint64_t)v7, (CA::Render::LayerSubclass *)v9);
      if (!v9) {
        return v7;
      }
    }
    if (atomic_fetch_add((atomic_uint *volatile)v9 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(char *))(*(void *)v9 + 16))(v9);
    }
  }
  return v7;
}

- (BOOL)rendersAsynchronously
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1D3u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)asynchronousRenderPeriod
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x2Bu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)sequestered
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1F4u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)inheritsSecurity
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x10Eu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)transformsToScreenSpace
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x239u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)resizesHostedContext
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1DAu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)asynchronousOpaque
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x2Au, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSArray)asynchronousRenderTimes
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x2Cu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (BOOL)stopsSecureSuperlayersValidation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x21Cu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x21Bu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)preservesFlip
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C0u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (unsigned)contextId
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x8Cu, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x21C, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x21B, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setResizesHostedContext:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1DA, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setInheritsSecurity:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x10E, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAsynchronousRenderTimes:(id)a3
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  if ((unint64_t)[a3 count] >= 0x401)
  {
    NSLog(&cfstr_CoreanimationA.isa);
  }
  else
  {
    *(void *)&v5[0] = a3;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x2C, (const CGAffineTransform *)3, v5);
  }
}

- (void)setContextId:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x8C, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (CALayerHost)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CALayerHost;
  v2 = [(CALayer *)&v18 init];
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
    uint64_t v4 = _all_hosts;
    unsigned int v3 = (CALayerHost **)qword_1EB2A83D0;
    uint64_t v5 = (qword_1EB2A83D0 - (uint64_t)_all_hosts) >> 3;
    if (qword_1EB2A83E0 < (unint64_t)(v5 + 1))
    {
      uint64_t v6 = qword_1EB2A83D8;
      unint64_t v7 = (qword_1EB2A83E0 + 1) | ((unint64_t)(qword_1EB2A83E0 + 1) >> 1) | (((qword_1EB2A83E0 + 1) | ((unint64_t)(qword_1EB2A83E0 + 1) >> 1)) >> 2);
      unint64_t v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
      unint64_t v9 = v8 | (v8 >> 16) | ((v8 | (v8 >> 16)) >> 32);
      if (v9 + 1 > v5 + 1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v5 + 1;
      }
      v11 = (char *)malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
      int v12 = v11;
      int v13 = (uint64_t *)_all_hosts;
      uint64_t v14 = qword_1EB2A83D0;
      if (_all_hosts != (_UNKNOWN *)qword_1EB2A83D0)
      {
        uint64_t v15 = v11;
        do
        {
          uint64_t v16 = *v13++;
          *(void *)uint64_t v15 = v16;
          v15 += 8;
        }
        while (v13 != (uint64_t *)v14);
      }
      if (v4 != (void *)v6) {
        free(_all_hosts);
      }
      unsigned int v3 = (CALayerHost **)&v12[8 * v5];
      _all_hosts = v12;
      qword_1EB2A83D0 = (uint64_t)v3;
      qword_1EB2A83E0 = v10;
    }
    *unsigned int v3 = v2;
    qword_1EB2A83D0 += 8;
    os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  }
  return v2;
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1D3, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAsynchronousRenderMaxAPLStrength:(float)a3
{
  self->_asynchronousRenderMaxAPLStrength = a3;
}

- (float)asynchronousRenderMaxAPLStrength
{
  return self->_asynchronousRenderMaxAPLStrength;
}

- (float)asynchronousRenderMaxAPL
{
  return self->_asynchronousRenderMaxAPL;
}

- (void)setSequestered:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1F4, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setTransformsToScreenSpace:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x239, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setPreservesFlip:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C0, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(12, (uint64_t)-[CALayerHost _renderLayerDefinesProperty:]::atoms, a3) != -1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CALayerHost;
  return [(CALayer *)&v6 _renderLayerDefinesProperty:v3];
}

uint64_t __55__CALayerHost__copyRenderLayer_layerFlags_commitFlags___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CALayerHost;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (id)allLayerHosts
{
  os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  return v2;
}

@end