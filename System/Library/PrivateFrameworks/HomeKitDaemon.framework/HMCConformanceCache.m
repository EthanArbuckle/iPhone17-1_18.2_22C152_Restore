@interface HMCConformanceCache
- (BOOL)classConforms:(Class)a3;
- (BOOL)objectConforms:(id)a3;
- (HMCConformanceCache)initWithProtocol:(id)a3;
- (HMCConformanceCache)initWithProtocols:(id)a3;
- (void)refreshConformanceOf:(Class)a3;
@end

@implementation HMCConformanceCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conformanceCache, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
}

- (void)refreshConformanceOf:(Class)a3
{
}

- (BOOL)objectConforms:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return __conformanceCheck(self, v4, 0);
}

- (BOOL)classConforms:(Class)a3
{
  return __conformanceCheck(self, (uint64_t)a3, 0);
}

- (HMCConformanceCache)initWithProtocol:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  v5 = [(HMCConformanceCache *)self initWithProtocols:v4];

  return v5;
}

- (HMCConformanceCache)initWithProtocols:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMCConformanceCache;
  v5 = [(HMCConformanceCache *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    protocols = v5->_protocols;
    v5->_protocols = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    conformanceCache = v5->_conformanceCache;
    v5->_conformanceCache = (NSMapTable *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

@end