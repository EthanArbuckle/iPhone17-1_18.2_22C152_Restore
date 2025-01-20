@interface NSFileProviderService
- (NSFileProviderService)initWithName:(id)a3 endpointCreatingProxy:(id)a4 requestFinishedGroup:(id)a5;
- (NSFileProviderServiceName)name;
- (id)fetchFileProviderConnectionAndReturnError:(id *)a3;
- (void)dealloc;
- (void)getFileProviderConnectionWithCompletionHandler:(void *)completionHandler;
@end

@implementation NSFileProviderService

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_group_leave((dispatch_group_t)self->_requestFinishedGroup);
  dispatch_release((dispatch_object_t)self->_requestFinishedGroup);
  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderService;
  [(NSFileProviderService *)&v3 dealloc];
}

- (NSFileProviderService)initWithName:(id)a3 endpointCreatingProxy:(id)a4 requestFinishedGroup:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSFileProviderService;
  id v8 = [(NSFileProviderService *)&v10 init];
  if (v8)
  {
    *((void *)v8 + 1) = [a3 copy];
    *((void *)v8 + 2) = a4;
    *((void *)v8 + 3) = a5;
    dispatch_retain((dispatch_object_t)a5);
    dispatch_group_enter(*((dispatch_group_t *)v8 + 3));
  }
  return (NSFileProviderService *)v8;
}

- (void)getFileProviderConnectionWithCompletionHandler:(void *)completionHandler
{
  v9[5] = *MEMORY[0x1E4F143B8];
  id endpointCreatingProxy = self->_endpointCreatingProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E51F7F08;
  v9[4] = completionHandler;
  v6 = (void *)[endpointCreatingProxy remoteObjectProxyWithErrorHandler:v9];
  name = self->_name;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E51F7F58;
  v8[4] = self;
  v8[5] = completionHandler;
  [v6 getListenerEndpointForServiceName:name completionHandler:v8];
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  block[6] = *MEMORY[0x1E4F143B8];
  qos_class_t v4 = qos_class_self();
  global_queue = dispatch_get_global_queue(v4, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E51F7EE0;
  uint64_t v6 = *(void *)(a1 + 32);
  block[4] = a2;
  block[5] = v6;
  dispatch_async(global_queue, block);
}

uint64_t __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  qos_class_t v6 = qos_class_self();
  global_queue = dispatch_get_global_queue(v6, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_4;
  block[3] = &unk_1E51F7F30;
  block[4] = a3;
  block[5] = a2;
  long long v9 = *(_OWORD *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_4(void *a1)
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    v2 = *(void (**)(void))(a1[7] + 16);
    v2();
  }
  else
  {
    objc_super v3 = [[NSXPCConnection alloc] initWithListenerEndpoint:a1[5]];
    qos_class_t v4 = *(NSObject **)(a1[6] + 24);
    dispatch_group_enter(v4);
    dispatch_retain(v4);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_5;
    v5[3] = &unk_1E51F71D0;
    v5[4] = v4;
    [(NSXPCConnection *)v3 set_additionalInvalidationHandler:v5];
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void __72__NSFileProviderService_getFileProviderConnectionWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (id)fetchFileProviderConnectionAndReturnError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  uint64_t v26 = 0;
  id endpointCreatingProxy = self->_endpointCreatingProxy;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke;
  v20[3] = &unk_1E51F7F80;
  v20[4] = &v21;
  qos_class_t v6 = (void *)[endpointCreatingProxy synchronousRemoteObjectProxyWithErrorHandler:v20];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = 0;
  name = self->_name;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_2;
  v13[3] = &unk_1E51F7FA8;
  v13[5] = &v21;
  v13[6] = &v14;
  v13[4] = self;
  [v6 getListenerEndpointForServiceName:name completionHandler:v13];
  id v8 = v22;
  long long v9 = (void *)v22[5];
  if (v9)
  {
    if (a3)
    {
      *a3 = v9;
      long long v9 = (void *)v8[5];
    }
    id v10 = v9;
    id v11 = 0;
  }
  else
  {
    id v11 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v21, 8);
  return v11;
}

id __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id result = a3;
    *(void *)(*(void *)(a1[5] + 8) + 40) = result;
  }
  else
  {
    *(void *)(*(void *)(a1[6] + 8) + 40) = [[NSXPCConnection alloc] initWithListenerEndpoint:a2];
    v5 = *(NSObject **)(a1[4] + 24);
    dispatch_group_enter(v5);
    dispatch_retain(v5);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_3;
    v6[3] = &unk_1E51F71D0;
    v6[4] = v5;
    return (id)objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "set_additionalInvalidationHandler:", v6);
  }
  return result;
}

void __67__NSFileProviderService_fetchFileProviderConnectionAndReturnError___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (NSFileProviderServiceName)name
{
  return (NSFileProviderServiceName)objc_getProperty(self, a2, 8, 1);
}

@end