@interface MPCSharedListeningLiveLinkReusePool
+ (MPCSharedListeningLiveLinkReusePool)sharedReusePool;
- (MPCSharedListeningLiveLinkReusePool)init;
- (id)liveLinkForSessionID:(id)a3;
- (void)storeLiveLink:(id)a3 forSessionID:(id)a4;
@end

@implementation MPCSharedListeningLiveLinkReusePool

- (void).cxx_destruct
{
}

- (void)storeLiveLink:(id)a3 forSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_sessionIDLiveLinkMap setObject:v6 forKey:v7];

  os_unfair_lock_unlock(&self->_lock);
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MPCSharedListeningLiveLinkReusePool_storeLiveLink_forSessionID___block_invoke;
  block[3] = &unk_2643C5FC8;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, MEMORY[0x263EF83A0], block);
}

- (id)liveLinkForSessionID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MPCSharedListeningLiveLinkReusePool.m" lineNumber:36 description:@"sessionIdentifier must not be nil"];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMapTable *)self->_sessionIDLiveLinkMap objectForKey:v5];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (MPCSharedListeningLiveLinkReusePool)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCSharedListeningLiveLinkReusePool;
  v2 = [(MPCSharedListeningLiveLinkReusePool *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    sessionIDLiveLinkMap = v2->_sessionIDLiveLinkMap;
    v2->_sessionIDLiveLinkMap = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (MPCSharedListeningLiveLinkReusePool)sharedReusePool
{
  if (sharedReusePool_onceToken != -1) {
    dispatch_once(&sharedReusePool_onceToken, &__block_literal_global_30455);
  }
  v2 = (void *)sharedReusePool___sharedReusePool;

  return (MPCSharedListeningLiveLinkReusePool *)v2;
}

void __54__MPCSharedListeningLiveLinkReusePool_sharedReusePool__block_invoke()
{
  v0 = objc_alloc_init(MPCSharedListeningLiveLinkReusePool);
  v1 = (void *)sharedReusePool___sharedReusePool;
  sharedReusePool___sharedReusePool = (uint64_t)v0;
}

@end