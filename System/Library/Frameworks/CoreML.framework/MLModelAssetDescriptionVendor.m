@interface MLModelAssetDescriptionVendor
- (MLModelAssetDescription)modelAssetDescription;
- (MLModelAssetDescriptionVendor)initWithResourceFactory:(id)a3;
- (MLModelAssetResourceFactory)resourceFactory;
- (void)_modelAssetDescriptionWithCompletionHandler:(id)a3;
- (void)functionNamesWithCompletionHandler:(id)a3;
- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4;
- (void)modelDescriptionWithCompletionHandler:(id)a3;
- (void)setModelAssetDescription:(id)a3;
@end

@implementation MLModelAssetDescriptionVendor

- (MLModelAssetDescriptionVendor)initWithResourceFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelAssetDescriptionVendor;
  v6 = [(MLModelAssetDescriptionVendor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourceFactory, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelAssetDescription, 0);

  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

- (void)setModelAssetDescription:(id)a3
{
}

- (MLModelAssetDescription)modelAssetDescription
{
  return (MLModelAssetDescription *)objc_getProperty(self, a2, 16, 1);
}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__MLModelAssetDescriptionVendor_modelDescriptionOfFunctionNamed_completionHandler___block_invoke;
  v10[3] = &unk_1E59A4FB8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(MLModelAssetDescriptionVendor *)self _modelAssetDescriptionWithCompletionHandler:v10];
}

void __83__MLModelAssetDescriptionVendor_modelDescriptionOfFunctionNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 modelDescriptionOfFunctionNamed:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)modelDescriptionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__MLModelAssetDescriptionVendor_modelDescriptionWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E59A4FE0;
  id v7 = v4;
  id v5 = v4;
  [(MLModelAssetDescriptionVendor *)self _modelAssetDescriptionWithCompletionHandler:v6];
}

void __71__MLModelAssetDescriptionVendor_modelDescriptionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 defaultModelDescription];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)functionNamesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__MLModelAssetDescriptionVendor_functionNamesWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E59A4FE0;
  id v7 = v4;
  id v5 = v4;
  [(MLModelAssetDescriptionVendor *)self _modelAssetDescriptionWithCompletionHandler:v6];
}

void __68__MLModelAssetDescriptionVendor_functionNamesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 functionNames];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_modelAssetDescriptionWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(MLModelAssetDescriptionVendor *)self modelAssetDescription];
  if (v5)
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    id v6 = [(MLModelAssetDescriptionVendor *)self resourceFactory];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__MLModelAssetDescriptionVendor__modelAssetDescriptionWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59A4FB8;
    v7[4] = self;
    id v8 = v4;
    [v6 modelAssetDescriptionWithCompletionHandler:v7];
  }
}

void __77__MLModelAssetDescriptionVendor__modelAssetDescriptionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [*(id *)(a1 + 32) setModelAssetDescription:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end