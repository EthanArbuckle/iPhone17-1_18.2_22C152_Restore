@interface MapsSuggestionsCompositeTriggeringCondition
- (BOOL)isTrue;
- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4;
- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5;
- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5 triggers:(id)a6 conditions:(id)a7;
- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 triggers:(id)a5 conditions:(id)a6;
- (id).cxx_construct;
- (id)objectForJSON;
- (void)_q_unsubscribeAll;
- (void)addCondition:(id)a3;
- (void)addConditions:(id)a3;
- (void)addTrigger:(id)a3;
- (void)addTriggers:(id)a3;
- (void)dealloc;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
- (void)triggerFired:(id)a3;
@end

@implementation MapsSuggestionsCompositeTriggeringCondition

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5 triggers:(id)a6 conditions:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MapsSuggestionsCompositeTriggeringCondition;
  v15 = [(MapsSuggestionsTriggeringToggle *)&v29 initWithName:v12 startState:v10 behavior:a5];
  v16 = v15;
  if (v15)
  {
    v17 = [(MapsSuggestionsBaseTrigger *)v15 dispatchQueue];
    MSg::Queue::Queue(&v27, v17);
    v18 = v27;
    v27 = 0;
    innerQueue = v16->_queue._innerQueue;
    v16->_queue._innerQueue = (OS_dispatch_queue *)v18;

    v20 = v28;
    v28 = 0;
    name = v16->_queue._name;
    v16->_queue._name = v20;

    uint64_t v22 = [v13 copy];
    triggers = v16->_triggers;
    v16->_triggers = (NSArray *)v22;

    uint64_t v24 = [v14 copy];
    conditions = v16->_conditions;
    v16->_conditions = (NSArray *)v24;
  }
  return v16;
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 triggers:(id)a5 conditions:(id)a6
{
  return [(MapsSuggestionsCompositeTriggeringCondition *)self initWithName:a3 startState:a4 behavior:3 triggers:a5 conditions:a6];
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5
{
  return [(MapsSuggestionsCompositeTriggeringCondition *)self initWithName:a3 startState:a4 behavior:a5 triggers:MEMORY[0x1E4F1CBF0] conditions:MEMORY[0x1E4F1CBF0]];
}

- (MapsSuggestionsCompositeTriggeringCondition)initWithName:(id)a3 startState:(BOOL)a4
{
  return [(MapsSuggestionsCompositeTriggeringCondition *)self initWithName:a3 startState:a4 behavior:3];
}

- (void)addConditions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__MapsSuggestionsCompositeTriggeringCondition_addConditions___block_invoke;
    v7[3] = &unk_1E5CB9548;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v7);
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
      __int16 v11 = 1024;
      int v12 = 78;
      __int16 v13 = 2082;
      id v14 = "-[MapsSuggestionsCompositeTriggeringCondition addConditions:]";
      __int16 v15 = 2082;
      v16 = "nil == (conditions)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires conditions", buf, 0x26u);
    }
  }
}

void __61__MapsSuggestionsCompositeTriggeringCondition_addConditions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 80) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

- (void)addCondition:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MapsSuggestionsCompositeTriggeringCondition *)self addConditions:v5];
}

- (void)addTriggers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__MapsSuggestionsCompositeTriggeringCondition_addTriggers___block_invoke;
    v7[3] = &unk_1E5CB9570;
    v7[4] = self;
    id v8 = v4;
    MSg::Queue::async<MapsSuggestionsCompositeTriggeringCondition>((NSObject **)&self->_queue, self, v7);
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      BOOL v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
      __int16 v11 = 1024;
      int v12 = 92;
      __int16 v13 = 2082;
      id v14 = "-[MapsSuggestionsCompositeTriggeringCondition addTriggers:]";
      __int16 v15 = 2082;
      v16 = "nil == (triggers)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires triggers", buf, 0x26u);
    }
  }
}

void __59__MapsSuggestionsCompositeTriggeringCondition_addTriggers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  v5 = (void *)v3[9];
  v3[9] = v4;

  if ([v3 hasObservers])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EFC8B890, (void)v13) & 1) == 0)
          {
            GEOFindOrCreateLog();
            __int16 v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              int v12 = [v10 uniqueName];
              *(_DWORD *)buf = 136447234;
              v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeTriggeringCondition.mm";
              __int16 v19 = 1024;
              int v20 = 99;
              __int16 v21 = 2082;
              uint64_t v22 = "-[MapsSuggestionsCompositeTriggeringCondition addTriggers:]_block_invoke";
              __int16 v23 = 2082;
              uint64_t v24 = "! [trigger conformsToProtocol:@protocol(MapsSuggestionsTrigger)]";
              __int16 v25 = 2112;
              v26 = v12;
              _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. %@ is not a Trigger", buf, 0x30u);
            }
            goto LABEL_14;
          }
          [v10 registerObserver:v3];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)addTrigger:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(MapsSuggestionsCompositeTriggeringCondition *)self addTriggers:v5];
}

- (void)didAddFirstObserver
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    long long v14 = "-[MapsSuggestionsCompositeTriggeringCondition didAddFirstObserver]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = self->_triggers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "registerObserver:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didRemoveLastObserver
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[MapsSuggestionsCompositeTriggeringCondition didRemoveLastObserver]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  -[MapsSuggestionsCompositeTriggeringCondition _q_unsubscribeAll]((uint64_t)self);
}

- (void)_q_unsubscribeAll
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v2 = *(id *)(a1 + 72);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "unregisterObserver:", a1, (void)v6);
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    long long v6 = "-[MapsSuggestionsCompositeTriggeringCondition dealloc]";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[MapsSuggestionsCompositeTriggeringCondition _q_unsubscribeAll]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsCompositeTriggeringCondition;
  [(MapsSuggestionsCompositeTriggeringCondition *)&v4 dealloc];
}

- (void)triggerFired:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  GEOFindOrCreateLog();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    long long v6 = [v4 uniqueName];
    *(_DWORD *)buf = 136315394;
    long long v9 = "-[MapsSuggestionsCompositeTriggeringCondition triggerFired:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%s: Trigger{%@}", buf, 0x16u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MapsSuggestionsCompositeTriggeringCondition_triggerFired___block_invoke;
  v7[3] = &unk_1E5CB9598;
  v7[4] = self;
  MSg::Queue::async<MapsSuggestionsCompositeTriggeringCondition>((NSObject **)&self->_queue, self, v7);
}

void __60__MapsSuggestionsCompositeTriggeringCondition_triggerFired___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 80);
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = "BOOL _passedConditions(NSArray<id<MapsSuggestionsCondition>> *__strong)";
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:buf count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isTrue", (void)v17) & 1) == 0)
        {
          GEOFindOrCreateLog();
          long long v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            long long v14 = [v10 nameForJSON];
            *(_DWORD *)__int16 v21 = 138412290;
            uint64_t v22 = v14;
            _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "Condition{%@} said NO", v21, 0xCu);
          }
          uint64_t v12 = 0;
          uint64_t v11 = v6;
          goto LABEL_17;
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:buf count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v21 = 0;
    _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "All Conditions passed", v21, 2u);
  }
  uint64_t v12 = 1;
LABEL_17:

  [v3 setState:v12];
  GEOFindOrCreateLog();
  uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromMapsSuggestionsJSON(v3, 0);
    long long v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v16;
    _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "Internal state: %@", buf, 0xCu);
  }
}

- (BOOL)isTrue
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__8;
  long long v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__MapsSuggestionsCompositeTriggeringCondition_isTrue__block_invoke;
  v14[3] = &unk_1E5CB87E8;
  v14[4] = self;
  v14[5] = &v15;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v14);
  id v2 = (id)v16[5];
  id v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v28 = "BOOL _passedConditions(NSArray<id<MapsSuggestionsCondition>> *__strong)";
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:buf count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if (([v8 isTrue] & 1) == 0)
        {
          GEOFindOrCreateLog();
          uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = [v8 nameForJSON];
            *(_DWORD *)uint64_t v25 = 138412290;
            v26 = v12;
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Condition{%@} said NO", v25, 0xCu);
          }
          BOOL v10 = 0;
          uint64_t v9 = v4;
          goto LABEL_17;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:buf count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "All Conditions passed", v25, 2u);
  }
  BOOL v10 = 1;
LABEL_17:

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __53__MapsSuggestionsCompositeTriggeringCondition_isTrue__block_invoke(uint64_t a1)
{
}

- (id)objectForJSON
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__8;
  long long v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__MapsSuggestionsCompositeTriggeringCondition_objectForJSON__block_invoke;
  v14[3] = &unk_1E5CB87E8;
  v14[4] = self;
  v14[5] = &v15;
  MSg::Queue::syncIfDifferent((NSObject **)&self->_queue, v14);
  id v2 = (id)v16[5];
  if (v2)
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v9 = v8;
          if (v8) {
            [v8 objectForJSON];
          }
          else {
          BOOL v10 = [MEMORY[0x1E4F1CA98] null];
          }

          uint64_t v11 = [v9 nameForJSON];
          [v3 setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v5);
    }

    uint64_t v12 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __60__MapsSuggestionsCompositeTriggeringCondition_objectForJSON__block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  id v2 = self;
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&v2->_triggers, 0);
  id v2 = (MapsSuggestionsCompositeTriggeringCondition *)((char *)v2 + 56);

  Class isa = v2->super.super.super.isa;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end