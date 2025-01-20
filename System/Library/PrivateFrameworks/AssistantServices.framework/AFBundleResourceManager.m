@interface AFBundleResourceManager
+ (id)sharedManager;
- (AFBundleResourceManager)init;
- (id)URLForResource:(id)a3;
- (id)URLForSoundID:(int64_t)a3;
- (id)resourceForSoundID:(int64_t)a3;
@end

@implementation AFBundleResourceManager

- (void).cxx_destruct
{
}

- (id)URLForResource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = [v4 name];
    v7 = [v4 extension];
    v8 = (void *)[v5 initWithFormat:@"%@.%@", v6, v7];

    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      v10 = [(NSMutableDictionary *)self->_resourceURLProvidersByIdentifier objectForKey:v8];
      os_unfair_lock_unlock(&self->_lock);
      if (!v10)
      {
        v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v12 = [v4 name];
        v13 = [v4 extension];
        v10 = [v11 URLForResource:v12 withExtension:v13];

        os_unfair_lock_lock(&self->_lock);
        resourceURLProvidersByIdentifier = self->_resourceURLProvidersByIdentifier;
        if (v10)
        {
          [(NSMutableDictionary *)resourceURLProvidersByIdentifier setObject:v10 forKey:v8];
        }
        else
        {
          v16 = [MEMORY[0x1E4F1CA98] null];
          [(NSMutableDictionary *)resourceURLProvidersByIdentifier setObject:v16 forKey:v8];
        }
        os_unfair_lock_unlock(p_lock);
      }
      v15 = objc_msgSend(v10, "af_getBundleResourceURL");
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)resourceForSoundID:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC)
  {
    v7 = 0;
  }
  else
  {
    if (_AFBundleResourceGetSoundMap_onceToken != -1) {
      dispatch_once(&_AFBundleResourceGetSoundMap_onceToken, &__block_literal_global_68);
    }
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    id v5 = (id)_AFBundleResourceGetSoundMap_map;
    v6 = [v4 numberWithInteger:a3];
    v7 = [v5 objectForKey:v6];
  }
  return v7;
}

- (AFBundleResourceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AFBundleResourceManager;
  v2 = [(AFBundleResourceManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resourceURLProvidersByIdentifier = v3->_resourceURLProvidersByIdentifier;
    v3->_resourceURLProvidersByIdentifier = v4;
  }
  return v3;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2032);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __40__AFBundleResourceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(AFBundleResourceManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;
}

- (id)URLForSoundID:(int64_t)a3
{
  id v4 = [(AFBundleResourceManager *)self resourceForSoundID:a3];
  id v5 = [(AFBundleResourceManager *)self URLForResource:v4];

  return v5;
}

@end