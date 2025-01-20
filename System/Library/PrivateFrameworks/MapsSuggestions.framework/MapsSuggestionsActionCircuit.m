@interface MapsSuggestionsActionCircuit
- (MapsSuggestionsActionCircuit)initWithAction:(id)a3;
- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 action:(id)a4;
- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 action:(id)a5;
- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 type:(unint64_t)a5 action:(id)a6;
- (NSString)description;
- (NSString)uniqueName;
- (Queue)dispatchQueue;
- (id).cxx_construct;
- (id)nameForJSON;
- (id)objectForJSON;
- (void)_q_sendStateForStep:(uint64_t)a1;
- (void)addCondition:(id)a3;
- (void)addTrigger:(id)a3;
- (void)awaitQueue;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)removeCondition:(id)a3;
- (void)removeTrigger:(id)a3;
- (void)triggerFired:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MapsSuggestionsActionCircuit

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 action:(id)a5
{
  return [(MapsSuggestionsActionCircuit *)self initWithTriggers:a3 conditions:a4 type:0 action:a5];
}

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 conditions:(id)a4 type:(unint64_t)a5 action:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 99;
      __int16 v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      __int16 v64 = 2082;
      v65 = "nil == (action)";
      _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an action", location, 0x26u);
    }
    goto LABEL_24;
  }
  if (!v10)
  {
    v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 100;
      __int16 v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      __int16 v64 = 2082;
      v65 = "nil == (triggers)";
      _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one or more triggers", location, 0x26u);
    }
    goto LABEL_24;
  }
  if (!v11)
  {
    v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsActionCircuit.mm";
      *(_WORD *)&location[12] = 1024;
      *(_DWORD *)&location[14] = 101;
      __int16 v62 = 2082;
      v63 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]";
      __int16 v64 = 2082;
      v65 = "nil == (conditions)";
      _os_log_impl(&dword_1A70DF000, v48, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one or more Conditions", location, 0x26u);
    }
LABEL_24:

    v47 = 0;
    goto LABEL_25;
  }
  v59.receiver = self;
  v59.super_class = (Class)MapsSuggestionsActionCircuit;
  v13 = [(MapsSuggestionsActionCircuit *)&v59 init];
  v14 = v13;
  if (v13)
  {
    *(void *)&v13->_anon_30[16] = a5;
    id v15 = [NSString alloc];
    v16 = [v12 uniqueName];
    v17 = (void *)[v15 initWithFormat:@"MapsSuggestionsActionCircuitQueue{%@}", v16];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    MSg::Queue::Queue((dispatch_queue_t *)location, v17, v18);
    v19 = *(OS_dispatch_queue **)location;
    *(void *)location = 0;
    innerQueue = v14->_queue._innerQueue;
    v14->_queue._innerQueue = v19;

    v21 = *(NSString **)&location[8];
    *(void *)&location[8] = 0;
    name = v14->_queue._name;
    v14->_queue._name = v21;

    id v23 = [NSString alloc];
    v50 = [v12 uniqueName];
    uint64_t v51 = [v23 initWithFormat:@"MapsSuggestionsActionCircuit{%@}", v50];
    v24 = [MapsSuggestionsObservers alloc];
    v52 = v14->_queue._innerQueue;
    id v25 = [NSString alloc];
    v26 = [v12 uniqueName];
    v27 = (void *)[v25 initWithFormat:@"MapsSuggestionsActionCircuitObservers{%@}", v26];
    uint64_t v28 = [(MapsSuggestionsObservers *)v24 initWithCallbackQueue:v52 name:v27];
    v29 = (NSArray *)v12;
    uint64_t v30 = [v10 copy];
    uint64_t v31 = [v11 copy];
    circuits = v14->_config.circuits;
    v14->_config.circuits = (NSArray *)v51;

    triggers = v14->_config.triggers;
    v14->_config.triggers = (NSArray *)v28;

    conditions = v14->_config.conditions;
    v14->_config.conditions = v29;

    v35 = *(void **)v14->_anon_30;
    *(void *)v14->_anon_30 = v30;

    v36 = *(void **)&v14->_anon_30[8];
    *(void *)&v14->_anon_30[8] = v31;

    *(void *)&v14->_anon_30[16] = 0;
    firedTriggerName = v14->_state.firedTriggerName;
    v14->_state.firedTriggerName = 0;

    failedConditionName = v14->_state.failedConditionName;
    v14->_state.failedConditionName = 0;

    lastError = v14->_state.lastError;
    v14->_state.lastError = 0;

    v14->_state.active = 0;
    if (*(void *)&v14->_anon_30[16] == 2)
    {
      objc_initWeak((id *)location, v14);
      v40 = v14->_queue._innerQueue;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __72__MapsSuggestionsActionCircuit_initWithTriggers_conditions_type_action___block_invoke;
      v57[3] = &unk_1E5CB9F68;
      objc_copyWeak(&v58, (id *)location);
      v41 = v40;
      v42 = [[MapsSuggestionsBlockCondition alloc] initWithName:@"MapsSuggestionsDroppingCircuit" queue:v41 block:v57];

      [(MapsSuggestionsActionCircuit *)v14 addCondition:v42];
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v43 = *(id *)v14->_anon_30;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v54 != v45) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v53 + 1) + 8 * i) registerObserver:v14];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v44);
    }
  }
  self = v14;
  v47 = self;
LABEL_25:

  return v47;
}

BOOL __72__MapsSuggestionsActionCircuit_initWithTriggers_conditions_type_action___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = *((unsigned char *)WeakRetained + 96) == 0;
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      v7 = "MapsSuggestionsActionCircuit.mm";
      __int16 v8 = 1026;
      int v9 = 119;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsActionCircuit initWithTriggers:conditions:type:action:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }

    BOOL v3 = 0;
  }

  return v3;
}

- (MapsSuggestionsActionCircuit)initWithTriggers:(id)a3 action:(id)a4
{
  return [(MapsSuggestionsActionCircuit *)self initWithTriggers:a3 conditions:MEMORY[0x1E4F1CBF0] action:a4];
}

- (MapsSuggestionsActionCircuit)initWithAction:(id)a3
{
  return [(MapsSuggestionsActionCircuit *)self initWithTriggers:MEMORY[0x1E4F1CBF0] action:a3];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)self->_anon_30;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) unregisterObserver:self];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsActionCircuit;
  [(MapsSuggestionsActionCircuit *)&v7 dealloc];
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)addTrigger:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsActionCircuit *)self uniqueName];
    objc_super v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    v14 = "-[MapsSuggestionsActionCircuit addTrigger:]";
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MapsSuggestionsActionCircuit_addTrigger___block_invoke;
  v9[3] = &unk_1E5CB9F90;
  id v8 = v4;
  id v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);
}

void __43__MapsSuggestionsActionCircuit_addTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  uint64_t v3 = [v5[6] arrayByAddingObject:*(void *)(a1 + 32)];
  id v4 = v5[6];
  v5[6] = (id)v3;

  [*(id *)(a1 + 32) registerObserver:v5];
}

- (void)addCondition:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsActionCircuit *)self uniqueName];
    objc_super v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    v14 = "-[MapsSuggestionsActionCircuit addCondition:]";
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %@", buf, 0x20u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsActionCircuit_addCondition___block_invoke;
  v9[3] = &unk_1E5CB9F90;
  id v8 = v4;
  id v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);
}

void __45__MapsSuggestionsActionCircuit_addCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  uint64_t v3 = [v5[7] arrayByAddingObject:*(void *)(a1 + 32)];
  id v4 = v5[7];
  v5[7] = (id)v3;
}

- (void)removeTrigger:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsActionCircuit *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    long long v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[MapsSuggestionsActionCircuit removeTrigger:]";
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %p", buf, 0x20u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke;
  v8[3] = &unk_1E5CB9F90;
  id v7 = v4;
  id v9 = v7;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v8);
}

void __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  [*(id *)(a1 + 32) unregisterObserver:v3];
  id v4 = (void *)v3[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke_2;
  v7[3] = &unk_1E5CB9FB8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v5 = objc_msgSend(v4, "MSg_copyIf:", v7);
  uint64_t v6 = (void *)v3[6];
  v3[6] = v5;
}

BOOL __46__MapsSuggestionsActionCircuit_removeTrigger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (void)removeCondition:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [(MapsSuggestionsActionCircuit *)self uniqueName];
    *(_DWORD *)buf = 138412802;
    long long v11 = v6;
    __int16 v12 = 2080;
    __int16 v13 = "-[MapsSuggestionsActionCircuit removeCondition:]";
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} %s %p", buf, 0x20u);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke;
  v8[3] = &unk_1E5CB9F90;
  id v7 = v4;
  id v9 = v7;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v8);
}

void __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke_2;
  v7[3] = &unk_1E5CB9FE0;
  id v8 = *(id *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v3, "MSg_copyIf:", v7);
  uint64_t v6 = (void *)v4[7];
  v4[7] = v5;
}

BOOL __48__MapsSuggestionsActionCircuit_removeCondition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (void)_q_sendStateForStep:(uint64_t)a1
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  id v4 = [(id)a1 objectForJSON];
  objc_initWeak(&location, (id)a1);
  uint64_t v5 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke;
  v11[3] = &unk_1E5CBA008;
  objc_copyWeak(&v14, &location);
  uint64_t v6 = (__CFString *)v3;
  __int16 v12 = v6;
  id v7 = v4;
  id v13 = v7;
  [v5 callBlock:v11];
  if (v6 == @"didAct")
  {
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke_44;
    v9[3] = &unk_1E5CBA030;
    objc_copyWeak(&v10, &location);
    [v8 callBlock:v9];
    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (void *)*((void *)WeakRetained + 1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke_40;
    v10[3] = &unk_1E5CB85B8;
    id v8 = v7;
    objc_copyWeak(&v12, v4);
    id v11 = v3;
    dispatch_async(v8, v10);

    objc_destroyWeak(&v12);
  }
  else
  {
    GEOFindOrCreateLog();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v14 = "MapsSuggestionsActionCircuit.mm";
      __int16 v15 = 1026;
      int v16 = 241;
      __int16 v17 = 2082;
      v18 = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: outerStrongSelf went away in %{public}s", buf, 0x1Cu);
    }
  }
}

void __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke_40(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) copy];
    id v4 = (void *)WeakRetained[11];
    WeakRetained[11] = v3;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:]((uint64_t)WeakRetained, @"didAct");
    *((unsigned char *)WeakRetained + 96) = 0;
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsActionCircuit.mm";
      __int16 v8 = 1026;
      int v9 = 243;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)triggerFired:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(MapsSuggestionsActionCircuit *)self uniqueName];
    id v7 = [v4 uniqueName];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "{%@} fired TRIGGER{%@}!", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MapsSuggestionsActionCircuit_triggerFired___block_invoke;
  v9[3] = &unk_1E5CB9F90;
  id v8 = v4;
  id v10 = v8;
  MSg::Queue::async<MapsSuggestionsActionCircuit>((NSObject **)&self->_queue, self, v9);
}

void __45__MapsSuggestionsActionCircuit_triggerFired___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = *(id *)(a1 + 32);
  if (a2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    id v4 = [v3 uniqueName];
    uint64_t v5 = [v4 copy];
    int v6 = *(void **)(a2 + 72);
    *(void *)(a2 + 72) = v5;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, @"didFireTrigger");
    GEOFindOrCreateLog();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [(id)a2 uniqueName];
      *(_DWORD *)buf = 138412546;
      v46 = v8;
      __int16 v47 = 2080;
      v48 = "-[MapsSuggestionsActionCircuit _q_passedAllConditions]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "{%@} %s", buf, 0x16u);
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    int v9 = *(void **)(a2 + 80);
    *(void *)(a2 + 80) = 0;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, @"willCheckConditions");
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "Checking all Conditions...", buf, 2u);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = *(id *)(a2 + 56);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isTrue", (void)v38) & 1) == 0)
          {
            GEOFindOrCreateLog();
            uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = [v15 uniqueName];
              *(_DWORD *)buf = 138412290;
              v46 = v29;
              _os_log_impl(&dword_1A70DF000, v28, OS_LOG_TYPE_DEBUG, "RUNCONDITION{%@} failed", buf, 0xCu);
            }
            uint64_t v30 = [v15 uniqueName];
            uint64_t v31 = [v30 copy];
            v32 = *(void **)(a2 + 80);
            *(void *)(a2 + 80) = v31;

            -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, @"didFailConditions");
            GEOFindOrCreateLog();
            v33 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v34 = [(id)a2 uniqueName];
              *(_DWORD *)v42 = 138412290;
              *(void *)&v42[4] = v34;
              _os_log_impl(&dword_1A70DF000, v33, OS_LOG_TYPE_DEBUG, "{%@} failed at least one Condition. Continuing sleep.", v42, 0xCu);
            }
            v35 = *(void **)(a2 + 72);
            *(void *)(a2 + 72) = 0;

            v36 = *(void **)(a2 + 80);
            *(void *)(a2 + 80) = 0;

            v37 = *(void **)(a2 + 88);
            *(void *)(a2 + 88) = 0;

            goto LABEL_26;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    int v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_DEBUG, "Passed all Conditions!", buf, 2u);
    }

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, @"didPassConditions");
    *(unsigned char *)(a2 + 96) = 1;
    GEOFindOrCreateLog();
    __int16 v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(id)a2 uniqueName];
      *(_DWORD *)v42 = 138412290;
      *(void *)&v42[4] = v18;
      _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_DEBUG, "{%@} is allowed to run!", v42, 0xCu);
    }
    id v19 = v3;
    GEOFindOrCreateLog();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = [(id)a2 uniqueName];
      v22 = [v19 uniqueName];
      *(_DWORD *)v42 = 138412802;
      *(void *)&v42[4] = v21;
      *(_WORD *)&v42[12] = 2080;
      *(void *)&v42[14] = "-[MapsSuggestionsActionCircuit _q_startRunBecauseOfTrigger:]";
      *(_WORD *)&v42[22] = 2112;
      id v43 = v22;
      _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "{%@} %s %@", v42, 0x20u);
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    id v23 = [v19 uniqueName];
    uint64_t v24 = [v23 copy];
    id v25 = *(void **)(a2 + 72);
    *(void *)(a2 + 72) = v24;

    v26 = *(void **)(a2 + 88);
    *(void *)(a2 + 88) = 0;

    -[MapsSuggestionsActionCircuit _q_sendStateForStep:](a2, @"willAct");
    objc_initWeak((id *)&v38, (id)a2);
    v27 = *(void **)(a2 + 40);
    *(void *)v42 = MEMORY[0x1E4F143A8];
    *(void *)&v42[8] = 3221225472;
    *(void *)&v42[16] = __60__MapsSuggestionsActionCircuit__q_startRunBecauseOfTrigger___block_invoke;
    id v43 = &unk_1E5CB94F8;
    objc_copyWeak(v44, (id *)&v38);
    [v27 actWithHandler:v42];
    objc_destroyWeak(v44);
    objc_destroyWeak((id *)&v38);
  }
LABEL_26:
}

- (NSString)uniqueName
{
  return (NSString *)self->_config.circuits;
}

- (id)nameForJSON
{
  return self->_config.circuits;
}

void __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [v3 actionCircuit:WeakRetained step:*(void *)(a1 + 32) jsonDict:*(void *)(a1 + 40)];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsActionCircuit.mm";
      __int16 v8 = 1026;
      int v9 = 318;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsActionCircuit _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void __52__MapsSuggestionsActionCircuit__q_sendStateForStep___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v3 actionCircuitDidAct:WeakRetained];
  }
  else
  {
    GEOFindOrCreateLog();
    uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      id v7 = "MapsSuggestionsActionCircuit.mm";
      __int16 v8 = 1026;
      int v9 = 327;
      __int16 v10 = 2082;
      id v11 = "-[MapsSuggestionsActionCircuit _q_sendStateForStep:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (id)objectForJSON
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MapsSuggestionsActionCircuit_objectForJSON__block_invoke;
  v4[3] = &unk_1E5CB7EA0;
  v4[4] = self;
  v2 = MSg::Queue::syncIfDifferent<NSDictionary<NSString *,objc_object  {objcproto22MapsSuggestionsAnyJSON}*> * {__strong}>((NSObject **)&self->_queue, v4);
  return v2;
}

id __45__MapsSuggestionsActionCircuit_objectForJSON__block_invoke(uint64_t a1)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v2 = *(id **)(a1 + 32);
  v32 = (void *)[v2[3] copy];
  id v33 = v2[4];
  id v34 = v2[5];
  v42 = (void *)[v2[6] copy];
  v37 = (void *)[v2[7] copy];
  id v3 = *(id **)(a1 + 32);
  long long v40 = (void *)[v3[9] copy];
  long long v39 = (void *)[v3[10] copy];
  uint64_t v31 = (void *)[v3[11] copy];
  v47[0] = @"now";
  MapsSuggestionsNow();
  v35 = (MSg *)objc_claimAutoreleasedReturnValue();
  v36 = MSg::jsonFor(v35, v4);
  v48[0] = v36;
  v47[1] = @"triggers";
  id v41 = v42;
  if (v41)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v41, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v6 = v41;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(id *)(*((void *)&v43 + 1) + 8 * i);
          id v11 = v10;
          if (v10)
          {
            uint64_t v12 = [v10 nameForJSON];
            v50 = v12;
            uint64_t v13 = [v11 objectForJSON];
            v51[0] = v13;
            id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
          }
          else
          {
            id v14 = [MEMORY[0x1E4F1CA98] null];
          }

          [v5 addObject:v14];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v7);
    }

    long long v38 = (void *)[v5 copy];
    uint64_t v15 = v41;
  }
  else
  {
    uint64_t v15 = 0;
    long long v38 = [MEMORY[0x1E4F1CA98] null];
  }

  v48[1] = v38;
  v47[2] = @"conditions";
  id v16 = v37;
  if (v16)
  {
    __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(id *)(*((void *)&v43 + 1) + 8 * j);
          id v23 = v22;
          if (v22) {
            [v22 objectForJSON];
          }
          else {
          uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
          }

          id v25 = [v23 nameForJSON];
          [v17 setObject:v24 forKeyedSubscript:v25];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v19);
    }

    v26 = (void *)[v17 copy];
  }
  else
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }

  v48[2] = v26;
  v47[3] = @"firedTriggerName";
  v27 = MSg::jsonFor(v40);
  v48[3] = v27;
  v47[4] = @"failedConditionName";
  uint64_t v28 = MSg::jsonFor(v39);
  v48[4] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];

  return v29;
}

- (NSString)description
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void)awaitQueue
{
}

void __42__MapsSuggestionsActionCircuit_awaitQueue__block_invoke()
{
}

- (Queue)dispatchQueue
{
  id v4 = v2;
  void *v2 = self->_dispatchQueue._innerQueue;
  uint64_t v5 = self->_dispatchQueue._name;
  v4[1] = v5;
  result._name = v6;
  result._innerQueue = (OS_dispatch_queue *)v5;
  return result;
}

- (void).cxx_destruct
{
  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 81) = 0u;
  return self;
}

@end