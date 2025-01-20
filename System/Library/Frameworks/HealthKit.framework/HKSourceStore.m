@interface HKSourceStore
+ (id)taskIdentifier;
- (HKSourceStore)initWithHealthStore:(id)a3;
- (id)qaSourceForBundleIdentifier:(id)a3 name:(id)a4 error:(id *)a5;
- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 error:(id *)a7;
- (void)deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchAllSourcesWithCompletion:(id)a3;
- (void)fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4;
- (void)updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5;
@end

@implementation HKSourceStore

- (HKSourceStore)initWithHealthStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSourceStore;
  v5 = [(HKSourceStore *)&v12 init];
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    v7 = [(id)objc_opt_class() taskIdentifier];
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [(HKTaskServerProxyProvider *)v6 initWithHealthStore:v4 taskIdentifier:v7 exportedObject:v5 taskUUID:v8];
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKProxyProvider *)v9;

    [(HKProxyProvider *)v5->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v5;
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)fetchAllSourcesWithCompletion:(id)a3
{
  id v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C2D08;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke_2;
  v7[3] = &unk_1E58BBD88;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchAllSourcesWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __47__HKSourceStore_fetchAllSourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHasSampleWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E58C2D30;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchHasSampleWithBundleIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __63__HKSourceStore_fetchHasSampleWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteSourceWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_1E58C2D30;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_deleteSourceWithBundleIdentifier:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __61__HKSourceStore_deleteSourceWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchOrderedSourcesForObjectType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = [(HKProxyProvider *)self->_proxyProvider clientQueueObjectHandlerWithCompletion:a4];
  proxyProvider = self->_proxyProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke;
  v13[3] = &unk_1E58C2D30;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke_2;
  v11[3] = &unk_1E58BBD88;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v13 errorHandler:v11];
}

uint64_t __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchOrderedSourcesForObjectType:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __61__HKSourceStore_fetchOrderedSourcesForObjectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateOrderedSources:(id)a3 forObjectType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke;
  v17[3] = &unk_1E58C2D58;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v20;
  id v12 = v20;
  id v13 = v9;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateOrderedSources:forObjectType:completion:", a1[4], a1[5], a1[6]);
}

uint64_t __63__HKSourceStore_updateOrderedSources_forObjectType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sourceForAppleDeviceWithUUID:(id)a3 identifier:(id)a4 name:(id)a5 productType:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__22;
  v45 = __Block_byref_object_dispose__22;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__22;
  v39 = __Block_byref_object_dispose__22;
  id v40 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke;
  aBlock[3] = &unk_1E58BE000;
  aBlock[4] = &v41;
  aBlock[5] = &v35;
  id v16 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_2;
  v28[3] = &unk_1E58C2D80;
  id v18 = v12;
  id v29 = v18;
  id v19 = v13;
  id v30 = v19;
  id v20 = v14;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_3;
  v27[3] = &unk_1E58BDBD8;
  v27[4] = &v35;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v28 errorHandler:v27];
  v23 = (void *)v36[5];
  if (v23)
  {
    *a7 = v23;
    v24 = (void *)v42[5];
    v42[5] = 0;
  }
  id v25 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_2(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_sourceForAppleDeviceWithUUID:identifier:name:productType:completion:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __80__HKSourceStore_sourceForAppleDeviceWithUUID_identifier_name_productType_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (id)qaSourceForBundleIdentifier:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__22;
  uint64_t v35 = __Block_byref_object_dispose__22;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__22;
  id v29 = __Block_byref_object_dispose__22;
  id v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke;
  aBlock[3] = &unk_1E58C2DA8;
  aBlock[4] = &v31;
  aBlock[5] = &v25;
  id v10 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke_2;
  v20[3] = &unk_1E58C2D58;
  id v12 = v8;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke_3;
  v19[3] = &unk_1E58BDBD8;
  v19[4] = &v25;
  [(HKProxyProvider *)proxyProvider getSynchronousProxyWithHandler:v20 errorHandler:v19];
  id v15 = (void *)v26[5];
  if (v15)
  {
    *a5 = v15;
    id v16 = (void *)v32[5];
    v32[5] = 0;
  }
  id v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke_2(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_qaSourceForBundleIdentifier:name:completion:", a1[4], a1[5], a1[6]);
}

void __56__HKSourceStore_qaSourceForBundleIdentifier_name_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

@end