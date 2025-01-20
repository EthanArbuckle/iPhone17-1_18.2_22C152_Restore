@interface MLState
+ (MLState)emptyState;
- (MLFeatureProvider)featureProviderRepresentation;
- (MLState)initWithBackings:(id)a3;
- (NSDictionary)backings;
- (id)description;
- (void)getMultiArrayForStateNamed:(id)a3 handler:(id)a4;
- (void)getMultiArrayWithHandler:(id)a3;
- (void)internalGetMultiArrayWithHandler:(id)a3;
@end

@implementation MLState

+ (MLState)emptyState
{
  if (emptyState_onceToken != -1) {
    dispatch_once(&emptyState_onceToken, &__block_literal_global_29053);
  }
  v2 = (void *)emptyState_s_emptyState;

  return (MLState *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backings, 0);

  objc_storeStrong((id *)&self->_featureProviderRepresentationCache, 0);
}

- (NSDictionary)backings
{
  return self->_backings;
}

- (id)description
{
  v2 = [(MLState *)self backings];
  v3 = [v2 description];

  return v3;
}

- (void)internalGetMultiArrayWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MLState *)self backings];
  uint64_t v6 = [v5 count];

  if (v6 != 1)
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }
  }
  v8 = [(MLState *)self backings];
  v9 = [v8 allKeys];
  v10 = [v9 firstObject];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__MLState_internalGetMultiArrayWithHandler___block_invoke;
  v12[3] = &unk_1E59A54A0;
  id v13 = v4;
  id v11 = v4;
  [(MLState *)self getMultiArrayForStateNamed:v10 handler:v12];
}

uint64_t __44__MLState_internalGetMultiArrayWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getMultiArrayWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MLState_getMultiArrayWithHandler___block_invoke;
  v6[3] = &unk_1E59A54A0;
  id v7 = v4;
  id v5 = v4;
  [(MLState *)self internalGetMultiArrayWithHandler:v6];
}

uint64_t __36__MLState_getMultiArrayWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MLFeatureProvider)featureProviderRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_stateBuffersLock = &self->_stateBuffersLock;
  os_unfair_lock_lock(&self->_stateBuffersLock);
  p_featureProviderRepresentationCacheLock = &self->_featureProviderRepresentationCacheLock;
  os_unfair_lock_lock(&self->_featureProviderRepresentationCacheLock);
  if (!self->_featureProviderRepresentationCache)
  {
    v21 = p_stateBuffersLock;
    id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(MLState *)self backings];
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v11 = [(MLState *)self backings];
          v12 = [v11 objectForKeyedSubscript:v10];

          id v13 = [MLState alloc];
          uint64_t v27 = v10;
          v28 = v12;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          v15 = [(MLState *)v13 initWithBackings:v14];

          v16 = +[MLFeatureValue internalFeatureValueWithState:v15];
          [v5 setObject:v16 forKeyedSubscript:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v7);
    }

    v17 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v5 error:0];
    featureProviderRepresentationCache = self->_featureProviderRepresentationCache;
    self->_featureProviderRepresentationCache = (MLFeatureProvider *)v17;

    p_featureProviderRepresentationCacheLock = &self->_featureProviderRepresentationCacheLock;
    p_stateBuffersLock = v21;
  }
  os_unfair_lock_unlock(p_featureProviderRepresentationCacheLock);
  os_unfair_lock_unlock(p_stateBuffersLock);
  v19 = self->_featureProviderRepresentationCache;

  return v19;
}

- (void)getMultiArrayForStateNamed:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  p_stateBuffersLock = &self->_stateBuffersLock;
  os_unfair_lock_lock(&self->_stateBuffersLock);
  v9 = (void *)MEMORY[0x19F3C29E0]();
  uint64_t v10 = [(MLState *)self backings];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (!v11)
  {
    v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "The backing object for the state named %@ doens't exist.", buf, 0xCu);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The backing object for the state named %@ doens't exist.", v6 format];
  }
  v7[2](v7, v11);

  os_unfair_lock_unlock(p_stateBuffersLock);
}

- (MLState)initWithBackings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLState;
  id v5 = [(MLState *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_featureProviderRepresentationCacheLock._os_unfair_lock_opaque = 0;
    v5->_stateBuffersLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    backings = v6->_backings;
    v6->_backings = (NSDictionary *)v7;
  }
  return v6;
}

void __21__MLState_emptyState__block_invoke()
{
  v0 = [MLState alloc];
  uint64_t v1 = [(MLState *)v0 initWithBackings:MEMORY[0x1E4F1CC08]];
  v2 = (void *)emptyState_s_emptyState;
  emptyState_s_emptyState = v1;
}

@end