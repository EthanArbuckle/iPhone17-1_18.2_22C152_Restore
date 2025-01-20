@interface LiveFSVolumeManager
+ (id)newServiceProxyObjectWithDelegate:(id)a3;
- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 andProxy:(id)a6 withDescription:(id)a7;
- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 queue:(id)a6 proxy:(id)a7 description:(id)a8;
- (id)addVolumeCluster:(id)a3;
- (id)descriptionForVolume:(id)a3;
- (id)getUniqueVolumeName:(id)a3;
- (id)initServiceProxyObjectWithDelegate:(id)a3;
- (id)removeVolumeCluster:(id)a3;
- (id)volumeProxyForVolume:(id)a3;
- (void)LiveMountEjectVolumeCluster:(id)a3 withFlags:(unsigned int)a4 reply:(id)a5;
- (void)addDisk:(id)a3 fileSystemType:(id)a4 reply:(id)a5;
- (void)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7;
- (void)addVolume:(id)a3 listener:(id)a4 description:(id)a5 reply:(id)a6;
- (void)credentialTypes:(id)a3;
- (void)dealloc;
- (void)ejectDisk:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5;
- (void)ejectVolume:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5;
- (void)initializationFinished;
- (void)listVolumes:(id)a3;
- (void)listenerForVolume:(id)a3 reply:(id)a4;
- (void)removeVolume:(id)a3;
- (void)removeVolumeLocked:(id)a3;
- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 reply:(id)a6;
- (void)uniqueNameForName:(id)a3 reply:(id)a4;
- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation LiveFSVolumeManager

- (id)initServiceProxyObjectWithDelegate:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSVolumeManager;
  v6 = [(LiveFSVolumeManager *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v6->delegate, a3);
  uint64_t v8 = objc_opt_new();
  listeners = v7->listeners;
  v7->listeners = (NSMutableDictionary *)v8;

  uint64_t v10 = objc_opt_new();
  descriptions = v7->descriptions;
  v7->descriptions = (NSMutableDictionary *)v10;

  uint64_t v12 = objc_opt_new();
  l = v7->l;
  v7->l = (NSCondition *)v12;

  v7->_initDone = 0;
  if (!v7->l) {
    goto LABEL_6;
  }
  if (v7->listeners && v7->descriptions) {
LABEL_5:
  }
    v14 = v7;
  else {
LABEL_6:
  }
    v14 = 0;

  return v14;
}

- (void)dealloc
{
  listeners = self->listeners;
  self->listeners = 0;

  l = self->l;
  self->l = 0;

  descriptions = self->descriptions;
  self->descriptions = 0;

  delegate = self->delegate;
  self->delegate = 0;

  v7.receiver = self;
  v7.super_class = (Class)LiveFSVolumeManager;
  [(LiveFSVolumeManager *)&v7 dealloc];
}

+ (id)newServiceProxyObjectWithDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initServiceProxyObjectWithDelegate:v4];

  return v5;
}

- (void)initializationFinished
{
  self->_initDone = 1;
}

- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 queue:(id)a6 proxy:(id)a7 description:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  [(NSCondition *)self->l lock];
  v19 = [(NSMutableDictionary *)self->listeners objectForKey:v14];

  if (v19)
  {
    v20 = getNSErrorFromLiveFSErrno(17);
  }
  else
  {
    id v21 = [[anonymousDaemon alloc] initUsingInterface:v15 clientClass:a5 queue:v16 andProxy:v17];
    [(NSMutableDictionary *)self->listeners setObject:v21 forKey:v14];
    [(NSMutableDictionary *)self->descriptions setObject:v18 forKey:v14];

    v20 = 0;
  }
  [(NSCondition *)self->l unlock];

  return v20;
}

- (id)addVolume:(id)a3 usingInterface:(id)a4 connectionClass:(Class)a5 andProxy:(id)a6 withDescription:(id)a7
{
  return [(LiveFSVolumeManager *)self addVolume:a3 usingInterface:a4 connectionClass:a5 queue:0 proxy:a6 description:a7];
}

- (id)getUniqueVolumeName:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->listeners objectForKey:v4];

  v6 = v4;
  if (v5)
  {
    uint64_t v7 = 1;
    uint64_t v8 = v4;
    do
    {
      v6 = objc_msgSend(v4, "stringByAppendingFormat:", @" %llu", v7);

      ++v7;
      v9 = [(NSMutableDictionary *)self->listeners objectForKey:v6];

      uint64_t v8 = v6;
    }
    while (v9);
  }

  return v6;
}

- (id)addVolumeCluster:(id)a3
{
  id v4 = a3;
  [(NSCondition *)self->l lock];
  id v5 = [(NSMutableDictionary *)self->listeners objectForKey:v4];

  if (v5)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:17 userInfo:0];
  }
  else
  {
    [(NSMutableDictionary *)self->descriptions setObject:@"volumeCluster" forKey:v4];
  }
  [(NSCondition *)self->l unlock];

  return v5;
}

- (id)removeVolumeCluster:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  descriptions = self->descriptions;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __43__LiveFSVolumeManager_removeVolumeCluster___block_invoke;
  id v18 = &unk_264DC7978;
  id v7 = v4;
  id v19 = v7;
  uint64_t v20 = v5;
  uint64_t v8 = [(NSMutableDictionary *)descriptions keysOfEntriesPassingTest:&v15];
  v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->descriptions;
    *(_DWORD *)buf = 136315906;
    v22 = "-[LiveFSVolumeManager removeVolumeCluster:]";
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_23AB0B000, v9, OS_LOG_TYPE_DEFAULT, "%s Got cluster prefix '%@' and clusterVolumes %@ from volumes %@", buf, 0x2Au);
  }

  if (objc_msgSend(v8, "count", v15, v16, v17, v18)
    || ([(NSMutableDictionary *)self->descriptions objectForKey:v7],
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:0];
    uint64_t v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[LiveFSVolumeManager removeVolumeCluster:]";
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_23AB0B000, v12, OS_LOG_TYPE_DEFAULT, "%s err (%@)", buf, 0x16u);
    }
  }
  else
  {
    [(NSMutableDictionary *)self->descriptions removeObjectForKey:v7];
    v11 = 0;
  }

  return v11;
}

BOOL __43__LiveFSVolumeManager_removeVolumeCluster___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 hasPrefix:*(void *)(a1 + 32)]) {
    BOOL v5 = (unint64_t)[v4 length] > *(void *)(a1 + 40);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)removeVolumeLocked:(id)a3
{
  descriptions = self->descriptions;
  id v5 = a3;
  [(NSMutableDictionary *)descriptions removeObjectForKey:v5];
  [(NSMutableDictionary *)self->listeners removeObjectForKey:v5];
}

- (void)removeVolume:(id)a3
{
  l = self->l;
  id v5 = a3;
  [(NSCondition *)l lock];
  [(LiveFSVolumeManager *)self removeVolumeLocked:v5];

  v6 = self->l;

  [(NSCondition *)v6 unlock];
}

- (id)descriptionForVolume:(id)a3
{
  l = self->l;
  id v5 = a3;
  [(NSCondition *)l lock];
  v6 = [(NSMutableDictionary *)self->descriptions objectForKey:v5];

  [(NSCondition *)self->l unlock];

  return v6;
}

- (void)listVolumes:(id)a3
{
  l = self->l;
  id v5 = (void (**)(id, NSMutableDictionary *))a3;
  [(NSCondition *)l lock];
  v5[2](v5, self->descriptions);

  v6 = self->l;

  [(NSCondition *)v6 unlock];
}

- (void)listenerForVolume:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  [(NSCondition *)self->l lock];
  uint64_t v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v26 = [v6 UTF8String];
    _os_log_impl(&dword_23AB0B000, v8, OS_LOG_TYPE_DEFAULT, "Getting listener for volume: %s", buf, 0xCu);
  }

  v9 = [(NSMutableDictionary *)self->listeners objectForKey:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    v11 = [v9 listener];

    if (v11)
    {
      uint64_t v12 = [v10 listener];
      v13 = [v12 endpoint];
    }
    else
    {
      v13 = [v10 endpoint];
    }
    v7[2](v7, v13, 0);
  }
  else
  {
    id v14 = (void *)MEMORY[0x263F087E8];
    if (self->_initDone)
    {
      uint64_t v15 = *MEMORY[0x263F07F70];
      uint64_t v23 = *MEMORY[0x263F08068];
      id v24 = v6;
      v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v19 = *MEMORY[0x263F08438];
      uint64_t v21 = *MEMORY[0x263F08068];
      id v22 = v6;
      v13 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v16 = v14;
      uint64_t v17 = v19;
      uint64_t v18 = 35;
    }
    uint64_t v20 = [v16 errorWithDomain:v17 code:v18 userInfo:v13];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v20);
  }
  [(NSCondition *)self->l unlock];
}

- (void)LiveMountEjectVolumeCluster:(id)a3 withFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(NSCondition *)self->l lock];
    id v10 = v8;
    uint64_t v11 = [v10 length];
    descriptions = self->descriptions;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke;
    v29[3] = &unk_264DC7978;
    id v13 = v10;
    id v30 = v13;
    uint64_t v31 = v11;
    id v14 = [(NSMutableDictionary *)descriptions keysOfEntriesPassingTest:v29];
    uint64_t v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = self->descriptions;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2112;
      v33 = v14;
      LOWORD(v34) = 2112;
      *(void *)((char *)&v34 + 2) = v16;
      WORD5(v34) = 1024;
      HIDWORD(v34) = v6;
      _os_log_impl(&dword_23AB0B000, v15, OS_LOG_TYPE_DEFAULT, "%s Got cluster prefix '%@' and clusterVolumes %@ from volumes %@ eject how %u", buf, 0x30u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy__1;
    *(void *)&long long v34 = __Block_byref_object_dispose__1;
    *((void *)&v34 + 1) = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__1;
    uint64_t v27 = __Block_byref_object_dispose__1;
    unint64_t v17 = 0;
    dispatch_group_t v28 = dispatch_group_create();
    while ([v14 count] > v17)
    {
      dispatch_group_enter((dispatch_group_t)v24[5]);
      ++v17;
    }
    [(NSCondition *)self->l unlock];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_113;
    v21[3] = &unk_264DC79C8;
    int v22 = v6;
    v21[4] = self;
    v21[5] = buf;
    v21[6] = &v23;
    [v14 enumerateObjectsWithOptions:1 usingBlock:v21];
    dispatch_group_wait((dispatch_group_t)v24[5], 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v9[2](v9);
    }
    else
    {
      [(NSCondition *)self->l lock];
      uint64_t v19 = [(LiveFSVolumeManager *)self removeVolumeCluster:v13];
      uint64_t v20 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v19;

      [(NSCondition *)self->l unlock];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:]((uint64_t)v13, (uint64_t)&buf[8]);
        }
        ((void (*)(void (**)(void), void))v9[2])(v9, *(void *)(*(void *)&buf[8] + 40));
      }
      else
      {
        [(LiveFSVolumeManagerDelegate *)self->delegate LiveMountService:self ejectVolumeCluster:v13 withFlags:v6 reply:v9];
      }
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:45 userInfo:0];
    ((void (*)(void (**)(void), void *))v9[2])(v9, v18);
  }
}

BOOL __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 hasPrefix:*(void *)(a1 + 32)]) {
    BOOL v5 = (unint64_t)[v4 length] > *(void *)(a1 + 40);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

void __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 32) lock];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v3];
  BOOL v5 = [v4 proxy];
  [*(id *)(*(void *)(a1 + 32) + 32) unlock];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  uint64_t v8 = *(unsigned int *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_2;
  v10[3] = &unk_264DC79A0;
  v10[4] = v6;
  id v11 = v3;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v9 = v3;
  [v7 LiveMountService:v6 ejectVolume:v5 named:v9 withFlags:v8 reply:v10];
}

void __67__LiveFSVolumeManager_LiveMountEjectVolumeCluster_withFlags_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else {
    [*(id *)(a1 + 32) removeVolume:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (void)ejectVolume:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  [(NSCondition *)self->l lock];
  id v10 = [(NSMutableDictionary *)self->listeners objectForKey:v8];

  if (!v10)
  {
    uint64_t v15 = [(NSMutableDictionary *)self->descriptions objectForKey:v8];
    id v11 = v15;
    if (v15 && [v15 isEqualToString:@"volumeCluster"])
    {
      [(NSCondition *)self->l unlock];
      [(LiveFSVolumeManager *)self LiveMountEjectVolumeCluster:v8 withFlags:v6 reply:v9];
    }
    else
    {
      uint64_t v16 = getNSErrorFromLiveFSErrno(2);
      v9[2](v9, v16);

      [(NSCondition *)self->l unlock];
    }
    goto LABEL_10;
  }
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = [(NSMutableDictionary *)self->listeners objectForKey:v8];
    long long v12 = [v11 proxy];
    [(NSCondition *)self->l unlock];
    delegate = self->delegate;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__LiveFSVolumeManager_ejectVolume_usingFlags_reply___block_invoke;
    v17[3] = &unk_264DC79F0;
    v17[4] = self;
    id v18 = v8;
    uint64_t v19 = v9;
    [(LiveFSVolumeManagerDelegate *)delegate LiveMountService:self ejectVolume:v12 named:v18 withFlags:v6 reply:v17];

LABEL_10:
    goto LABEL_11;
  }
  id v14 = getNSErrorFromLiveFSErrno(45);
  v9[2](v9, v14);

  [(NSCondition *)self->l unlock];
LABEL_11:
}

void __52__LiveFSVolumeManager_ejectVolume_usingFlags_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [*(id *)(a1 + 32) removeVolume:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 reply:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void, void *))a6;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(LiveFSVolumeManagerDelegate *)self->delegate LiveMountService:self sharesAtServer:v13 credentialType:a4 credential:v10 reply:v11];
  }
  else
  {
    long long v12 = getNSErrorFromLiveFSErrno(45);
    v11[2](v11, 0, v12);
  }
}

- (void)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, void *))a7;
  [(NSCondition *)self->l lock];
  uint64_t v16 = [(NSMutableDictionary *)self->descriptions objectForKey:v12];

  if (v16)
  {
    int v17 = 17;
LABEL_7:
    uint64_t v19 = getNSErrorFromLiveFSErrno(v17);
    v15[2](v15, v19);

    goto LABEL_8;
  }
  if (!self->delegate || (objc_opt_respondsToSelector() & 1) == 0)
  {
    int v17 = 45;
    goto LABEL_7;
  }
  [(NSCondition *)self->l unlock];
  delegate = self->delegate;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__LiveFSVolumeManager_addVolume_atServer_credentialType_credential_reply___block_invoke;
  v20[3] = &unk_264DC79F0;
  v20[4] = self;
  id v21 = v12;
  int v22 = v15;
  [(LiveFSVolumeManagerDelegate *)delegate LiveMountService:self addVolume:v21 atServer:v13 credentialType:a5 credential:v14 reply:v20];
  [(NSCondition *)self->l lock];

LABEL_8:
  [(NSCondition *)self->l unlock];
}

void __74__LiveFSVolumeManager_addVolume_atServer_credentialType_credential_reply___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1[4] + 32) lock];
    [*(id *)(a1[4] + 24) removeObjectForKey:a1[5]];
    [*(id *)(a1[4] + 32) unlock];
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)addDisk:(id)a3 fileSystemType:(id)a4 reply:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(LiveFSVolumeManagerDelegate *)self->delegate LiveMountService:self addDisk:v11 fileSystemType:v8 reply:v9];
  }
  else
  {
    id v10 = getNSErrorFromLiveFSErrno(45);
    v9[2](v9, v10, 0);
  }
}

- (void)ejectDisk:(id)a3 usingFlags:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    int v17 = __Block_byref_object_copy__1;
    id v18 = __Block_byref_object_dispose__1;
    id v19 = 0;
    id v10 = getNSErrorFromLiveFSErrno(19);
    [(NSCondition *)self->l lock];
    delegate = self->delegate;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__LiveFSVolumeManager_ejectDisk_usingFlags_reply___block_invoke;
    v13[3] = &unk_264DC7548;
    v13[4] = &v14;
    [(LiveFSVolumeManagerDelegate *)delegate LiveMountService:self ejectDisk:v8 usingFlags:v6 reply:v13];
    id v12 = (id)v15[5];

    [(NSCondition *)self->l unlock];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    getNSErrorFromLiveFSErrno(45);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9[2](v9, v12);
}

void __50__LiveFSVolumeManager_ejectDisk_usingFlags_reply___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)volumeProxyForVolume:(id)a3
{
  l = self->l;
  id v5 = a3;
  [(NSCondition *)l lock];
  uint64_t v6 = [(NSMutableDictionary *)self->listeners objectForKey:v5];

  if (v6)
  {
    id v7 = [v6 proxy];
  }
  else
  {
    id v7 = 0;
  }
  [(NSCondition *)self->l unlock];

  return v7;
}

- (void)credentialTypes:(id)a3
{
}

- (void)addVolume:(id)a3 listener:(id)a4 description:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  l = self->l;
  uint64_t v14 = (void (**)(id, void *))a6;
  [(NSCondition *)l lock];
  uint64_t v15 = livefs_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSVolumeManager addVolume:listener:description:reply:](v15, v16, v17, v18, v19, v20, v21, v22);
  }

  uint64_t v23 = [(NSMutableDictionary *)self->listeners objectForKey:v10];

  if (v23)
  {
    id v24 = getNSErrorFromLiveFSErrno(17);
  }
  else
  {
    uint64_t v25 = [[anonymousDaemon alloc] initWithListener:v11];
    [(NSMutableDictionary *)self->listeners setObject:v25 forKey:v10];
    [(NSMutableDictionary *)self->descriptions setObject:v12 forKey:v10];

    id v24 = 0;
  }
  [(NSCondition *)self->l unlock];
  v14[2](v14, v24);
}

- (void)unlockVolume:(id)a3 password:(id)a4 saveToKeychain:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a6;
  if (self->delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(LiveFSVolumeManagerDelegate *)self->delegate LiveMountService:self unlockVolume:v13 password:v10 saveToKeychain:v7 completionHandler:v11];
  }
  else
  {
    id v12 = getNSErrorFromLiveFSErrno(45);
    v11[2](v11, v12);
  }
}

- (void)uniqueNameForName:(id)a3 reply:(id)a4
{
  l = self->l;
  BOOL v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  [(NSCondition *)l lock];
  id v9 = [(LiveFSVolumeManager *)self getUniqueVolumeName:v8];

  [(NSCondition *)self->l unlock];
  v7[2](v7, v9, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->l, 0);
  objc_storeStrong((id *)&self->descriptions, 0);
  objc_storeStrong((id *)&self->listeners, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

- (void)LiveMountEjectVolumeCluster:(uint64_t)a1 withFlags:(uint64_t)a2 reply:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a2 + 40);
  int v3 = 136315650;
  id v4 = "-[LiveFSVolumeManager LiveMountEjectVolumeCluster:withFlags:reply:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  _os_log_error_impl(&dword_23AB0B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s Error deleting volume cluster (%@): %@", (uint8_t *)&v3, 0x20u);
}

- (void)addVolume:(uint64_t)a3 listener:(uint64_t)a4 description:(uint64_t)a5 reply:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end