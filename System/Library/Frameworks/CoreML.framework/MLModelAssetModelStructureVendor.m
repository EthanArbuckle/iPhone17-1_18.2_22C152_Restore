@interface MLModelAssetModelStructureVendor
- (MLModelAssetModelStructureVendor)initWithResourceFactory:(id)a3;
- (MLModelAssetResourceFactory)resourceFactory;
- (MLModelStructure)modelStructure;
- (void)_modelStructureWithCompletionHandler:(id)a3;
- (void)modelStructureWithCompletionHandler:(id)a3;
- (void)setModelStructure:(id)a3;
@end

@implementation MLModelAssetModelStructureVendor

- (MLModelAssetModelStructureVendor)initWithResourceFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelAssetModelStructureVendor;
  v6 = [(MLModelAssetModelStructureVendor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourceFactory, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStructure, 0);

  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

- (void)setModelStructure:(id)a3
{
}

- (MLModelStructure)modelStructure
{
  return (MLModelStructure *)objc_getProperty(self, a2, 16, 1);
}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__MLModelAssetModelStructureVendor_modelStructureWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E59A5178;
  id v7 = v4;
  id v5 = v4;
  [(MLModelAssetModelStructureVendor *)self _modelStructureWithCompletionHandler:v6];
}

uint64_t __72__MLModelAssetModelStructureVendor_modelStructureWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_modelStructureWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(MLModelAssetModelStructureVendor *)self modelStructure];
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    v6 = [(MLModelAssetModelStructureVendor *)self resourceFactory];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__MLModelAssetModelStructureVendor__modelStructureWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59A5150;
    v7[4] = self;
    v8 = v4;
    [v6 modelStructureWithCompletionHandler:v7];
  }
}

void __73__MLModelAssetModelStructureVendor__modelStructureWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [*(id *)(a1 + 32) setModelStructure:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end