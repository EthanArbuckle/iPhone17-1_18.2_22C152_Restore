@interface DSSharingType
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (DSSharingType)initWithSource:(id)a3;
- (DSSource)source;
- (NSArray)allPeople;
- (NSArray)sortedPeople;
- (NSMutableOrderedSet)people;
- (NSString)displayName;
- (NSString)localizedDetailText;
- (id)valueForKey:(id)a3;
- (int64_t)score;
- (unint64_t)hash;
- (void)addPerson:(id)a3;
- (void)removePerson:(id)a3;
- (void)setPeople:(id)a3;
- (void)setSource:(id)a3;
- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4;
- (void)stopSharingPeople:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)stopSharingWithPeople:(id)a3 asParticipantsOnQueue:(id)a4 completion:(id)a5;
@end

@implementation DSSharingType

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLogSharingType = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSSharingType");
    MEMORY[0x270F9A758]();
  }
}

- (DSSharingType)initWithSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DSSharingType;
  v5 = [(DSSharingType *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(DSSharingType *)v5 setSource:v4];
    id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    [(DSSharingType *)v6 setPeople:v7];
  }
  return v6;
}

- (void)addPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSharingType *)self people];
  [v5 addObject:v4];
}

- (void)removePerson:(id)a3
{
  id v4 = a3;
  id v5 = [(DSSharingType *)self people];
  [v5 removeObject:v4];
}

- (int64_t)score
{
  v2 = [(DSSharingType *)self source];
  v3 = [v2 name];
  id v4 = +[DSSourceDescriptor sourceDescriptorForSource:v3];
  int64_t v5 = [v4 priority];

  return v5;
}

- (NSString)displayName
{
  v2 = [(DSSharingType *)self source];
  v3 = [v2 name];
  id v4 = +[DSSourceDescriptor sourceDescriptorForSource:v3];
  int64_t v5 = [v4 localizedName];

  return (NSString *)v5;
}

- (NSString)localizedDetailText
{
  v3 = [(DSSharingType *)self source];
  id v4 = [v3 name];
  int64_t v5 = +[DSSourceDescriptor sourceDescriptorForSource:v4];

  v6 = [v5 localizedDetailTextByType:self];

  return (NSString *)v6;
}

- (unint64_t)hash
{
  v2 = [(DSSharingType *)self source];
  v3 = [v2 name];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (DSSharingType *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(DSSharingType *)self source];
      v6 = [v5 name];
      id v7 = [(DSSharingType *)v4 source];
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

- (id)valueForKey:(id)a3
{
  if ([a3 isEqualToString:@"displayName"])
  {
    unint64_t v4 = [(DSSharingType *)self displayName];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (NSArray)sortedPeople
{
  v2 = [(DSSharingType *)self people];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_0];

  return (NSArray *)v3;
}

uint64_t __29__DSSharingType_sortedPeople__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 score];
  if (v6 >= [v5 score])
  {
    uint64_t v8 = [v4 score];
    if (v8 <= [v5 score])
    {
      char v9 = [v4 displayName];
      v10 = [v5 displayName];
      uint64_t v7 = [v9 localizedStandardCompare:v10];
    }
    else
    {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (NSArray)allPeople
{
  v2 = [(DSSharingType *)self people];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (void)stopAllSharingOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DSSharingType *)self source];
  char v9 = [v8 name];
  BOOL v10 = +[DSRestrictionStore isSourceRestricted:v9];

  if (v10)
  {
    v11 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      v12 = v11;
      v13 = [v8 name];
      *(_DWORD *)buf = 138412290;
      v31 = v13;
      _os_log_impl(&dword_236090000, v12, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke;
    block[3] = &unk_264C9E3F0;
    id v29 = v7;
    id v28 = v8;
    dispatch_async(v6, block);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v14 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingType);
    v15 = (id)DSLogSharingType;
    v16 = v15;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "stopAll", " enableTelemetry=YES ", v26, 2u);
    }

    v17 = [(DSSharingType *)self people];
    v18 = (void *)[v17 copy];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_297;
    v20[3] = &unk_264C9E468;
    id v21 = v8;
    v22 = v6;
    id v24 = v7;
    id v19 = v18;
    id v23 = v19;
    objc_copyWeak(v25, (id *)buf);
    v25[1] = v14;
    [v21 stopAllSharingWithCompletion:v20];
    objc_destroyWeak(v25);

    objc_destroyWeak((id *)buf);
  }
}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) name];
  v2 = +[DSError errorWithCode:6 sourceName:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_297(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  id v4 = (void **)(a1 + 32);
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 name];
  uint64_t v8 = objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v6, v7);

  if (v8)
  {
    char v9 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR)) {
      __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_297_cold_1(v4, v9);
    }
    BOOL v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_299;
    block[3] = &unk_264C9E418;
    v11 = &v29;
    id v29 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 32);
    id v28 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          [WeakRetained removePerson:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
    }

    id v19 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_2;
    v20[3] = &unk_264C9E440;
    v21[1] = *(void *)(a1 + 72);
    v11 = (id *)v21;
    v21[0] = *(id *)(a1 + 56);
    dispatch_async(v19, v20);
  }
}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_299(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) name];
  v6[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = +[DSError errorWithCode:2 sourceName:v3 underlyingErrors:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id)DSLogSharingType;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopAll", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopSharingWithPeople:(id)a3 asParticipantsOnQueue:(id)a4 completion:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v28 = a3;
  queue = a4;
  id v8 = a5;
  char v9 = [(DSSharingType *)self source];
  BOOL v10 = [v9 name];
  BOOL v11 = +[DSRestrictionStore isSourceRestricted:v10];

  if (v11)
  {
    id v12 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v12;
      uint64_t v14 = [v9 name];
      *(_DWORD *)buf = 138412290;
      v45 = v14;
      _os_log_impl(&dword_236090000, v13, OS_LOG_TYPE_INFO, "Cannot reset %@ due to restrictions", buf, 0xCu);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke;
    block[3] = &unk_264C9E3F0;
    id v43 = v8;
    id v42 = v9;
    dispatch_async(queue, block);

    uint64_t v15 = v43;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263EFF980] array];
    long long v40 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    id v16 = v28;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v38;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * v19);
          id v21 = [v9 name];
          long long v22 = [v20 participationForSourceName:v21];
          [v15 addObjectsFromArray:v22];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v17);
    }

    objc_initWeak(&location, self);
    long long v23 = (char *)os_signpost_id_generate((os_log_t)DSLogSharingType);
    long long v24 = (id)DSLogSharingType;
    long long v25 = v24;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236090000, v25, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v23, "stopParticipants", " enableTelemetry=YES ", buf, 2u);
    }

    v26 = (id)DSLogSharingType;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v9 name];
      *(_DWORD *)buf = 138478083;
      v45 = v15;
      __int16 v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_236090000, v26, OS_LOG_TYPE_INFO, "Stopping sharing of participants %{private}@ from source %{public}@", buf, 0x16u);
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_303;
    v30[3] = &unk_264C9E468;
    id v31 = v9;
    uint64_t v32 = queue;
    id v34 = v8;
    id v33 = v16;
    objc_copyWeak(v35, &location);
    v35[1] = v23;
    [v31 stopSharingWithParticipants:v15 completion:v30];
    objc_destroyWeak(v35);

    objc_destroyWeak(&location);
  }
}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) name];
  uint64_t v2 = +[DSError errorWithCode:6 sourceName:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_303(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  os_signpost_id_t v4 = (void **)(a1 + 32);
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 name];
  id v8 = objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v6, v7);

  if (v8)
  {
    char v9 = (void *)DSLogSharingType;
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR)) {
      __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_303_cold_1(v4, v9);
    }
    BOOL v10 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_304;
    block[3] = &unk_264C9E418;
    BOOL v11 = &v29;
    id v29 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 32);
    id v28 = v8;
    dispatch_async(v10, block);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * v16);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
          [WeakRetained removePerson:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v14);
    }

    uint64_t v19 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_2;
    v20[3] = &unk_264C9E440;
    v21[1] = *(void *)(a1 + 72);
    BOOL v11 = (id *)v21;
    v21[0] = *(id *)(a1 + 56);
    dispatch_async(v19, v20);
  }
}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_304(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) name];
  v6[0] = *(void *)(a1 + 40);
  os_signpost_id_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = +[DSError errorWithCode:2 sourceName:v3 underlyingErrors:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

uint64_t __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id)DSLogSharingType;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_236090000, v3, OS_SIGNPOST_INTERVAL_END, v4, "stopParticipants", " enableTelemetry=YES ", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopSharingPeople:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v19 = a3;
  queue = a4;
  id v18 = a5;
  id v8 = [(DSSharingType *)self source];
  if (objc_opt_respondsToSelector())
  {
    [(DSSharingType *)self stopSharingWithPeople:v19 asParticipantsOnQueue:queue completion:v18];
  }
  else
  {
    char v9 = [MEMORY[0x263EFF980] array];
    BOOL v10 = dispatch_group_create();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v19;
    uint64_t v23 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v23)
    {
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          objc_initWeak(&location, self);
          uint64_t v13 = (id)DSLogSharingType;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = [(DSSharingType *)self source];
            uint64_t v15 = [v14 name];
            *(_DWORD *)buf = 138478083;
            v41 = v12;
            __int16 v42 = 2114;
            id v43 = v15;
            _os_log_impl(&dword_236090000, v13, OS_LOG_TYPE_INFO, "Stopping sharing of %{private}@ from source %{public}@", buf, 0x16u);
          }
          dispatch_group_enter(v10);
          long long v39 = v8;
          uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke;
          v27[3] = &unk_264C9E490;
          id v28 = v8;
          id v29 = v12;
          id v30 = v9;
          uint64_t v31 = self;
          objc_copyWeak(&v33, &location);
          uint64_t v32 = v10;
          [v12 stopSharingSources:v16 queue:queue completion:v27];

          objc_destroyWeak(&v33);
          objc_destroyWeak(&location);
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v23);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke_307;
    block[3] = &unk_264C9E4B8;
    id v25 = v9;
    id v26 = v18;
    id v17 = v9;
    dispatch_group_notify(v10, queue, block);
  }
}

void __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  os_signpost_id_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 name];
  id v7 = objc_msgSend(v3, "ds_errorFromIgnorableError:sourceName:", v5, v6);

  id v8 = (void *)DSLogSharingType;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      id v17 = *(void **)(a1 + 40);
      id v18 = v8;
      id v19 = [v16 name];
      *(_DWORD *)buf = 138478339;
      long long v22 = v17;
      __int16 v23 = 2114;
      long long v24 = v19;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_error_impl(&dword_236090000, v18, OS_LOG_TYPE_ERROR, "Failed to stop sharing with %{private}@ from source %{public}@ because %{public}@", buf, 0x20u);
    }
    char v9 = [*(id *)(a1 + 32) name];
    v20 = v7;
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id WeakRetained = +[DSError errorWithCode:2 sourceName:v9 underlyingErrors:v10];

    [*(id *)(a1 + 48) addObject:WeakRetained];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLogSharingType, OS_LOG_TYPE_INFO))
    {
      id v12 = *(void **)(a1 + 56);
      uint64_t v13 = v8;
      uint64_t v14 = [v12 source];
      uint64_t v15 = [v14 name];
      *(_DWORD *)buf = 138477827;
      long long v22 = v15;
      _os_log_impl(&dword_236090000, v13, OS_LOG_TYPE_INFO, "Stopping sharing with %{private}@ complete", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained removePerson:*(void *)(a1 + 40)];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __52__DSSharingType_stopSharingPeople_queue_completion___block_invoke_307(uint64_t a1)
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

- (NSMutableOrderedSet)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __50__DSSharingType_stopAllSharingOnQueue_completion___block_invoke_297_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  os_signpost_id_t v4 = [v2 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_236090000, v5, v6, "Failed to stop all sharing with %{public}@ because %{public}@", v7, v8, v9, v10, v11);
}

void __72__DSSharingType_stopSharingWithPeople_asParticipantsOnQueue_completion___block_invoke_303_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  os_signpost_id_t v4 = [v2 name];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_236090000, v5, v6, "Failed to stop sharing with participants for %{public}@ because %{public}@", v7, v8, v9, v10, v11);
}

@end