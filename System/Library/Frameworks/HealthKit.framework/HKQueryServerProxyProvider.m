@interface HKQueryServerProxyProvider
- (BOOL)shouldForceReactivation;
- (HKQueryServerProxyProvider)initWithHealthStore:(id)a3 query:(id)a4 configuration:(id)a5 queryUUID:(id)a6;
- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5;
- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6;
- (void)setShouldForceReactivation:(BOOL)a3;
@end

@implementation HKQueryServerProxyProvider

- (HKQueryServerProxyProvider)initWithHealthStore:(id)a3 query:(id)a4 configuration:(id)a5 queryUUID:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(id)objc_opt_class() taskIdentifier];
  v15 = [v12 exportedInterface];
  v16 = [v12 remoteInterface];
  v19.receiver = self;
  v19.super_class = (Class)HKQueryServerProxyProvider;
  v17 = [(HKTaskServerProxyProvider *)&v19 initWithHealthStore:v13 taskIdentifier:v14 exportedObject:v12 exportedInterface:v15 remoteInterface:v16 taskUUID:v11];

  if (v17) {
    [(HKTaskServerProxyProvider *)v17 setTaskConfiguration:v10];
  }

  return v17;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKQueryServerProxyProvider.m", 43, @"Invalid parameter not satisfying: %@", @"[source isKindOfClass:HKHealthStore.class]" object file lineNumber description];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke;
  v19[3] = &unk_1E58BDB38;
  id v20 = v12;
  v21 = self;
  id v22 = v13;
  id v23 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  [v11 _serverProxyWithHandler:v19 errorHandler:v15];
}

void __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = [v3 taskUUID];
  v7 = [*(id *)(a1 + 40) taskConfiguration];
  uint64_t v8 = [*(id *)(a1 + 40) shouldForceReactivation];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke_2;
  v9[3] = &unk_1E58C66C8;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  objc_msgSend(v5, "remote_createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:completion:", v4, v6, v7, v8, v9);
}

uint64_t __113__HKQueryServerProxyProvider_fetchProxyServiceEndpointFromSource_serviceIdentifier_endpointHandler_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HKQueryServerProxyProvider.m", 66, @"Invalid parameter not satisfying: %@", @"[source isKindOfClass:HKHealthStore.class]" object file lineNumber description];
  }
  id v11 = v9;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__45;
  v33 = __Block_byref_object_dispose__45;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__45;
  v27 = __Block_byref_object_dispose__45;
  id v28 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke;
  v22[3] = &unk_1E58BDBD8;
  v22[4] = &v23;
  id v12 = [v11 _synchronousServerProxyWithErrorHandler:v22];
  id v13 = [(HKTaskServerProxyProvider *)self taskUUID];
  id v14 = [(HKTaskServerProxyProvider *)self taskConfiguration];
  BOOL v15 = [(HKQueryServerProxyProvider *)self shouldForceReactivation];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke_2;
  v21[3] = &unk_1E58C66F0;
  v21[4] = &v29;
  v21[5] = &v23;
  objc_msgSend(v12, "remote_createQueryServerEndpointForIdentifier:queryUUID:configuration:forceReactivation:completion:", v10, v13, v14, v15, v21);

  id v16 = (id)v24[5];
  id v17 = v16;
  if (v16)
  {
    if (a5) {
      *a5 = v16;
    }
    else {
      _HKLogDroppedError(v16);
    }
  }

  id v18 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v18;
}

void __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__HKQueryServerProxyProvider_proxyServiceEndpointFromSource_serviceIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)shouldForceReactivation
{
  return self->_shouldForceReactivation;
}

- (void)setShouldForceReactivation:(BOOL)a3
{
  self->_shouldForceReactivation = a3;
}

@end