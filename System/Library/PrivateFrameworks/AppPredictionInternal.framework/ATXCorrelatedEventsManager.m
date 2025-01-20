@interface ATXCorrelatedEventsManager
+ (BOOL)eventsOverlapForEventA:(id)a3 withDateBuffer:(id)a4 eventB:(id)a5 withDateBuffer:(id)a6;
- (ATXCorrelatedEventsDateBuffer)firstEventTypeDateBuffer;
- (ATXCorrelatedEventsDateBuffer)secondEventTypeDateBuffer;
- (ATXCorrelatedEventsManager)initWithFirstEventType:(Class)a3 firstEventTypeDateBuffer:(id)a4 secondEventType:(Class)a5 secondEventTypeDateBuffer:(id)a6;
- (Class)firstEventType;
- (Class)secondEventType;
- (id)correlatedEvents;
- (void)correlateEvents;
- (void)insertEvents:(id)a3 forEventType:(int64_t)a4;
@end

@implementation ATXCorrelatedEventsManager

- (ATXCorrelatedEventsManager)initWithFirstEventType:(Class)a3 firstEventTypeDateBuffer:(id)a4 secondEventType:(Class)a5 secondEventTypeDateBuffer:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = v12;
  if (a5 && a3 && v11 && v12)
  {
    v34.receiver = self;
    v34.super_class = (Class)ATXCorrelatedEventsManager;
    v14 = [(ATXCorrelatedEventsManager *)&v34 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_firstEventType, a3);
      objc_storeStrong((id *)&v15->_firstEventTypeDateBuffer, a4);
      objc_storeStrong((id *)&v15->_secondEventType, a5);
      objc_storeStrong((id *)&v15->_secondEventTypeDateBuffer, a6);
      uint64_t v16 = objc_opt_new();
      uint64_t v17 = objc_opt_new();
      v18 = *(void **)(v16 + 8);
      *(void *)(v16 + 8) = v17;

      *(void *)(v16 + 16) = 0;
      *(_WORD *)(v16 + 24) = 1;
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v16];
      correlatedEventsLock = v15->_correlatedEventsLock;
      v15->_correlatedEventsLock = (_PASLock *)v19;

      v21 = objc_opt_new();
      v21[1] = 0;
      uint64_t v22 = objc_opt_new();
      v23 = (void *)v21[2];
      v21[2] = v22;

      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v21];
      typeAEventDataLock = v15->_typeAEventDataLock;
      v15->_typeAEventDataLock = (_PASLock *)v24;

      v26 = objc_opt_new();
      v26[1] = 0;
      uint64_t v27 = objc_opt_new();
      v28 = (void *)v26[2];
      v26[2] = v27;

      uint64_t v29 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v26];
      typeBEventDataLock = v15->_typeBEventDataLock;
      v15->_typeBEventDataLock = (_PASLock *)v29;
    }
    self = v15;
    v31 = self;
  }
  else
  {
    v32 = __atxlog_handle_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ATXCorrelatedEventsManager initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:]();
    }

    v31 = 0;
  }

  return v31;
}

- (void)insertEvents:(id)a3 forEventType:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    v13 = [v6 firstObject];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      typeBEventDataLock = self->_typeBEventDataLock;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_21;
      uint64_t v19 = &unk_1E68B1F20;
      id v11 = &v20;
      id v20 = v7;
      id v12 = &v16;
      goto LABEL_7;
    }
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4)
  {
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXCorrelatedEventsManager insertEvents:forEventType:]();
    }
    goto LABEL_14;
  }
  v8 = [v6 firstObject];
  char v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
  {
    v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
LABEL_13:
    }
      -[ATXCorrelatedEventsManager insertEvents:forEventType:]();
LABEL_14:

    goto LABEL_15;
  }
  typeBEventDataLock = self->_typeAEventDataLock;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke;
  uint64_t v24 = &unk_1E68B1F20;
  id v11 = &v25;
  id v25 = v7;
  id v12 = &v21;
LABEL_7:
  -[_PASLock runWithLockAcquired:](typeBEventDataLock, "runWithLockAcquired:", v12, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  [(_PASLock *)self->_correlatedEventsLock runWithLockAcquired:&__block_literal_global_117];
LABEL_15:
}

uint64_t __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) addObjectsFromArray:*(void *)(a1 + 32)];
}

uint64_t __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_21(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) addObjectsFromArray:*(void *)(a1 + 32)];
}

void __56__ATXCorrelatedEventsManager_insertEvents_forEventType___block_invoke_22(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 25) = 0;
}

+ (BOOL)eventsOverlapForEventA:(id)a3 withDateBuffer:(id)a4 eventB:(id)a5 withDateBuffer:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v11 startDateWithBufferForEvent:v12];
  v14 = [v9 endDateWithBufferForEvent:v10];
  uint64_t v15 = [v13 compare:v14];

  uint64_t v16 = [v11 endDateWithBufferForEvent:v12];

  uint64_t v17 = [v9 startDateWithBufferForEvent:v10];

  unint64_t v18 = [v16 compare:v17];
  return (unint64_t)(v15 + 1) < 2 && v18 < 2;
}

- (void)correlateEvents
{
  v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  typeAEventDataLock = self->_typeAEventDataLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke;
  v5[3] = &unk_1E68B1F20;
  v5[4] = self;
  [(_PASLock *)typeAEventDataLock runWithLockAcquired:v5];
}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_2;
  v7[3] = &unk_1E68B1F90;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 runWithLockAcquired:v7];
}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_3;
  v6[3] = &unk_1E68B1F68;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  [v4 runWithLockAcquired:v6];
}

void __45__ATXCorrelatedEventsManager_correlateEvents__block_invoke_3(uint64_t a1, void *a2)
{
  id v21 = a2;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v20 = a1;
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(id *)(*(void *)(a1 + 40) + 16);
  unint64_t v6 = *((void *)v21 + 2);
  if (v4 >= [v3 count]) {
    goto LABEL_17;
  }
  if (v6 == -1) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  unint64_t v19 = v7;
  do
  {
    uint64_t v8 = v20;
    unint64_t v9 = v19;
    if (v19 >= [v5 count]) {
      goto LABEL_16;
    }
    while (1)
    {
      id v10 = (void *)MEMORY[0x1D25F6CC0]();
      id v11 = [v3 objectAtIndexedSubscript:v4];
      id v12 = [v5 objectAtIndexedSubscript:v9];
      if ([(id)objc_opt_class() eventsOverlapForEventA:v11 withDateBuffer:*(void *)(*(void *)(v8 + 48) + 48) eventB:v12 withDateBuffer:*(void *)(*(void *)(v8 + 48) + 56)])
      {
        v13 = [[ATXCorrelatedEvents alloc] initWithFirstEvent:v11 secondEvent:v12];
        [*((id *)v21 + 1) addObject:v13];
        if (*((unsigned char *)v21 + 24)) {
          *((void *)v21 + 2) = v9;
        }

        goto LABEL_13;
      }
      unint64_t v14 = v4;
      id v15 = v3;
      uint64_t v16 = [*(id *)(*(void *)(v8 + 48) + 56) startDateWithBufferForEvent:v12];
      uint64_t v17 = [*(id *)(*(void *)(v8 + 48) + 48) endDateWithBufferForEvent:v11];
      uint64_t v18 = [v16 compare:v17];

      if (v18 == 1) {
        break;
      }
      uint64_t v8 = v20;
      *((unsigned char *)v21 + 24) = 1;
      id v3 = v15;
      unint64_t v4 = v14;
LABEL_13:

      if (++v9 >= [v5 count]) {
        goto LABEL_16;
      }
    }
    unint64_t v19 = *((void *)v21 + 2);

    id v3 = v15;
    unint64_t v4 = v14;
LABEL_16:
    ++v4;
  }
  while (v4 < [v3 count]);
LABEL_17:
  *((unsigned char *)v21 + 25) = 1;
}

- (id)correlatedEvents
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__56;
  id v10 = __Block_byref_object_dispose__56;
  id v11 = 0;
  correlatedEventsLock = self->_correlatedEventsLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ATXCorrelatedEventsManager_correlatedEvents__block_invoke;
  v5[3] = &unk_1E68B1FB8;
  v5[4] = self;
  void v5[5] = &v6;
  [(_PASLock *)correlatedEventsLock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__ATXCorrelatedEventsManager_correlatedEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v7 = v3;
  if (!*((unsigned char *)v3 + 25))
  {
    [*(id *)(a1 + 32) correlateEvents];
    id v3 = v7;
  }
  uint64_t v4 = [v3[1] copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (Class)firstEventType
{
  return self->_firstEventType;
}

- (Class)secondEventType
{
  return self->_secondEventType;
}

- (ATXCorrelatedEventsDateBuffer)firstEventTypeDateBuffer
{
  return self->_firstEventTypeDateBuffer;
}

- (ATXCorrelatedEventsDateBuffer)secondEventTypeDateBuffer
{
  return self->_secondEventTypeDateBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondEventTypeDateBuffer, 0);
  objc_storeStrong((id *)&self->_firstEventTypeDateBuffer, 0);
  objc_storeStrong((id *)&self->_secondEventType, 0);
  objc_storeStrong((id *)&self->_firstEventType, 0);
  objc_storeStrong((id *)&self->_typeBEventDataLock, 0);
  objc_storeStrong((id *)&self->_typeAEventDataLock, 0);
  objc_storeStrong((id *)&self->_correlatedEventsLock, 0);
}

- (void)initWithFirstEventType:firstEventTypeDateBuffer:secondEventType:secondEventTypeDateBuffer:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Initializing an instance of ATXCorrelatedEventsManager without specifying buffers for firstEventType or secondEventType, or their buffers.", v2, v3, v4, v5, v6);
}

- (void)insertEvents:forEventType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Trying to insert ATXDuetEvents into ATXCorrelatedEventsManager that don't belong to group 1 or 2.", v2, v3, v4, v5, v6);
}

- (void)insertEvents:forEventType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Trying to insert data of incorrect type into CorrelatedEventsManager.", v2, v3, v4, v5, v6);
}

@end