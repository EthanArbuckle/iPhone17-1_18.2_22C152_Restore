@interface MapsSuggestionsCircuitBoard
- (MapsSuggestionsCircuitBoard)init;
- (id).cxx_construct;
- (id)addAction:(id)a3;
- (id)addCircuit:(id)a3;
- (id)addCondition:(id)a3;
- (id)addTrigger:(id)a3;
- (id)objectForJSON;
- (id)uniqueName;
- (void)awaitQueue;
- (void)connectCondition:(id)a3 toCircuit:(id)a4;
- (void)connectTrigger:(id)a3 toCircuit:(id)a4;
- (void)disconnectCondition:(id)a3 fromCircuit:(id)a4;
- (void)disconnectTrigger:(id)a3 fromCircuit:(id)a4;
@end

@implementation MapsSuggestionsCircuitBoard

- (MapsSuggestionsCircuitBoard)init
{
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsCircuitBoard;
  v2 = [(MapsSuggestionsCircuitBoard *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue(&v15, @"MapsSuggestionsCircuitBoardQueue", v3);
    dispatch_queue_t v4 = v15;
    dispatch_queue_t v15 = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = (OS_dispatch_queue *)v4;

    v6 = v16;
    v16 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    circuits = v2->_config.circuits;
    v2->_config.circuits = v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    triggers = v2->_config.triggers;
    v2->_config.triggers = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    conditions = v2->_config.conditions;
    v2->_config.conditions = v12;
  }
  return v2;
}

- (id)addTrigger:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__MapsSuggestionsCircuitBoard_addTrigger___block_invoke;
    v10[3] = &unk_1E5CB97D0;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;
    v8 = v11;
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v14 = 1024;
      int v15 = 51;
      __int16 v16 = 2082;
      objc_super v17 = "-[MapsSuggestionsCircuitBoard addTrigger:]";
      __int16 v18 = 2082;
      v19 = "nil == (trigger)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger", buf, 0x26u);
    }
  }

  return v5;
}

void __42__MapsSuggestionsCircuitBoard_addTrigger___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  uint64_t v3 = [v5[4] arrayByAddingObject:*(void *)(a1 + 32)];
  id v4 = v5[4];
  v5[4] = (id)v3;
}

- (id)addCondition:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__MapsSuggestionsCircuitBoard_addCondition___block_invoke;
    v10[3] = &unk_1E5CB97D0;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;
    v8 = v11;
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v14 = 1024;
      int v15 = 60;
      __int16 v16 = 2082;
      objc_super v17 = "-[MapsSuggestionsCircuitBoard addCondition:]";
      __int16 v18 = 2082;
      v19 = "nil == (condition)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition", buf, 0x26u);
    }
  }

  return v5;
}

void __44__MapsSuggestionsCircuitBoard_addCondition___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  uint64_t v3 = [v5[5] arrayByAddingObject:*(void *)(a1 + 32)];
  id v4 = v5[5];
  v5[5] = (id)v3;
}

- (id)addCircuit:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__MapsSuggestionsCircuitBoard_addCircuit___block_invoke;
    v10[3] = &unk_1E5CB97D0;
    v6 = v4;
    v11 = v6;
    MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v10);
    v7 = v6;
    v8 = v11;
  }
  else
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v14 = 1024;
      int v15 = 69;
      __int16 v16 = 2082;
      objc_super v17 = "-[MapsSuggestionsCircuitBoard addCircuit:]";
      __int16 v18 = 2082;
      v19 = "nil == (circuit)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit", buf, 0x26u);
    }
  }

  return v5;
}

void __42__MapsSuggestionsCircuitBoard_addCircuit___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  uint64_t v3 = [v5[3] arrayByAddingObject:*(void *)(a1 + 32)];
  id v4 = v5[3];
  v5[3] = (id)v3;
}

- (id)addAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [[MapsSuggestionsActionCircuit alloc] initWithAction:v4];
    v6 = [(MapsSuggestionsCircuitBoard *)self addCircuit:v5];
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v11 = 1024;
      int v12 = 78;
      __int16 v13 = 2082;
      __int16 v14 = "-[MapsSuggestionsCircuitBoard addAction:]";
      __int16 v15 = 2082;
      __int16 v16 = "nil == (action)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action", (uint8_t *)&v9, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)connectTrigger:(id)a3 toCircuit:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 85;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (trigger)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger";
LABEL_8:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    goto LABEL_9;
  }
  if (!v7)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 86;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (circuit)";
    v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit";
    goto LABEL_8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__MapsSuggestionsCircuitBoard_connectTrigger_toCircuit___block_invoke;
  v11[3] = &unk_1E5CB97F8;
  int v12 = v7;
  id v13 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v11);

  int v9 = v12;
LABEL_9:
}

void __56__MapsSuggestionsCircuitBoard_connectTrigger_toCircuit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (([v3[3] containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 88;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (([v3[4] containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 89;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard connectTrigger:toCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.triggers containsObject:trigger]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that trigger";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addTrigger:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)connectCondition:(id)a3 toCircuit:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 97;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (condition)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition";
LABEL_8:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    goto LABEL_9;
  }
  if (!v7)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 98;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (circuit)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit";
    goto LABEL_8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__MapsSuggestionsCircuitBoard_connectCondition_toCircuit___block_invoke;
  v11[3] = &unk_1E5CB97F8;
  __int16 v12 = v7;
  id v13 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v11);

  int v9 = v12;
LABEL_9:
}

void __58__MapsSuggestionsCircuitBoard_connectCondition_toCircuit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (([v3[3] containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 100;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (([v3[5] containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 101;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard connectCondition:toCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.conditions containsObject:condition]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that condition";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addCondition:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)disconnectTrigger:(id)a3 fromCircuit:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 109;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (trigger)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a trigger";
LABEL_8:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    goto LABEL_9;
  }
  if (!v7)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 110;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (circuit)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit";
    goto LABEL_8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MapsSuggestionsCircuitBoard_disconnectTrigger_fromCircuit___block_invoke;
  v11[3] = &unk_1E5CB97F8;
  __int16 v12 = v7;
  id v13 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v11);

  int v9 = v12;
LABEL_9:
}

void __61__MapsSuggestionsCircuitBoard_disconnectTrigger_fromCircuit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (([v3[3] containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 112;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_8:
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (([v3[4] containsObject:*(void *)(a1 + 40)] & 1) == 0)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 113;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard disconnectTrigger:fromCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "! [strongSelf->_config.triggers containsObject:trigger]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that trigger";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) removeTrigger:*(void *)(a1 + 40)];
LABEL_10:
}

- (void)disconnectCondition:(id)a3 fromCircuit:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 121;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (condition)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a condition";
LABEL_8:
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    goto LABEL_9;
  }
  if (!v7)
  {
    int v9 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
    __int16 v16 = 1024;
    int v17 = 122;
    __int16 v18 = 2082;
    v19 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]";
    __int16 v20 = 2082;
    v21 = "nil == (circuit)";
    __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a circuit";
    goto LABEL_8;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__MapsSuggestionsCircuitBoard_disconnectCondition_fromCircuit___block_invoke;
  v11[3] = &unk_1E5CB97F8;
  __int16 v12 = v7;
  id v13 = v6;
  MSg::Queue::async<MapsSuggestionsCircuitBoard>((NSObject **)&self->_queue, self, v11);

  int v9 = v12;
LABEL_9:
}

void __63__MapsSuggestionsCircuitBoard_disconnectCondition_fromCircuit___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if ([v3[3] containsObject:*(void *)(a1 + 32)])
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 124;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "[strongSelf->_config.circuits containsObject:circuit]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that circuit";
LABEL_7:
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x26u);
    }
  }
  else
  {
    if (![v3[5] containsObject:*(void *)(a1 + 40)])
    {
      [*(id *)(a1 + 32) removeCondition:*(void *)(a1 + 40)];
      goto LABEL_10;
    }
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCircuitBoard.mm";
      __int16 v8 = 1024;
      int v9 = 125;
      __int16 v10 = 2082;
      __int16 v11 = "-[MapsSuggestionsCircuitBoard disconnectCondition:fromCircuit:]_block_invoke";
      __int16 v12 = 2082;
      id v13 = "[strongSelf->_config.conditions containsObject:condition]";
      v5 = "At %{public}s:%d, %{public}s forbids: %{public}s. We don't have that condition";
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (id)objectForJSON
{
  id result = (id)[(MapsSuggestionsCircuitBoard *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (id)uniqueName
{
  v2 = objc_opt_class();
  return (id)[v2 description];
}

- (void)awaitQueue
{
}

void __41__MapsSuggestionsCircuitBoard_awaitQueue__block_invoke()
{
}

- (void).cxx_destruct
{
  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end