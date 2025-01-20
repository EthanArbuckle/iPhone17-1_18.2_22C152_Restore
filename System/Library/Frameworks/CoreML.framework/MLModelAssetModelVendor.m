@interface MLModelAssetModelVendor
- (MLModel)cachedModel;
- (MLModelAssetModelVendor)initWithResourceFactory:(id)a3;
- (MLModelAssetResourceFactory)resourceFactory;
- (MLModelConfiguration)cachedConfiguration;
- (id)modelWithConfiguration:(id)a3 error:(id *)a4;
- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setCachedConfiguration:(id)a3;
- (void)setCachedModel:(id)a3;
@end

@implementation MLModelAssetModelVendor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModel, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);

  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

- (MLModelAssetModelVendor)initWithResourceFactory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLModelAssetModelVendor;
  v6 = [(MLModelAssetModelVendor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceFactory, a3);
    cachedConfiguration = v7->_cachedConfiguration;
    v7->_cachedConfiguration = 0;

    cachedModel = v7->_cachedModel;
    v7->_cachedModel = 0;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(MLModelAssetModelVendor *)self cachedConfiguration];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v9 = [(MLModelAssetModelVendor *)self cachedModel];
  }
  else
  {
    v10 = [(MLModelAssetModelVendor *)self resourceFactory];
    v9 = [v10 modelWithConfiguration:v6 error:a4];

    if (v9)
    {
      [(MLModelAssetModelVendor *)self setCachedModel:v9];
      [(MLModelAssetModelVendor *)self setCachedConfiguration:v6];
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelConfiguration)cachedConfiguration
{
  return self->_cachedConfiguration;
}

- (void)setCachedModel:(id)a3
{
}

- (void)setCachedConfiguration:(id)a3
{
}

- (MLModel)cachedModel
{
  return self->_cachedModel;
}

- (void)modelWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  int v8 = [(MLModelAssetModelVendor *)self cachedConfiguration];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_5;
  }
  v10 = [(MLModelAssetModelVendor *)self cachedModel];
  os_unfair_lock_unlock(&self->_lock);
  if (!v10)
  {
LABEL_5:
    objc_super v11 = [(MLModelAssetModelVendor *)self resourceFactory];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__MLModelAssetModelVendor_modelWithConfiguration_completionHandler___block_invoke;
    v12[3] = &unk_1E59A5058;
    v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [v11 modelWithConfiguration:v13 completionHandler:v12];

    v10 = 0;
    goto LABEL_6;
  }
  (*((void (**)(id, void *, void))v7 + 2))(v7, v10, 0);
LABEL_6:
}

void __68__MLModelAssetModelVendor_modelWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) setCachedModel:v6];
    [*(id *)(a1 + 32) setCachedConfiguration:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end