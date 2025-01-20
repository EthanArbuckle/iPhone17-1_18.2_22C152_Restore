@interface CRKSynchronousConfigurationSource
- (BOOL)setConfiguration:(id)a3 error:(id *)a4;
- (CRKSynchronousConfigurationSource)initWithConfigurationSource:(id)a3;
- (id)configurationWithError:(id *)a3;
@end

@implementation CRKSynchronousConfigurationSource

- (CRKSynchronousConfigurationSource)initWithConfigurationSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKSynchronousConfigurationSource;
  v6 = [(CRKSynchronousConfigurationSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mBaseSource, a3);
  }

  return v7;
}

- (id)configurationWithError:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  mBaseSource = self->mBaseSource;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__CRKSynchronousConfigurationSource_configurationWithError___block_invoke;
  v10[3] = &unk_2646F5630;
  v12 = &v20;
  v13 = &v14;
  v7 = v5;
  v11 = v7;
  [(CRKConfigurationSource *)mBaseSource fetchConfiguration:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __60__CRKSynchronousConfigurationSource_configurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  id v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  mBaseSource = self->mBaseSource;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CRKSynchronousConfigurationSource_setConfiguration_error___block_invoke;
  v12[3] = &unk_2646F5658;
  uint64_t v14 = &v15;
  uint64_t v9 = v7;
  v13 = v9;
  [(CRKConfigurationSource *)mBaseSource setConfiguration:v6 completion:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (a4) {
    *a4 = (id) v16[5];
  }
  BOOL v10 = v16[5] == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __60__CRKSynchronousConfigurationSource_setConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end