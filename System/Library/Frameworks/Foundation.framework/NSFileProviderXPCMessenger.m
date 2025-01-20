@interface NSFileProviderXPCMessenger
- (NSFileProviderXPCMessenger)initWithFileProvider:(id)a3 queue:(id)a4;
- (NSFileProviderXPCMessenger)initWithFileProviderProxy:(id)a3;
- (void)_makeProvider:(id)a3 provideItemAtURL:(id)a4 withInfo:(id)a5 completionHandler:(id)a6;
- (void)cancelProvidingItemAtURL:(id)a3 forClaimWithID:(id)a4;
- (void)checkInProviderWithReply:(id)a3;
- (void)collectDebuggingInformationWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 fileName:(id)a5 completionHandler:(id)a6;
- (void)observeEndOfWriteAtURL:(id)a3 forClaimWithID:(id)a4 fromProcessWithIdentifier:(int)a5;
- (void)observePresentationChangeOfKind:(id)a3 forPresenterOfURL:(id)a4 withInfo:(id)a5;
- (void)provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5;
- (void)providePhysicalItemForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation NSFileProviderXPCMessenger

- (NSFileProviderXPCMessenger)initWithFileProvider:(id)a3 queue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderXPCMessenger;
  v6 = [(NSFileProviderXPCMessenger *)&v8 init];
  if (v6)
  {
    v6->_fileProvider = (NSFileProvider *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
  }
  return v6;
}

- (NSFileProviderXPCMessenger)initWithFileProviderProxy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderXPCMessenger;
  v4 = [(NSFileProviderXPCMessenger *)&v6 init];
  if (v4) {
    v4->_fileProviderProxy = (NSFileProviderProxy *)a3;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSFileProviderXPCMessenger;
  [(NSFileProviderXPCMessenger *)&v4 dealloc];
}

- (void)invalidate
{
  self->_fileProvider = 0;
  self->_fileProviderProxy = 0;
}

- (void)checkInProviderWithReply:(id)a3
{
}

- (void)_makeProvider:(id)a3 provideItemAtURL:(id)a4 withInfo:(id)a5 completionHandler:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
  uint64_t v12 = [a5 readerID];
  v13 = _NSFCProviderLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543875;
    id v18 = v11;
    __int16 v19 = 2113;
    uint64_t v20 = [a4 path];
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl(&dword_181795000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ providing %{private}@ for claim %{public}@", buf, 0x20u);
  }
  id v14 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:a3 withDescription:@"Provide"];
  v15 = (void *)[a3 _providedItemsOperationQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke;
  v16[3] = &unk_1E51FD928;
  v16[4] = v11;
  v16[5] = v14;
  v16[6] = a3;
  v16[7] = a4;
  v16[8] = a5;
  v16[9] = self;
  v16[10] = v12;
  v16[11] = a6;
  objc_msgSend(v15, "_fc_addUncancellableOperationForReactorID:block:", v11, v16);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ began providing", buf, 0xCu);
  }
  [*(id *)(a1 + 40) didBegin];
  char v4 = objc_opt_respondsToSelector();
  uint64_t v5 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_722;
    v19[3] = &unk_1E51FD090;
    long long v20 = *(_OWORD *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 88);
    uint64_t v21 = *(void *)(a1 + 72);
    uint64_t v22 = v8;
    return [v5 _provideItemAtURL:v6 withInfo:v7 completionHandler:v19];
  }
  else if (objc_opt_respondsToSelector())
  {
    v10 = *(void **)(a1 + 64);
    if (v10)
    {
      [v10 readerAuditToken];
      uint64_t v11 = DWORD1(v24);
    }
    else
    {
      uint64_t v11 = 0;
      long long v23 = 0u;
      long long v24 = 0u;
    }
    +[NSFileCoordinator _addProcessIdentifier:v11 observedUbiquityAttributes:0 forID:*(void *)(a1 + 80)];
    +[NSFileCoordinator _setReadingOptions:](NSFileCoordinator, "_setReadingOptions:", [*(id *)(a1 + 64) readingOptions]);
    +[NSFileCoordinator _setKernelMaterializationInfo:](NSFileCoordinator, "_setKernelMaterializationInfo:", [*(id *)(a1 + 64) kernelMaterializationInfo]);
    objc_msgSend(*(id *)(a1 + 48), "_provideItemAtURL:toReaderWithID:completionHandler:", *(void *)(a1 + 56));
    +[NSFileCoordinator _setReadingOptions:0];
    return +[NSFileCoordinator _setKernelMaterializationInfo:0];
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_728;
    v15[3] = &unk_1E51FD720;
    long long v16 = *(_OWORD *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = v14;
    return [v12 _provideItemAtURL:v13 completionHandler:v15];
  }
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_722(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_723;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_723(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  +[NSFileCoordinator _removeInfoForID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) willEnd];
  uint64_t v6 = +[NSFileProvidingResponse responseWithError:a2];
  [(NSFileProvidingResponse *)v6 setProvidedItemRecursiveGenerationCount:+[NSFileCoordinator _providedItemGenerationCount]];
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 56) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_727;
  block[3] = &unk_1E51FD680;
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  block[5] = v6;
  block[6] = v9;
  block[4] = v8;
  dispatch_async(v7, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_727(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_2_728(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v5;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished providing", buf, 0xCu);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_729;
  block[3] = &unk_1E51FD680;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  block[5] = a2;
  block[6] = v8;
  block[4] = v7;
  dispatch_async(v6, block);
}

uint64_t __88__NSFileProviderXPCMessenger__makeProvider_provideItemAtURL_withInfo_completionHandler___block_invoke_729(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = +[NSFileProvidingResponse responseWithError:*(void *)(a1 + 40)];
  char v4 = *(uint64_t (**)(uint64_t, NSFileProvidingResponse *))(v2 + 16);

  return v4(v2, v3);
}

- (void)provideItemAtURL:(id)a3 withInfo:(id)a4 completionHandler:(id)a5
{
  v13[8] = *MEMORY[0x1E4F143B8];
  fileProvider = self->_fileProvider;
  if (fileProvider)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke;
    v13[3] = &unk_1E51FD090;
    v13[4] = self;
    v13[5] = a3;
    v13[6] = a4;
    v13[7] = a5;
    [(NSFileProviderXPCMessenger *)self _makeProvider:fileProvider provideItemAtURL:a3 withInfo:a4 completionHandler:v13];
  }
  else
  {
    fileProviderProxy = self->_fileProviderProxy;
    if (fileProviderProxy)
    {
      v10 = [(NSFileProviderProxy *)fileProviderProxy remoteProvider];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3;
      v12[3] = &unk_1E51F7F08;
      v12[4] = a5;
      objc_msgSend((id)-[NSFileProviderXPCInterface remoteObjectProxyWithErrorHandler:](v10, "remoteObjectProxyWithErrorHandler:", v12), "provideItemAtURL:withInfo:completionHandler:", a3, a4, a5);
    }
    else
    {
      uint64_t v11 = (void (*)(id, void))*((void *)a5 + 2);
      v11(a5, 0);
    }
  }
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke(uint64_t a1, NSFileProvidingResponse *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v4 = (objc_class *)objc_opt_class();
  if ([NSStringFromClass(v4) hasSuffix:@"TiWorkFileProvider"]
    && ![(NSFileProvidingResponse *)a2 error])
  {
    uint64_t v5 = (char *)[*(id *)(a1 + 40) fileSystemRepresentation];
    if (v5)
    {
      uint64_t v8 = *(void **)(a1 + 48);
      if (v8)
      {
        [v8 readerAuditToken];
      }
      else
      {
        long long v11 = 0u;
        long long v12 = 0u;
      }
      uint64_t v9 = sandbox_extension_issue_file_to_process();
      uint64_t v5 = (char *)v9;
      if (a2 || !v9)
      {
        if (!v9) {
          goto LABEL_4;
        }
      }
      else
      {
        a2 = objc_alloc_init(NSFileProvidingResponse);
      }
      [(NSFileProvidingResponse *)a2 setSandboxToken:[+[NSFileManager defaultManager] stringWithFileSystemRepresentation:v5 length:strlen(v5)]];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_4:
  free(v5);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_2;
  v10[3] = &unk_1E51F7EE0;
  uint64_t v6 = *(void *)(a1 + 56);
  v10[4] = a2;
  v10[5] = v6;
  return +[NSFileCoordinator _performBarrierAsync:v10];
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __74__NSFileProviderXPCMessenger_provideItemAtURL_withInfo_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"provide";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void, NSFileProvidingResponse *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), +[NSFileProvidingResponse responseWithError:a2]);
}

- (void)cancelProvidingItemAtURL:(id)a3 forClaimWithID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_fileProvider)
  {
    uint64_t v7 = _NSFCProviderLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = a4;
      _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling providing for claim %{public}@", buf, 0xCu);
    }
    id v8 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_fileProvider withDescription:@"Provide"];
    uint64_t v9 = (void *)[(NSFileProvider *)self->_fileProvider _providedItemsOperationQueue];
    id v10 = +[NSFileAccessArbiterProxy _idForReactor:self->_fileProvider];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke;
    v11[3] = &unk_1E51FD568;
    v11[4] = v8;
    v11[5] = self;
    v11[6] = a3;
    v11[7] = a4;
    objc_msgSend(v9, "_fc_addUncancellableOperationForReactorID:block:", v10, v11);
  }
}

uint64_t __70__NSFileProviderXPCMessenger_cancelProvidingItemAtURL_forClaimWithID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 40) + 8) _cancelProvidingItemAtURL:*(void *)(a1 + 48) toReaderWithID:*(void *)(a1 + 56)];
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)providePhysicalItemForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_fileProvider)
  {
    id v7 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    id v8 = _NSFCProviderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v7;
      _os_log_impl(&dword_181795000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ providing physical URL", buf, 0xCu);
    }
    id v9 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_fileProvider withDescription:@"Provide Physical URL"];
    id v10 = (void *)[(NSFileProvider *)self->_fileProvider _providedItemsOperationQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke;
    v12[3] = &unk_1E51FD950;
    v12[4] = v9;
    void v12[5] = self;
    v12[6] = a3;
    v12[7] = a4;
    objc_msgSend(v10, "_fc_addUncancellableOperationForReactorID:block:", v7, v12);
  }
  else
  {
    long long v11 = (void (*)(id, void))*((void *)a4 + 2);
    v11(a4, 0);
  }
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didBegin];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  int v6 = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2;
  id v7 = &unk_1E51FCA38;
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v2;
  uint64_t v10 = *(void *)(a1 + 56);
  if (objc_opt_respondsToSelector()) {
    return ((uint64_t (*)(uint64_t *, uint64_t))v6)(&v4, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "_physicalURLForURL:", *(void *)(a1 + 48), v4, v5));
  }
  if (objc_opt_respondsToSelector()) {
    return [*(id *)(*(void *)(a1 + 40) + 8) _getPhysicalURLForURL:*(void *)(a1 + 48) completionHandler:&v4];
  }
  return ((uint64_t (*)(uint64_t *, void))v6)(&v4, 0);
}

void __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v7[7] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) willEnd];
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3;
  v7[3] = &unk_1E51FD680;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[5] = a2;
  v7[6] = v6;
  v7[4] = v5;
  dispatch_async(v4, v7);
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didEnd];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4;
  v3[3] = &unk_1E51F7EE0;
  long long v4 = *(_OWORD *)(a1 + 40);
  return +[NSFileCoordinator _performBarrierAsync:v3];
}

uint64_t __74__NSFileProviderXPCMessenger_providePhysicalItemForURL_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)observePresentationChangeOfKind:(id)a3 forPresenterOfURL:(id)a4 withInfo:(id)a5
{
  v13[10] = *MEMORY[0x1E4F143B8];
  if (self->_fileProvider)
  {
    id v9 = [+[NSProcessInfo processInfo] beginActivityWithOptions:0x80000000000 reason:@"Sending an NSFileProvider an observePresentationChangeOfKind: message"];
    id v10 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_fileProvider withDescription:@"Observe Presentation Change"];
    uint64_t v11 = (void *)[(NSFileProvider *)self->_fileProvider _providedItemsOperationQueue];
    id v12 = +[NSFileAccessArbiterProxy _idForReactor:self->_fileProvider];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke;
    v13[3] = &unk_1E51FD590;
    v13[4] = v10;
    v13[5] = a3;
    v13[6] = self;
    v13[7] = a4;
    v13[8] = a5;
    void v13[9] = v9;
    objc_msgSend(v11, "_fc_addUncancellableOperationForReactorID:block:", v12, v13);
  }
}

void __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didBegin];
  if ([*(id *)(a1 + 40) isEqualToString:@"added"])
  {
    if (objc_opt_respondsToSelector())
    {
      [*(id *)(*(void *)(a1 + 48) + 8) _providedItemAtURL:*(void *)(a1 + 56) didGainPresenterWithInfo:*(void *)(a1 + 64)];
    }
    else if (objc_opt_respondsToSelector())
    {
      uint64_t v2 = *(void **)(a1 + 64);
      if (v2)
      {
        [v2 presenterAuditToken];
        uint64_t v3 = DWORD1(v8);
        uint64_t v2 = *(void **)(a1 + 64);
      }
      else
      {
        uint64_t v3 = 0;
        long long v7 = 0u;
        long long v8 = 0u;
      }
      +[NSFileCoordinator _addProcessIdentifier:observedUbiquityAttributes:forID:](NSFileCoordinator, "_addProcessIdentifier:observedUbiquityAttributes:forID:", v3, [v2 observedUbiquityAttributes], objc_msgSend(*(id *)(a1 + 64), "presenterID"));
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "_providedItemAtURL:didGainPresenterWithID:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    }
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"removed"])
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "_providedItemAtURL:didLosePresenterWithID:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"));
    }
    +[NSFileCoordinator _removeInfoForID:](NSFileCoordinator, "_removeInfoForID:", [*(id *)(a1 + 64) presenterID]);
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"itemMoved"] {
         && (objc_opt_respondsToSelector() & 1) != 0)
  }
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "_providedItemAtURL:withPresenterWithID:didMoveToURL:", *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 64), "presenterID"), objc_msgSend(*(id *)(a1 + 64), "changedURL"));
  }
  [*(id *)(a1 + 32) willEnd];
  long long v4 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2;
  v6[3] = &unk_1E51F6678;
  uint64_t v5 = *(void *)(a1 + 72);
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v5;
  dispatch_async(v4, v6);
}

uint64_t __89__NSFileProviderXPCMessenger_observePresentationChangeOfKind_forPresenterOfURL_withInfo___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) didEnd];
  uint64_t v2 = +[NSProcessInfo processInfo];
  uint64_t v3 = *(void *)(a1 + 40);

  return [(NSProcessInfo *)v2 endActivity:v3];
}

- (void)observeEndOfWriteAtURL:(id)a3 forClaimWithID:(id)a4 fromProcessWithIdentifier:(int)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_fileProvider)
  {
    id v9 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    id v10 = _NSFCProviderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = a4;
      _os_log_impl(&dword_181795000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ observing end of writing claim %{public}@", buf, 0x16u);
    }
    id v11 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_fileProvider withDescription:@"Observe End Of Write"];
    id v12 = (void *)[(NSFileProvider *)self->_fileProvider _providedItemsOperationQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke;
    v13[3] = &unk_1E51FD978;
    v13[4] = v11;
    v13[5] = self;
    int v14 = a5;
    v13[6] = a4;
    v13[7] = a3;
    objc_msgSend(v12, "_fc_addUncancellableOperationForReactorID:block:", v9, v13);
  }
}

uint64_t __94__NSFileProviderXPCMessenger_observeEndOfWriteAtURL_forClaimWithID_fromProcessWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didBegin];
  if (objc_opt_respondsToSelector())
  {
    +[NSFileCoordinator _addProcessIdentifier:*(unsigned int *)(a1 + 64) observedUbiquityAttributes:0 forID:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 8) _writerWithID:*(void *)(a1 + 48) didFinishWritingForURL:*(void *)(a1 + 56)];
    +[NSFileCoordinator _removeInfoForID:*(void *)(a1 + 48)];
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didEnd];
}

- (void)movingItemAtURL:(id)a3 withInfo:(id)a4 fileName:(id)a5 completionHandler:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_fileProvider)
  {
    id v11 = +[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:");
    id v12 = _NSFCProviderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_181795000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ checking if moving an item within its container requires providing", buf, 0xCu);
    }
    id v13 = +[NSFileAccessArbiterProxy _willBeginOperationForReactor:self->_fileProvider withDescription:@"Check Moving Requires Providing"];
    int v14 = (void *)[(NSFileProvider *)self->_fileProvider _providedItemsOperationQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke;
    v17[3] = &unk_1E51FD9C8;
    v17[4] = v13;
    v17[5] = v11;
    v17[9] = a5;
    v17[10] = a6;
    v17[6] = self;
    v17[7] = a3;
    v17[8] = a4;
    objc_msgSend(v14, "_fc_addUncancellableOperationForReactorID:block:", v11, v17);
  }
  else
  {
    id v15 = +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:](NSFileProviderMovingResponse, "providingNotRequiredResponseWithSyncRootID:", 0, a4, a5);
    id v16 = (void (*)(id, id))*((void *)a6 + 2);
    v16(a6, v15);
  }
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didBegin];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2;
  id v10 = &unk_1E51FD9A0;
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = v2;
  if (objc_opt_respondsToSelector()) {
    return [*(id *)(*(void *)(a1 + 48) + 8) _movingItemAtURL:*(void *)(a1 + 56) withInfo:*(void *)(a1 + 64) completionHandler:v8];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return ((uint64_t (*)(void *, id))v9)(v8, +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:0]);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void **)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "destinationDirectoryURL"), "URLByAppendingPathComponent:isDirectory:", *(void *)(a1 + 72), 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_773;
  v7[3] = &unk_1E51FD1F8;
  v7[4] = v8;
  return [v5 _movingItemAtURL:v4 requiresProvidingWithDestinationURL:v6 completionHandler:v7];
}

void __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = a2;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ responded to moving check with: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 40) willEnd];
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_768;
  block[3] = &unk_1E51F7DF0;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  block[4] = a2;
  block[5] = v8;
  block[6] = v7;
  dispatch_async(v6, block);
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_768(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 didEnd];
}

uint64_t __82__NSFileProviderXPCMessenger_movingItemAtURL_withInfo_fileName_completionHandler___block_invoke_2_773(uint64_t a1, int a2)
{
  if (a2) {
    +[NSFileProviderMovingResponse providingRequiredResponse];
  }
  else {
    +[NSFileProviderMovingResponse providingNotRequiredResponseWithSyncRootID:-1];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)collectDebuggingInformationWithCompletionHandler:(id)a3
{
  id v4 = +[NSFileAccessArbiterProxy _fileReactorDebuggingInformation];
  uint64_t v5 = (void (*)(id, id))*((void *)a3 + 2);

  v5(a3, v4);
}

@end