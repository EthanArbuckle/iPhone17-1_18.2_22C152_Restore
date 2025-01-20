@interface DSPublicSharingType
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (DSPublicSharingType)initWithSource:(id)a3;
- (DSSource)source;
- (NSArray)allPublicResources;
- (NSMutableSet)publicResources;
- (NSString)displayName;
- (NSString)localizedDetailText;
- (int64_t)score;
- (unint64_t)hash;
- (void)addPublicResource:(id)a3;
- (void)removePublicResource:(id)a3;
- (void)setPublicResources:(id)a3;
- (void)setSource:(id)a3;
- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4;
- (void)stopSharingResource:(id)a3 onQueue:(id)a4 completion:(id)a5;
@end

@implementation DSPublicSharingType

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogPublicSharing = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSLogPublicSharingType");
    MEMORY[0x270F9A758]();
  }
}

- (DSPublicSharingType)initWithSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSPublicSharingType;
  v5 = [(DSPublicSharingType *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(DSPublicSharingType *)v5 setSource:v4];
    v7 = [MEMORY[0x263EFF9C0] set];
    [(DSPublicSharingType *)v6 setPublicResources:v7];
  }
  return v6;
}

- (void)addPublicResource:(id)a3
{
  id v4 = a3;
  id v5 = [(DSPublicSharingType *)self publicResources];
  [v5 addObject:v4];
}

- (void)removePublicResource:(id)a3
{
  id v4 = a3;
  id v5 = [(DSPublicSharingType *)self publicResources];
  [v5 removeObject:v4];
}

- (NSArray)allPublicResources
{
  v2 = [(DSPublicSharingType *)self publicResources];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (int64_t)score
{
  v2 = [(DSPublicSharingType *)self source];
  v3 = [v2 name];
  id v4 = +[DSSourceDescriptor sourceDescriptorForSource:v3];
  int64_t v5 = [v4 priority];

  return v5;
}

- (NSString)displayName
{
  v2 = [(DSPublicSharingType *)self source];
  v3 = [v2 name];
  id v4 = +[DSSourceDescriptor sourceDescriptorForSource:v3];
  int64_t v5 = [v4 localizedName];

  return (NSString *)v5;
}

- (NSString)localizedDetailText
{
  v3 = [(DSPublicSharingType *)self source];
  id v4 = [v3 name];
  int64_t v5 = +[DSSourceDescriptor sourceDescriptorForSource:v4];

  v6 = [v5 localizedPublicSharingDetailTextByType:self];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = [(DSPublicSharingType *)self source];
  v3 = [v2 name];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (DSPublicSharingType *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(DSPublicSharingType *)self source];
      v6 = [v5 name];
      v7 = [(DSPublicSharingType *)v4 source];
      v8 = [v7 name];
      char v9 = [v6 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (void)stopSharingResource:(id)a3 onQueue:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  char v9 = [(DSPublicSharingType *)self source];
  uint64_t v10 = [v7 visibility];
  if (v10 == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [v7 participationAccess];
      if ((v17 & 2) != 0)
      {
        if (objc_opt_respondsToSelector())
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14;
          v25[3] = &unk_264C9EC70;
          id v26 = v9;
          id v27 = v7;
          id v28 = v8;
          [v26 updateParticipantAccessLevelTo:1 onResource:v27 withCompletion:v25];

          id v16 = v26;
LABEL_18:

          goto LABEL_19;
        }
        v22 = (void *)DSLogPublicSharing;
        if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR)) {
          -[DSPublicSharingType stopSharingResource:onQueue:completion:](v22, v9);
        }
LABEL_17:
        id v16 = [v9 name];
        v21 = +[DSError errorWithCode:2 sourceName:v16];
        (*((void (**)(id, void *))v8 + 2))(v8, v21);

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    v20 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_FAULT))
    {
      v23 = v20;
      v24 = [v9 name];
      *(_DWORD *)buf = 138543874;
      v34 = v24;
      __int16 v35 = 2050;
      uint64_t v36 = [v7 visibility];
      __int16 v37 = 2050;
      uint64_t v38 = v17;
      _os_log_fault_impl(&dword_236090000, v23, OS_LOG_TYPE_FAULT, "[%{public}@] Resource classified as public but visibility is %{public}ld and participation access is %{public}ld", buf, 0x20u);
    }
    goto LABEL_17;
  }
  if (v10 == 2)
  {
    char v11 = objc_opt_respondsToSelector();
    v12 = (void *)DSLogPublicSharing;
    BOOL v13 = os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v13)
      {
        v14 = v12;
        v15 = [v9 name];
        *(_DWORD *)buf = 138543618;
        v34 = v15;
        __int16 v35 = 2114;
        uint64_t v36 = (uint64_t)v7;
        _os_log_impl(&dword_236090000, v14, OS_LOG_TYPE_INFO, "[%{public}@] Resource %{public}@ is publicly visible, attempting to change visibility to private", buf, 0x16u);
      }
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke;
      v31[3] = &unk_264C9EC20;
      id v32 = v8;
      [v9 updateVisibilityTo:1 onResource:v7 withCompletion:v31];
      id v16 = v32;
    }
    else
    {
      if (v13)
      {
        v18 = v12;
        v19 = [v9 name];
        *(_DWORD *)buf = 138543618;
        v34 = v19;
        __int16 v35 = 2114;
        uint64_t v36 = (uint64_t)v7;
        _os_log_impl(&dword_236090000, v18, OS_LOG_TYPE_INFO, "[%{public}@] Resource %{public}@ is publicly visible, attempting to stop sharing entirely", buf, 0x16u);
      }
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_7;
      v29[3] = &unk_264C9EC48;
      id v30 = v8;
      [v9 stopSharing:v7 withCompletion:v29];
      id v16 = v30;
    }
    goto LABEL_18;
  }
LABEL_19:
}

uint64_t __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR)) {
      __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14_cold_1(a1, v7, (uint64_t)v6);
    }
    id v8 = [*(id *)(a1 + 32) name];
    v11[0] = v6;
    char v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    uint64_t v10 = +[DSError errorWithCode:2 sourceName:v8 underlyingErrors:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v19 = a4;
  id v7 = dispatch_group_create();
  id v8 = [MEMORY[0x263EFF980] array];
  char v9 = [(DSPublicSharingType *)self source];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [(DSPublicSharingType *)self publicResources];
  char v11 = (void *)[v10 copy];

  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
        dispatch_group_enter(v7);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke;
        v24[3] = &unk_264C9EC98;
        id v25 = v9;
        uint64_t v26 = v16;
        id v27 = v8;
        id v28 = v7;
        [(DSPublicSharingType *)self stopSharingResource:v16 onQueue:v6 completion:v24];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke_18;
  block[3] = &unk_264C9E4B8;
  id v22 = v8;
  id v23 = v19;
  id v17 = v19;
  id v18 = v8;
  dispatch_group_notify(v7, v6, block);
}

void __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 name];
  id v7 = objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v5, v6);

  if (v7)
  {
    id v8 = (void *)DSLogPublicSharing;
    if (os_log_type_enabled((os_log_t)DSLogPublicSharing, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = v8;
      uint64_t v15 = [v12 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v13;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_error_impl(&dword_236090000, v14, OS_LOG_TYPE_ERROR, "Failed to stop public sharing on %{public}@ from %{public}@ because %{public}@", buf, 0x20u);
    }
    char v9 = [*(id *)(a1 + 32) name];
    uint64_t v16 = v7;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
    char v11 = +[DSError errorWithCode:2 sourceName:v9 underlyingErrors:v10];

    [*(id *)(a1 + 48) addObject:v11];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __56__DSPublicSharingType_stopAllSharingOnQueue_completion___block_invoke_18(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = +[DSError errorWithCode:2 underlyingErrors:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (DSSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSMutableSet)publicResources
{
  return self->_publicResources;
}

- (void)setPublicResources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicResources, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)stopSharingResource:(void *)a1 onQueue:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  unint64_t v4 = [a2 name];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_236090000, v3, OS_LOG_TYPE_ERROR, "%{public}@ is unable to update participation access", (uint8_t *)&v5, 0xCu);
}

void __62__DSPublicSharingType_stopSharingResource_onQueue_completion___block_invoke_14_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 name];
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v7;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  _os_log_error_impl(&dword_236090000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ Failed to update participation access on %{public}@ because %{public}@", (uint8_t *)&v9, 0x20u);
}

@end