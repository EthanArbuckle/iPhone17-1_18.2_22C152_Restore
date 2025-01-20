@interface NSFileProviderProxy
- (BOOL)allowedForURL:(id)a3;
- (BOOL)wantsWriteNotifications;
- (NSFileProviderProxy)initWithClient:(id)a3 remoteProvider:(id)a4 reactorID:(id)a5 secureID:(id)a6 uniqueID:(id)a7;
- (NSFileProviderXPCInterface)remoteProvider;
- (NSString)secureID;
- (NSUUID)uniqueID;
- (id)_clientProxy;
- (id)provideItemAtURL:(id)a3 withOptions:(unint64_t)a4 forAccessClaim:(id)a5 completionHandler:(id)a6;
- (id)provideItemForKernelRequestWithInfo:(id)a3 atURL:(id)a4 forProcess:(id *)a5 withOptions:(unint64_t)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)forwardUsingProxy:(id)a3;
- (void)invalidate;
- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationDirectoryURL:(id)a4 newFileName:(id)a5 completionHandler:(id)a6;
- (void)observeEndOfWriteAtLocation:(id)a3 forAccessClaim:(id)a4;
- (void)observePresentationChangeOfKind:(id)a3 withPresenter:(id)a4 url:(id)a5 newURL:(id)a6;
- (void)provideLogicalURLForURL:(id)a3 completionHandler:(id)a4;
- (void)providePhysicalURLForURL:(id)a3 completionHandler:(id)a4;
- (void)setItemLocation:(id)a3;
- (void)setWantsWriteNotifications:(BOOL)a3;
@end

@implementation NSFileProviderProxy

- (NSFileProviderProxy)initWithClient:(id)a3 remoteProvider:(id)a4 reactorID:(id)a5 secureID:(id)a6 uniqueID:(id)a7
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSFileProviderProxy;
  v10 = [(NSFileReactorProxy *)&v12 initWithClient:a3 reactorID:a5];
  if (v10)
  {
    v10->_remoteProvider = (NSFileProviderXPCInterface *)a4;
    v10->_uniqueID = (NSUUID *)[a7 copy];
    v10->_secureID = (NSString *)[a6 copy];
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderProxy;
  [(NSFileReactorProxy *)&v3 dealloc];
}

- (id)_clientProxy
{
  return self->_remoteProvider;
}

- (void)setItemLocation:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  itemLocation = self->super._itemLocation;
  if (a3 && itemLocation)
  {
    v6 = _NSFCProviderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_181795000, v6, OS_LOG_TYPE_DEFAULT, "[NSFileProviderProxy setItemLocation:] was invoked for a provider proxy that already has a location. Ignoring it.", buf, 2u);
    }
  }
  else
  {
    if (itemLocation) {
      [(NSFileAccessNode *)itemLocation forEachPresenterOfItemOrContainedItemPerformProcedure:&__block_literal_global_205_0];
    }
    v7 = self;
    [(NSFileAccessNode *)self->super._itemLocation removeProvider:self];
    if ([a3 setProvider:self])
    {
      self->super._itemLocation = (NSFileAccessNode *)a3;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__NSFileProviderProxy_setItemLocation___block_invoke_2;
      v8[3] = &unk_1E51FD428;
      v8[4] = self;
      [a3 forEachPresenterOfItemOrContainedItemPerformProcedure:v8];
    }
    else
    {
      self->super._itemLocation = 0;
    }
  }
}

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 observeNewProvider:0];
}

uint64_t __39__NSFileProviderProxy_setItemLocation___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "observePresentationChangeOfKind:withPresenter:url:newURL:", @"added", a2, objc_msgSend((id)objc_msgSend(a2, "itemLocation"), "url"), 0);
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 observeNewProvider:v4];
}

- (void)forwardUsingProxy:(id)a3
{
  forwardedMessenger = self->_forwardedMessenger;
  if (!forwardedMessenger)
  {
    forwardedMessenger = [[NSFileProviderXPCMessenger alloc] initWithFileProviderProxy:self];
    self->_forwardedMessenger = forwardedMessenger;
  }
  objc_msgSend(a3, "addProvider:withID:uniqueID:forProvidedItemsURL:options:withServer:reply:", forwardedMessenger, self->super._reactorID, self->_uniqueID, -[NSFileAccessNode url](self->super._itemLocation, "url"), 0, 0, &__block_literal_global_209_0);
}

- (void)invalidate
{
  self->_forwardedMessenger = 0;
}

- (BOOL)allowedForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([a3 isFileURL])
  {
    *(void *)v20 = 0;
    *(void *)&v20[8] = v20;
    *(void *)&v20[16] = 0x2020000000;
    char v21 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(NSFileReactorProxy *)self client];
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
    }
    id v8 = +[NSFileAccessArbiter entitlementForConnection:[(NSFileReactorProxy *)self client] key:@"application-identifier"];
    if (([v8 isEqualToString:@"com.apple.bird"] & 1) != 0
      || ([v8 isEqualToString:@"com.apple.fileprovider.fileproviderd"] & 1) != 0
      || (*(_OWORD *)buf = v18, *(_OWORD *)&buf[16] = v19, !sandbox_check_by_audit_token()))
    {
      *(unsigned char *)(*(void *)&v20[8] + 24) = 1;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      long long v15 = v18;
      long long v16 = v19;
      v14[2] = __37__NSFileProviderProxy_allowedForURL___block_invoke;
      v14[3] = &unk_1E51FDAB0;
      v14[4] = v20;
      +[NSFileReactorProxy _enumerateParentDirectoriesStartingAtURL:a3 usingBlock:v14];
      if (!*(unsigned char *)(*(void *)&v20[8] + 24))
      {
        v9 = _NSFCPresenterLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id reactorID = self->super._reactorID;
          int v11 = objc_msgSend(-[NSFileReactorProxy client](self, "client"), "processIdentifier");
          uint64_t v12 = [a3 path];
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = reactorID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v11;
          *(_WORD *)&buf[18] = 2113;
          *(void *)&buf[20] = v12;
          _os_log_impl(&dword_181795000, v9, OS_LOG_TYPE_DEFAULT, "Registering provider %{public}@ disallowed. Process %d is not allowed to access the requested path or any of its parent directories: %{private}@", buf, 0x1Cu);
        }
      }
    }
    BOOL v7 = *(unsigned char *)(*(void *)&v20[8] + 24) != 0;
    _Block_object_dispose(v20, 8);
  }
  else
  {
    v6 = _NSFCPresenterLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 138543619;
      *(void *)&v20[4] = self;
      *(_WORD *)&v20[12] = 2113;
      *(void *)&v20[14] = a3;
      _os_log_error_impl(&dword_181795000, v6, OS_LOG_TYPE_ERROR, "Registering provider %{public}@ disallowed. Only file URLs are allowed, unlike this one: %{private}@", v20, 0x16u);
    }
    return 0;
  }
  return v7;
}

uint64_t __37__NSFileProviderProxy_allowedForURL___block_invoke(uint64_t a1, void *a2, char *a3)
{
  uint64_t v8 = [a2 fileSystemRepresentation];
  char v6 = 1;
  uint64_t result = sandbox_check_by_audit_token();
  if (result)
  {
    uint64_t result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", 0, v8);
    char v6 = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  *a3 = v6;
  return result;
}

- (id)provideItemAtURL:(id)a3 withOptions:(unint64_t)a4 forAccessClaim:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [a5 claimID];
  uint64_t v12 = (void *)[a5 client];
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v27, 0, sizeof(v27));
  }
  uint64_t v13 = +[NSFileProvidingInfo infoWithReaderID:v11 options:a4 auditToken:v27 kernelMaterializationInfo:0];
  v14 = _NSFCProviderLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [a5 claimID];
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v15;
    __int16 v25 = 2114;
    id v26 = reactorID;
    _os_log_impl(&dword_181795000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ asking provider %{public}@ to provide", buf, 0x16u);
  }
  remoteProvider = self->_remoteProvider;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke;
  v22[3] = &unk_1E51FDC30;
  v22[4] = a3;
  v22[5] = a6;
  long long v18 = (void *)[(NSFileProviderXPCInterface *)remoteProvider remoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_226;
  v21[3] = &unk_1E51FDC58;
  v21[4] = self;
  v21[5] = a5;
  v21[6] = a6;
  [v18 provideItemAtURL:a3 withInfo:v13 completionHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_228;
  v20[3] = &unk_1E51FAD68;
  v20[4] = a5;
  v20[5] = self;
  v20[6] = a3;
  return (id)[v20 copy];
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    v9 = @"provide";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = +[NSFileProvidingResponse responseWithError:_NSErrorWithFilePath(256, *(void *)(a1 + 32))];
  return (*(uint64_t (**)(uint64_t, NSFileProvidingResponse *))(v5 + 16))(v5, v6);
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_226(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = [*(id *)(a1 + 40) claimID];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing for %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __85__NSFileProviderProxy_provideItemAtURL_withOptions_forAccessClaim_completionHandler___block_invoke_228(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) claimID];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled providing by %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "cancelProvidingItemAtURL:forClaimWithID:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "claimID"));
}

- (id)provideItemForKernelRequestWithInfo:(id)a3 atURL:(id)a4 forProcess:(id *)a5 withOptions:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [+[NSUUID UUID] UUIDString];
  long long v14 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a5->var0;
  *(_OWORD *)&buf[16] = v14;
  uint64_t v15 = +[NSFileProvidingInfo infoWithReaderID:v13 options:a6 auditToken:buf kernelMaterializationInfo:a3];
  long long v16 = _NSFCProviderLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = reactorID;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_181795000, v16, OS_LOG_TYPE_DEFAULT, "Kernel asking provider %{public}@ to provide %{private}@", buf, 0x16u);
  }
  remoteProvider = self->_remoteProvider;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke;
  v23[3] = &unk_1E51F7F08;
  v23[4] = a7;
  long long v19 = (void *)[(NSFileProviderXPCInterface *)remoteProvider remoteObjectProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_230;
  v22[3] = &unk_1E51FDC80;
  v22[4] = self;
  v22[5] = a7;
  [v19 provideItemAtURL:a4 withInfo:v15 completionHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_231;
  v21[3] = &unk_1E51FAD68;
  v21[4] = v13;
  v21[5] = self;
  v21[6] = a4;
  return (id)[v21 copy];
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
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

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_230(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing for kernel", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __106__NSFileProviderProxy_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler___block_invoke_231(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(a1[5] + 16);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled providing by %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1[5] + 56) cancelProvidingItemAtURL:a1[6] forClaimWithID:a1[4]];
}

- (void)providePhysicalURLForURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _NSFCProviderLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    id v14 = reactorID;
    _os_log_impl(&dword_181795000, v7, OS_LOG_TYPE_DEFAULT, "Asking provider %{public}@ to provide physical URL", buf, 0xCu);
  }
  remoteProvider = self->_remoteProvider;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke;
  v12[3] = &unk_1E51F7F08;
  v12[4] = a4;
  uint64_t v10 = (void *)[(NSFileProviderXPCInterface *)remoteProvider remoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_235;
  v11[3] = &unk_1E51FC998;
  v11[4] = self;
  v11[5] = a4;
  [v10 providePhysicalItemForURL:a3 completionHandler:v11];
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    uint64_t v7 = @"providePhysical";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_181795000, v4, OS_LOG_TYPE_ERROR, "Sending of a '%{public}@' message was interrupted: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__NSFileProviderProxy_providePhysicalURLForURL_completionHandler___block_invoke_235(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _NSFCProviderLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ finished providing physical URL", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)provideLogicalURLForURL:(id)a3 completionHandler:(id)a4
{
  if (!_CFURLIsItemPromiseAtURL())
  {
    uint64_t v7 = +[NSURLPromisePair pairWithLogicalURL:a3 physicalURL:0];
    goto LABEL_5;
  }
  uint64_t v6 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
  if (v6)
  {
    uint64_t v7 = +[NSURLPromisePair pairWithURL:v6];
LABEL_5:
    __int16 v8 = v7;
    goto LABEL_7;
  }
  __int16 v8 = 0;
LABEL_7:
  uint64_t v9 = (void (*)(id, NSURLPromisePair *))*((void *)a4 + 2);

  v9(a4, v8);
}

- (void)observePresentationChangeOfKind:(id)a3 withPresenter:(id)a4 url:(id)a5 newURL:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"added"]) {
    uint64_t v11 = [a4 observedUbiquityAttributes];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [a4 reactorID];
  uint64_t v13 = (void *)[a4 client];
  if (v13)
  {
    [v13 auditToken];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  id v14 = +[NSFileProviderPresenterInfo infoWithPresenterID:v12 auditToken:&v16 observedUbiquityAttributes:v11];
  uint64_t v15 = v14;
  if (a6) {
    [(NSFileProviderPresenterInfo *)v14 setChangedURL:a6];
  }
  -[NSFileProviderXPCInterface observePresentationChangeOfKind:forPresenterOfURL:withInfo:](self->_remoteProvider, "observePresentationChangeOfKind:forPresenterOfURL:withInfo:", a3, a5, v15, v16, v17);
}

- (void)observeEndOfWriteAtLocation:(id)a3 forAccessClaim:(id)a4
{
  if (self->_wantsWriteNotifications
    && (objc_msgSend((id)objc_msgSend(a4, "purposeID"), "isEqual:", self->super._reactorID) & 1) == 0)
  {
    uint64_t v7 = [a3 standardizedURL];
    uint64_t v8 = [a4 claimID];
    uint64_t v9 = [a4 clientProcessIdentifier];
    remoteProvider = self->_remoteProvider;
    [(NSFileProviderXPCInterface *)remoteProvider observeEndOfWriteAtURL:v7 forClaimWithID:v8 fromProcessWithIdentifier:v9];
  }
}

- (void)movingItemAtURL:(id)a3 requiresProvidingWithDestinationDirectoryURL:(id)a4 newFileName:(id)a5 completionHandler:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = +[NSFileProviderMovingInfo infoWithDestinationDirectoryURL:a4];
  uint64_t v11 = _NSFCProviderLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id reactorID = self->super._reactorID;
    *(_DWORD *)buf = 138543362;
    id v16 = reactorID;
    _os_log_impl(&dword_181795000, v11, OS_LOG_TYPE_DEFAULT, "Asking provider %{public}@ if moving item within its container requires providing", buf, 0xCu);
  }
  remoteProvider = self->_remoteProvider;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke;
  v14[3] = &unk_1E51FDCA8;
  v14[4] = self;
  void v14[5] = a6;
  [(NSFileProviderXPCInterface *)remoteProvider movingItemAtURL:a3 withInfo:v10 fileName:a5 completionHandler:v14];
}

uint64_t __114__NSFileProviderProxy_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _NSFCProviderLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = a2;
    _os_log_impl(&dword_181795000, v4, OS_LOG_TYPE_DEFAULT, "Provider %{public}@ responded to moving check: %@", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)secureID
{
  return self->_secureID;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSFileProviderXPCInterface)remoteProvider
{
  return self->_remoteProvider;
}

- (BOOL)wantsWriteNotifications
{
  return self->_wantsWriteNotifications;
}

- (void)setWantsWriteNotifications:(BOOL)a3
{
  self->_wantsWriteNotifications = a3;
}

@end