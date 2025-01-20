@interface MISystemAppState
+ (id)_systemAppStateFromURL:(id)a3;
+ (id)sharedList;
- (MISystemAppState)init;
- (NSMutableDictionary)systemAppStateList;
- (OS_dispatch_queue)appStateQueue;
- (id)_onQueue_retrieveSystemAppStateRestoringBackedUpState:(BOOL)a3;
- (id)_onQueue_systemAppStateList;
- (id)systemAppStateDictionaryRestoringBackedUpState:(BOOL)a3;
- (void)_onQueue_setSystemAppStateList:(id)a3;
- (void)addIdentifier:(id)a3 withState:(int)a4;
- (void)removeIdentifiers:(id)a3;
- (void)setSystemAppStateList:(id)a3;
@end

@implementation MISystemAppState

- (MISystemAppState)init
{
  v7.receiver = self;
  v7.super_class = (Class)MISystemAppState;
  v2 = [(MISystemAppState *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileInstallation.SystemAppStateQueue", v3);
    appStateQueue = v2->_appStateQueue;
    v2->_appStateQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)_systemAppStateFromURL:(id)a3
{
  id v3 = a3;
  id v15 = 0;
  dispatch_queue_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "MI_dictionaryWithContentsOfURL:options:error:", v3, 1, &v15);
  id v5 = v15;
  v6 = v5;
  if (!v4)
  {
    v10 = [v5 domain];
    if ([v10 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v11 = [v6 code];

      if (v11 == 260) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  if (MIDictionaryContainsOnlyClasses(v4, v7, v8))
  {
    id v9 = v4;
    goto LABEL_15;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
LABEL_13:
    v12 = [v3 path];
    MOLogWrite();
  }
LABEL_14:
  id v9 = (id)objc_opt_new();
LABEL_15:
  v13 = v9;

  return v13;
}

+ (id)sharedList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__MISystemAppState_sharedList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedList_onceToken != -1) {
    dispatch_once(&sharedList_onceToken, block);
  }
  v2 = (void *)sharedList_sharedList;
  return v2;
}

uint64_t __30__MISystemAppState_sharedList__block_invoke()
{
  sharedList_sharedList = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

- (id)_onQueue_systemAppStateList
{
  id v3 = [(MISystemAppState *)self appStateQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(MISystemAppState *)self systemAppStateList];
  if (!v4)
  {
    id v5 = +[MIDaemonConfiguration sharedInstance];
    v6 = [v5 systemAppInstallStateFilePath];

    dispatch_queue_t v4 = [(id)objc_opt_class() _systemAppStateFromURL:v6];
    [(MISystemAppState *)self setSystemAppStateList:v4];
  }
  return v4;
}

- (id)_onQueue_retrieveSystemAppStateRestoringBackedUpState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MISystemAppState *)self appStateQueue];
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    v6 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v7 = [v6 backupSystemAppInstallStateFilePath];

    uint64_t v8 = [(id)objc_opt_class() _systemAppStateFromURL:v7];
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v11 = v8;
      MOLogWrite();
    }
    -[MISystemAppState _onQueue_setSystemAppStateList:](self, "_onQueue_setSystemAppStateList:", v8, v11);
    id v9 = [(MISystemAppState *)self systemAppStateList];
  }
  else
  {
    id v9 = [(MISystemAppState *)self _onQueue_systemAppStateList];
  }
  return v9;
}

- (void)_onQueue_setSystemAppStateList:(id)a3
{
  id v4 = a3;
  id v5 = [(MISystemAppState *)self appStateQueue];
  dispatch_assert_queue_V2(v5);

  [(MISystemAppState *)self setSystemAppStateList:v4];
  v6 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v7 = [v6 systemAppInstallStateFilePath];

  if (v4 && [v4 count])
  {
    uint64_t v8 = [(MISystemAppState *)self systemAppStateList];
    id v14 = 0;
    char v9 = objc_msgSend(v8, "MI_writeToURL:format:options:error:", v7, 200, 268435457, &v14);
    id v10 = v14;

    if ((v9 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v13 = [v7 path];
      MOLogWrite();
    }
  }
  else
  {
    uint64_t v11 = +[MIFileManager defaultManager];
    id v15 = 0;
    char v12 = [v11 removeItemAtURL:v7 error:&v15];
    id v10 = v15;

    if ((v12 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }
  }
}

- (id)systemAppStateDictionaryRestoringBackedUpState:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  id v5 = [(MISystemAppState *)self appStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke;
  block[3] = &unk_1E62E6D28;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_retrieveSystemAppStateRestoringBackedUpState:", *(unsigned __int8 *)(a1 + 48));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addIdentifier:(id)a3 withState:(int)a4
{
  id v6 = a3;
  uint64_t v7 = [(MISystemAppState *)self appStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MISystemAppState_addIdentifier_withState___block_invoke;
  block[3] = &unk_1E62E6D50;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __44__MISystemAppState_addIdentifier_withState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_systemAppStateList");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v3 = [v2 unsignedIntegerValue];
  int v4 = *(_DWORD *)(a1 + 48);

  if (v4 != v3)
  {
    id v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v6);
  }
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(MISystemAppState *)self appStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MISystemAppState_removeIdentifiers___block_invoke;
  v7[3] = &unk_1E62E6D78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __38__MISystemAppState_removeIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_systemAppStateList");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v3 count];
  [v3 removeObjectsForKeys:*(void *)(a1 + 40)];
  if (v2 != [v3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v3);
  }
}

- (OS_dispatch_queue)appStateQueue
{
  return self->_appStateQueue;
}

- (NSMutableDictionary)systemAppStateList
{
  return self->_systemAppStateList;
}

- (void)setSystemAppStateList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppStateList, 0);
  objc_storeStrong((id *)&self->_appStateQueue, 0);
}

@end