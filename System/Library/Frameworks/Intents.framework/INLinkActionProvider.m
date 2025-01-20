@interface INLinkActionProvider
+ (INLinkActionProvider)sharedProvider;
- (BOOL)isCachingLinkMetadata;
- (INLinkActionProvider)init;
- (NSDictionary)actionsGroupedByBundleIdentifier;
- (NSDictionary)entitiesGroupedByBundleIdentifier;
- (id)bundleIdentifiers;
- (id)cachedActionIdentifiersForBundleIdentifier:(id)a3;
- (id)cachedActions;
- (id)cachedBundleIdentifiers;
- (id)cachedEntities;
- (id)cachedEntityIdentifiersForBundleIdentifier:(id)a3;
- (id)supportedActionIdentifiersForBundleIdentifier:(id)a3;
- (id)supportedEntityIdentifiersForBundleIdentifier:(id)a3;
- (void)cacheActionIdentifiers:(id)a3 forBundleIdentifier:(id)a4;
- (void)cacheActions:(id)a3;
- (void)cacheBundleIdentifiers:(id)a3;
- (void)cacheEntities:(id)a3;
- (void)cacheEntityIdentifiers:(id)a3 forBundleIdentifier:(id)a4;
- (void)evictCache;
- (void)metadataProvider;
- (void)setCacheLinkMetadata:(BOOL)a3;
- (void)setLockCachedActions:(uint64_t)a1;
- (void)setLockCachedBundleIdentifiers:(uint64_t)a1;
- (void)setLockCachedEntities:(uint64_t)a1;
@end

@implementation INLinkActionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockCachedEntities, 0);
  objc_storeStrong((id *)&self->_lockCachedActions, 0);
  objc_storeStrong((id *)&self->_lockCachedEntityIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockCachedActionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lockCachedBundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_metadataProvider, 0);
}

- (void)setCacheLinkMetadata:(BOOL)a3
{
  self->_cacheLinkMetadata = a3;
}

- (BOOL)isCachingLinkMetadata
{
  return self->_cacheLinkMetadata;
}

- (void)evictCache
{
  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__INLinkActionProvider_evictCache__block_invoke;
  v6[3] = &unk_1E55208F8;
  v6[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v6);
  -[INLinkActionProvider setLockCachedBundleIdentifiers:]((uint64_t)self, 0);
  -[INLinkActionProvider setLockCachedActions:]((uint64_t)self, 0);
  -[INLinkActionProvider setLockCachedEntities:]((uint64_t)self, 0);
  v4 = objc_opt_new();
  if (self) {
    objc_storeStrong((id *)&self->_lockCachedActionIdentifiers, v4);
  }

  v5 = objc_opt_new();
  if (self) {
    objc_storeStrong((id *)&self->_lockCachedEntityIdentifiers, v5);
  }

  v3[2](v3);
}

void __34__INLinkActionProvider_evictCache__block_invoke(uint64_t a1)
{
}

- (void)setLockCachedBundleIdentifiers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setLockCachedActions:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setLockCachedEntities:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)cacheEntityIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__INLinkActionProvider_cacheEntityIdentifiers_forBundleIdentifier___block_invoke;
  v11[3] = &unk_1E55208F8;
  v11[4] = self;
  v8 = (void (**)(void))MEMORY[0x192F984C0](v11);
  if (self) {
    lockCachedEntityIdentifiers = self->_lockCachedEntityIdentifiers;
  }
  else {
    lockCachedEntityIdentifiers = 0;
  }
  v10 = lockCachedEntityIdentifiers;
  [(NSMutableDictionary *)v10 setObject:v6 forKey:v7];

  v8[2](v8);
}

void __67__INLinkActionProvider_cacheEntityIdentifiers_forBundleIdentifier___block_invoke(uint64_t a1)
{
}

- (void)cacheActionIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__INLinkActionProvider_cacheActionIdentifiers_forBundleIdentifier___block_invoke;
  v11[3] = &unk_1E55208F8;
  v11[4] = self;
  v8 = (void (**)(void))MEMORY[0x192F984C0](v11);
  if (self) {
    lockCachedActionIdentifiers = self->_lockCachedActionIdentifiers;
  }
  else {
    lockCachedActionIdentifiers = 0;
  }
  v10 = lockCachedActionIdentifiers;
  [(NSMutableDictionary *)v10 setObject:v6 forKey:v7];

  v8[2](v8);
}

void __67__INLinkActionProvider_cacheActionIdentifiers_forBundleIdentifier___block_invoke(uint64_t a1)
{
}

- (void)cacheEntities:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__INLinkActionProvider_cacheEntities___block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  id v6 = (void (**)(void))MEMORY[0x192F984C0](v7);
  -[INLinkActionProvider setLockCachedEntities:]((uint64_t)self, v5);

  v6[2](v6);
}

void __38__INLinkActionProvider_cacheEntities___block_invoke(uint64_t a1)
{
}

- (void)cacheActions:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__INLinkActionProvider_cacheActions___block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  id v6 = (void (**)(void))MEMORY[0x192F984C0](v7);
  -[INLinkActionProvider setLockCachedActions:]((uint64_t)self, v5);

  v6[2](v6);
}

void __37__INLinkActionProvider_cacheActions___block_invoke(uint64_t a1)
{
}

- (void)cacheBundleIdentifiers:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__INLinkActionProvider_cacheBundleIdentifiers___block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  id v6 = (void (**)(void))MEMORY[0x192F984C0](v7);
  -[INLinkActionProvider setLockCachedBundleIdentifiers:]((uint64_t)self, v5);

  v6[2](v6);
}

void __47__INLinkActionProvider_cacheBundleIdentifiers___block_invoke(uint64_t a1)
{
}

- (id)cachedEntityIdentifiersForBundleIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__INLinkActionProvider_cachedEntityIdentifiersForBundleIdentifier___block_invoke;
  v10[3] = &unk_1E55208F8;
  v10[4] = self;
  id v5 = (void (**)(void))MEMORY[0x192F984C0](v10);
  if (self) {
    lockCachedEntityIdentifiers = self->_lockCachedEntityIdentifiers;
  }
  else {
    lockCachedEntityIdentifiers = 0;
  }
  id v7 = lockCachedEntityIdentifiers;
  v8 = [(NSMutableDictionary *)v7 objectForKey:v4];

  v5[2](v5);

  return v8;
}

void __67__INLinkActionProvider_cachedEntityIdentifiersForBundleIdentifier___block_invoke(uint64_t a1)
{
}

- (id)cachedActionIdentifiersForBundleIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__INLinkActionProvider_cachedActionIdentifiersForBundleIdentifier___block_invoke;
  v10[3] = &unk_1E55208F8;
  v10[4] = self;
  id v5 = (void (**)(void))MEMORY[0x192F984C0](v10);
  if (self) {
    lockCachedActionIdentifiers = self->_lockCachedActionIdentifiers;
  }
  else {
    lockCachedActionIdentifiers = 0;
  }
  id v7 = lockCachedActionIdentifiers;
  v8 = [(NSMutableDictionary *)v7 objectForKey:v4];

  v5[2](v5);

  return v8;
}

void __67__INLinkActionProvider_cachedActionIdentifiersForBundleIdentifier___block_invoke(uint64_t a1)
{
}

- (id)cachedEntities
{
  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__INLinkActionProvider_cachedEntities__block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v7);
  if (self) {
    lockCachedEntities = self->_lockCachedEntities;
  }
  else {
    lockCachedEntities = 0;
  }
  id v5 = lockCachedEntities;
  v3[2](v3);

  return v5;
}

void __38__INLinkActionProvider_cachedEntities__block_invoke(uint64_t a1)
{
}

- (id)cachedActions
{
  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__INLinkActionProvider_cachedActions__block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v7);
  if (self) {
    lockCachedActions = self->_lockCachedActions;
  }
  else {
    lockCachedActions = 0;
  }
  id v5 = lockCachedActions;
  v3[2](v3);

  return v5;
}

void __37__INLinkActionProvider_cachedActions__block_invoke(uint64_t a1)
{
}

- (id)cachedBundleIdentifiers
{
  os_unfair_lock_lock(&self->_lock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__INLinkActionProvider_cachedBundleIdentifiers__block_invoke;
  v7[3] = &unk_1E55208F8;
  v7[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v7);
  if (self) {
    lockCachedBundleIdentifiers = self->_lockCachedBundleIdentifiers;
  }
  else {
    lockCachedBundleIdentifiers = 0;
  }
  id v5 = lockCachedBundleIdentifiers;
  v3[2](v3);

  return v5;
}

void __47__INLinkActionProvider_cachedBundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)supportedEntityIdentifiersForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INLinkActionProvider *)self cachedEntities];

  if (v5)
  {
    id v6 = [(INLinkActionProvider *)self cachedEntities];
    id v7 = [v6 objectForKey:v4];

    id v8 = [v7 allKeys];

    goto LABEL_13;
  }
  v9 = [(INLinkActionProvider *)self cachedEntityIdentifiersForBundleIdentifier:v4];
  v10 = v9;
  if (!v9)
  {
    v11 = -[INLinkActionProvider metadataProvider](self);
    if (objc_opt_respondsToSelector())
    {
      id v16 = 0;
      id v8 = [v11 entityIdentifiersForBundleIdentifier:v4 error:&v16];
      id v12 = v16;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      id v15 = 0;
      v13 = [v11 entitiesForBundleIdentifier:v4 error:&v15];
      id v12 = v15;
      objc_msgSend(v13, "if_compactMap:", &__block_literal_global_9);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if ([(INLinkActionProvider *)self isCachingLinkMetadata]) {
      [(INLinkActionProvider *)self cacheEntityIdentifiers:v8 forBundleIdentifier:v4];
    }
    goto LABEL_11;
  }
  id v8 = v9;
LABEL_12:

LABEL_13:

  return v8;
}

- (void)metadataProvider
{
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2050000000;
      v3 = (void *)getLNMetadataProviderClass_softClass;
      uint64_t v12 = getLNMetadataProviderClass_softClass;
      if (!getLNMetadataProviderClass_softClass)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __getLNMetadataProviderClass_block_invoke;
        v8[3] = &unk_1E5520EB8;
        v8[4] = &v9;
        __getLNMetadataProviderClass_block_invoke((uint64_t)v8);
        v3 = (void *)v10[3];
      }
      id v4 = v3;
      _Block_object_dispose(&v9, 8);
      id v5 = objc_alloc_init(v4);
      id v6 = (void *)v1[2];
      v1[2] = v5;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }

  return a1;
}

id __70__INLinkActionProvider_supportedEntityIdentifiersForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKey:@"identifier"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)supportedActionIdentifiersForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INLinkActionProvider *)self cachedActions];

  if (v5)
  {
    id v6 = [(INLinkActionProvider *)self cachedActions];
    id v7 = [v6 objectForKey:v4];

    id v8 = [v7 allKeys];

    goto LABEL_13;
  }
  uint64_t v9 = [(INLinkActionProvider *)self cachedActionIdentifiersForBundleIdentifier:v4];
  v10 = v9;
  if (!v9)
  {
    uint64_t v11 = -[INLinkActionProvider metadataProvider](self);
    if (objc_opt_respondsToSelector())
    {
      id v16 = 0;
      id v8 = [v11 actionIdentifiersForBundleIdentifier:v4 error:&v16];
      id v12 = v16;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      id v15 = 0;
      v13 = [v11 actionsForBundleIdentifier:v4 error:&v15];
      id v12 = v15;
      objc_msgSend(v13, "if_compactMap:", &__block_literal_global_158145);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if ([(INLinkActionProvider *)self isCachingLinkMetadata]) {
      [(INLinkActionProvider *)self cacheActionIdentifiers:v8 forBundleIdentifier:v4];
    }
    goto LABEL_11;
  }
  id v8 = v9;
LABEL_12:

LABEL_13:

  return v8;
}

id __70__INLinkActionProvider_supportedActionIdentifiersForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueForKey:@"identifier"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)bundleIdentifiers
{
  v3 = -[INLinkActionProvider metadataProvider](self);
  uint64_t v6 = 0;
  id v4 = [v3 bundlesWithError:&v6];
  if (v4 && [(INLinkActionProvider *)self isCachingLinkMetadata]) {
    [(INLinkActionProvider *)self cacheBundleIdentifiers:v4];
  }

  return v4;
}

- (NSDictionary)entitiesGroupedByBundleIdentifier
{
  v3 = [(INLinkActionProvider *)self cachedEntities];

  if (v3)
  {
    id v4 = [(INLinkActionProvider *)self cachedEntities];
  }
  else
  {
    id v5 = -[INLinkActionProvider metadataProvider](self);
    uint64_t v7 = 0;
    id v4 = [v5 entitiesWithError:&v7];
    if (v4 && [(INLinkActionProvider *)self isCachingLinkMetadata]) {
      [(INLinkActionProvider *)self cacheEntities:v4];
    }
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)actionsGroupedByBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(INLinkActionProvider *)self cachedActions];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = -[INLinkActionProvider metadataProvider](self);
    uint64_t v8 = 0;
    id v5 = [v6 actionsWithError:&v8];
    if (v5 && [(INLinkActionProvider *)self isCachingLinkMetadata]) {
      [(INLinkActionProvider *)self cacheActions:v5];
    }
  }

  return (NSDictionary *)v5;
}

- (INLinkActionProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)INLinkActionProvider;
  v2 = [(INLinkActionProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_cacheLinkMetadata = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    lockCachedActionIdentifiers = v3->_lockCachedActionIdentifiers;
    v3->_lockCachedActionIdentifiers = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    lockCachedEntityIdentifiers = v3->_lockCachedEntityIdentifiers;
    v3->_lockCachedEntityIdentifiers = (NSMutableDictionary *)v6;

    uint64_t v8 = v3;
  }

  return v3;
}

+ (INLinkActionProvider)sharedProvider
{
  if (sharedProvider_onceToken_158156 != -1) {
    dispatch_once(&sharedProvider_onceToken_158156, &__block_literal_global_12_158157);
  }
  v2 = (void *)sharedProvider_provider;

  return (INLinkActionProvider *)v2;
}

uint64_t __38__INLinkActionProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(INLinkActionProvider);
  uint64_t v1 = sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end