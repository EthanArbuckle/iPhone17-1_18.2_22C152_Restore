@interface CAMNebulaKeepAliveController
- (BOOL)_didCreateKeepAliveDirectory;
- (CAMNebulaKeepAliveController)init;
- (NSMutableSet)_nebuladKeepAliveIdentifiers;
- (OS_dispatch_queue)_syncQueue;
- (id)_keepAliveFilePath;
- (int)_nebuladKeepAliveFileDescriptor;
- (void)_setDidCreateKeepAliveDirectory:(BOOL)a3;
- (void)_setNebuladKeepAliveFileDescriptor:(int)a3;
- (void)removeKeepAliveFileIfNotKeptForAnyIdentifiers;
- (void)startKeepAliveForIdentifier:(id)a3;
- (void)stopKeepAliveForIdentifier:(id)a3;
@end

@implementation CAMNebulaKeepAliveController

- (CAMNebulaKeepAliveController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CAMNebulaKeepAliveController;
  v2 = [(CAMNebulaKeepAliveController *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.nebula.keep-alive", v3);
    syncQueue = v2->__syncQueue;
    v2->__syncQueue = (OS_dispatch_queue *)v4;

    v6 = [(CAMNebulaKeepAliveController *)v2 _syncQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CAMNebulaKeepAliveController_init__block_invoke;
    block[3] = &unk_263FA0208;
    v7 = v2;
    v11 = v7;
    dispatch_sync(v6, block);

    v8 = v7;
  }

  return v2;
}

uint64_t __36__CAMNebulaKeepAliveController_init__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = -1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_keepAliveFilePath
{
  uint64_t v3 = [MEMORY[0x263F5DB20] nebuladkeepalivepath];
  uint64_t v4 = [v3 stringByDeletingLastPathComponent];
  if (![(CAMNebulaKeepAliveController *)self _didCreateKeepAliveDirectory])
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

    [(CAMNebulaKeepAliveController *)self _setDidCreateKeepAliveDirectory:1];
  }

  return v3;
}

- (void)startKeepAliveForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(CAMNebulaKeepAliveController *)self _syncQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__CAMNebulaKeepAliveController_startKeepAliveForIdentifier___block_invoke;
    v6[3] = &unk_263FA0408;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __60__CAMNebulaKeepAliveController_startKeepAliveForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _nebuladKeepAliveFileDescriptor] & 0x80000000) != 0)
  {
    id v2 = [*(id *)(a1 + 32) _keepAliveFilePath];
    uint64_t v3 = open((const char *)[v2 fileSystemRepresentation], 641, 438);
    if ((v3 & 0x80000000) != 0)
    {
      id v4 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = __error();
        v6 = strerror(*v5);
        *(_DWORD *)buf = 138543618;
        id v9 = v2;
        __int16 v10 = 2080;
        v11 = v6;
        _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Error opening keep alive file at path: %{public}@, error: %s", buf, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) _setNebuladKeepAliveFileDescriptor:v3];
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)stopKeepAliveForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(CAMNebulaKeepAliveController *)self _syncQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __59__CAMNebulaKeepAliveController_stopKeepAliveForIdentifier___block_invoke;
    v6[3] = &unk_263FA0408;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

void __59__CAMNebulaKeepAliveController_stopKeepAliveForIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    int v2 = [*(id *)(a1 + 32) _nebuladKeepAliveFileDescriptor];
    [*(id *)(a1 + 32) _setNebuladKeepAliveFileDescriptor:0xFFFFFFFFLL];
    uint64_t v3 = [*(id *)(a1 + 32) _keepAliveFilePath];
    flock(v2, 8);
    close(v2);
    id v4 = v3;
    unlink((const char *)[v4 fileSystemRepresentation]);
  }
}

- (void)removeKeepAliveFileIfNotKeptForAnyIdentifiers
{
  uint64_t v3 = [(CAMNebulaKeepAliveController *)self _syncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CAMNebulaKeepAliveController_removeKeepAliveFileIfNotKeptForAnyIdentifiers__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __77__CAMNebulaKeepAliveController_removeKeepAliveFileIfNotKeptForAnyIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    [*(id *)(a1 + 32) _setNebuladKeepAliveFileDescriptor:0xFFFFFFFFLL];
    int v2 = [*(id *)(a1 + 32) _keepAliveFilePath];
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    int v4 = [v3 fileExistsAtPath:v2];

    if (v4)
    {
      v5 = [MEMORY[0x263F08850] defaultManager];
      id v9 = 0;
      char v6 = [v5 removeItemAtPath:v2 error:&v9];
      id v7 = v9;

      if ((v6 & 1) == 0)
      {
        v8 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v11 = v2;
          __int16 v12 = 2114;
          id v13 = v7;
          _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Error removing keep alive file at path: %{public}@, error: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (OS_dispatch_queue)_syncQueue
{
  return self->__syncQueue;
}

- (int)_nebuladKeepAliveFileDescriptor
{
  return self->__nebuladKeepAliveFileDescriptor;
}

- (void)_setNebuladKeepAliveFileDescriptor:(int)a3
{
  self->__nebuladKeepAliveFileDescriptor = a3;
}

- (NSMutableSet)_nebuladKeepAliveIdentifiers
{
  return self->__nebuladKeepAliveIdentifiers;
}

- (BOOL)_didCreateKeepAliveDirectory
{
  return self->__didCreateKeepAliveDirectory;
}

- (void)_setDidCreateKeepAliveDirectory:(BOOL)a3
{
  self->__didCreateKeepAliveDirectory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebuladKeepAliveIdentifiers, 0);
  objc_storeStrong((id *)&self->__syncQueue, 0);
}

@end