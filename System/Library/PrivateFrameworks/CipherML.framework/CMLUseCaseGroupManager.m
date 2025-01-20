@interface CMLUseCaseGroupManager
+ (CMLUseCaseGroupManager)sharedManager;
- (BOOL)configureGroupWithName:(id)a3 useCaseGroup:(id)a4 error:(id *)a5;
- (id)listUseCaseGroupsWithError:(id *)a3;
@end

@implementation CMLUseCaseGroupManager

+ (CMLUseCaseGroupManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CMLUseCaseGroupManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return (CMLUseCaseGroupManager *)v2;
}

uint64_t __39__CMLUseCaseGroupManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (id)listUseCaseGroupsWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v22 = 0;
  id v23 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v5 = +[CMLXPC createConnection];
  v6 = +[CMLXPC syncProxyToConnection:v5 error:&v23];
  v7 = +[CMLLog client];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    _os_log_impl(&dword_249C3F000, v7, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__CMLUseCaseGroupManager_listUseCaseGroupsWithError___block_invoke;
  v16[3] = &unk_26527E400;
  v16[4] = &v24;
  v16[5] = &v17;
  [v6 listUseCaseGroupsWithReply:v16];
  if (a3)
  {
    id v9 = v23;
    if (!v23) {
      id v9 = (id)v18[5];
    }
    *a3 = v9;
  }
  v10 = +[CMLLog client];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    BOOL v12 = v25[5] != 0;
    uint64_t v13 = v18[5];
    *(_DWORD *)buf = 138412802;
    v31 = v11;
    __int16 v32 = 1026;
    BOOL v33 = v12;
    __int16 v34 = 2114;
    uint64_t v35 = v13;
    _os_log_impl(&dword_249C3F000, v10, OS_LOG_TYPE_DEFAULT, "%@ Request complete data:%{public}d error:%{public}@", buf, 0x1Cu);
  }
  [v5 invalidate];
  id v14 = (id)v25[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __53__CMLUseCaseGroupManager_listUseCaseGroupsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v6)
  {
    uint64_t v7 = +[CMLError errorWithCode:1300 underlyingError:v6 description:@"Unable to list use-case groups"];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (BOOL)configureGroupWithName:(id)a3 useCaseGroup:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v26 = 0;
  id v27 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v10 = +[CMLXPC createConnection];
  v11 = +[CMLXPC syncProxyToConnection:v10 error:&v27];
  BOOL v12 = +[CMLLog client];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v29 = v13;
    _os_log_impl(&dword_249C3F000, v12, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__CMLUseCaseGroupManager_configureGroupWithName_useCaseGroup_error___block_invoke;
  v20[3] = &unk_26527E428;
  v20[4] = &v21;
  [v11 configureUseCaseGroupWithName:v8 useCaseGroup:v9 reply:v20];
  if (a5)
  {
    id v14 = v27;
    if (!v27) {
      id v14 = (id)v22[5];
    }
    *a5 = v14;
  }
  v15 = +[CMLLog client];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    uint64_t v17 = v22[5];
    *(_DWORD *)buf = 138412546;
    id v29 = v16;
    __int16 v30 = 2114;
    uint64_t v31 = v17;
    _os_log_impl(&dword_249C3F000, v15, OS_LOG_TYPE_DEFAULT, "%@ Request complete error:%{public}@", buf, 0x16u);
  }
  [v10 invalidate];
  BOOL v18 = v22[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v18;
}

uint64_t __68__CMLUseCaseGroupManager_configureGroupWithName_useCaseGroup_error___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 40) = +[CMLError errorWithCode:1400 underlyingError:a2 description:@"Unable to configure use-case group"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

@end