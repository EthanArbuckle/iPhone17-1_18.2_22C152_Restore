@interface LNViewEntityAggregationResult
- (LNViewEntityAggregationResult)init;
- (NSDictionary)entities;
- (NSError)error;
- (void)addResults:(id)a3 error:(id)a4 forBundle:(id)a5;
@end

@implementation LNViewEntityAggregationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_entitiesByBundleId, 0);
}

- (NSError)error
{
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__LNViewEntityAggregationResult_error__block_invoke;
  aBlock[3] = &unk_1E5B3A0B0;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  if ([(NSMutableDictionary *)self->_errors count])
  {
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"LNConnectionErrorDomain" code:1007 userInfo:self->_errors];
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)[v4 copy];

  v3[2](v3);
  return (NSError *)v5;
}

void __38__LNViewEntityAggregationResult_error__block_invoke(uint64_t a1)
{
}

- (NSDictionary)entities
{
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__LNViewEntityAggregationResult_entities__block_invoke;
  aBlock[3] = &unk_1E5B3A0B0;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  v4 = (void *)[(NSMutableDictionary *)self->_entitiesByBundleId copy];
  v3[2](v3);

  return (NSDictionary *)v4;
}

void __41__LNViewEntityAggregationResult_entities__block_invoke(uint64_t a1)
{
}

- (void)addResults:(id)a3 error:(id)a4 forBundle:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__LNViewEntityAggregationResult_addResults_error_forBundle___block_invoke;
  aBlock[3] = &unk_1E5B3A0B0;
  aBlock[4] = self;
  v11 = (void (**)(void))_Block_copy(aBlock);
  if (v8)
  {
    v12 = getLNLogCategoryView();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v8 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_INFO, "Successfully fetched %lu view entities from %@", buf, 0x16u);
    }
    uint64_t v14 = 8;
    id v15 = v8;
LABEL_9:

    [*(id *)((char *)&self->super.isa + v14) setValue:v15 forKey:v10];
    goto LABEL_10;
  }
  if (v9)
  {
    v12 = getLNLogCategoryView();
    uint64_t v14 = 16;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = (uint64_t)v10;
      __int16 v19 = 2112;
      id v20 = v9;
      uint64_t v14 = 16;
      _os_log_impl(&dword_1A4419000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch view entities from %@: %@", buf, 0x16u);
    }
    id v15 = v9;
    goto LABEL_9;
  }
LABEL_10:
  v11[2](v11);
}

void __60__LNViewEntityAggregationResult_addResults_error_forBundle___block_invoke(uint64_t a1)
{
}

- (LNViewEntityAggregationResult)init
{
  v10.receiver = self;
  v10.super_class = (Class)LNViewEntityAggregationResult;
  v2 = [(LNViewEntityAggregationResult *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entitiesByBundleId = v3->_entitiesByBundleId;
    v3->_entitiesByBundleId = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errors = v3->_errors;
    v3->_errors = v6;

    id v8 = v3;
  }

  return v3;
}

@end