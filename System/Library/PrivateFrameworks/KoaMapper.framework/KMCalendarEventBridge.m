@interface KMCalendarEventBridge
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (EKEventStore)eventStore;
- (KMCalendarEventBridge)init;
- (id)originAppId;
- (unsigned)cascadeItemType;
- (void)setEventStore:(id)a3;
@end

@implementation KMCalendarEventBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

- (void)setEventStore:(id)a3
{
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = v5;
  if (self->_eventStore)
  {
    v17 = v5;
    v7 = [MEMORY[0x263EFF910] date];
    v8 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
    id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v9 setWeekOfYear:-2];
    v10 = [v8 dateByAddingComponents:v9 toDate:v7 options:0];
    [v9 setWeekOfYear:0];
    [v9 setMonth:3];
    v11 = [v8 dateByAddingComponents:v9 toDate:v7 options:0];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__221;
    v29 = __Block_byref_object_dispose__222;
    id v30 = 0;
    v12 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v10 endDate:v11 calendars:0];
    eventStore = self->_eventStore;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60__KMCalendarEventBridge_enumerateItemsWithError_usingBlock___block_invoke;
    v18[3] = &unk_2646DB9C8;
    v18[4] = self;
    p_long long buf = &buf;
    v21 = &v22;
    id v19 = v17;
    [(EKEventStore *)eventStore enumerateEventsMatchingPredicate:v12 usingBlock:v18];
    BOOL v14 = *((unsigned char *)v23 + 24) == 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v22, 8);

    v6 = v17;
  }
  else
  {
    v15 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[KMCalendarEventBridge enumerateItemsWithError:usingBlock:]";
      _os_log_error_impl(&dword_22475B000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of EKEventStore.", (uint8_t *)&buf, 0xCu);
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __60__KMCalendarEventBridge_enumerateItemsWithError_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = *(void **)(a1[4] + 8);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  v8 = [v6 mapObject:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = (void *)MEMORY[0x22A6168F0](v10);
          if (((*(uint64_t (**)(void))(a1[5] + 16))(a1[5]) & 1) == 0)
          {
            *a3 = 1;
            *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
        uint64_t v11 = v10;
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
}

- (id)originAppId
{
  return (id)*MEMORY[0x263F51050];
}

- (unsigned)cascadeItemType
{
  return -11151;
}

- (KMCalendarEventBridge)init
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)KMCalendarEventBridge;
  v2 = [(KMCalendarEventBridge *)&v12 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v11 = 0;
  uint64_t v3 = [objc_alloc(MEMORY[0x263F510C8]) initWithObjectClass:objc_opt_class() error:&v11];
  id v4 = v11;
  itemMapper = v2->_itemMapper;
  v2->_itemMapper = (KVItemMapper *)v3;

  v6 = (EKEventStore *)objc_alloc_init(MEMORY[0x263F04B98]);
  eventStore = v2->_eventStore;
  v2->_eventStore = v6;

  if (v2->_itemMapper)
  {

LABEL_4:
    v8 = v2;
    goto LABEL_8;
  }
  id v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    BOOL v14 = "-[KMCalendarEventBridge init]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_error_impl(&dword_22475B000, v9, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

@end