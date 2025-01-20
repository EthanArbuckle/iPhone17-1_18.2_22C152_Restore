@interface FIUIStateMachine
- (FIUIStateMachine)initWithLabel:(id)a3 queue:(id)a4;
- (NSString)label;
- (id)description;
- (id)diagnosticHandler;
- (id)errorHandler;
- (id)graphDescription;
- (id)queue;
- (id)state;
- (id)transitionalEventFilter;
- (int64_t)pendingEvent;
- (void)_queue_handleEvents;
- (void)_queue_processEvent:(int64_t)a3;
- (void)_queue_setInitialStateIfNeeded:(id)a3;
- (void)addChildStates:(id)a3 toState:(id)a4 withEntryState:(id)a5;
- (void)addState:(id)a3;
- (void)addStates:(id)a3;
- (void)dealloc;
- (void)event:(int64_t)a3;
- (void)eventAsync:(int64_t)a3;
- (void)export;
- (void)setDiagnosticHandler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPendingEvent:(int64_t)a3;
- (void)setTransitionalEventFilter:(id)a3;
@end

@implementation FIUIStateMachine

- (FIUIStateMachine)initWithLabel:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FIUIStateMachine;
  v9 = [(FIUIStateMachine *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_label, a3);
    uint64_t v11 = objc_opt_new();
    states = v10->_states;
    v10->_states = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    pendingEvents = v10->_pendingEvents;
    v10->_pendingEvents = (NSMutableArray *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    parentStates = v10->_parentStates;
    v10->_parentStates = v15;
  }
  return v10;
}

- (void)setDiagnosticHandler:(id)a3
{
}

- (void)setErrorHandler:(id)a3
{
}

- (void)addState:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMutableSet *)self->_states addObject:v5];
  [(FIUIStateMachine *)self _queue_setInitialStateIfNeeded:v5];
}

- (void)_queue_setInitialStateIfNeeded:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_state)
  {
    objc_storeStrong((id *)&self->_state, a3);
    objc_storeStrong((id *)&self->_initialState, a3);
  }
}

- (id)graphDescription
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(NSMutableSet *)self->_states allObjects];
  v56 = [v4 sortedArrayUsingComparator:&__block_literal_global_20];

  id v5 = [(FIUIStateMachine *)self label];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"state_machine";
  }
  v9 = [(FIUIState *)self->_initialState label];
  objc_msgSend(v3, "appendFormat:", @"digraph %@ {\n   rankdir=LR;\n compound=true; \n   node [shape=doublecircle width=1]; \"%@\";\n   node [shape=circle width=1];\n",
    v8,
    v9);

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v58 = self;
  obuint64_t j = self->_parentStates;
  uint64_t v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v75 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v15 = [v14 label];
        [v3 appendFormat:@"subgraph cluster%@ {\n", v15];

        v16 = [v14 label];
        [v3 appendFormat:@"label = <<font color=\"blue\">%@</font>>; \n", v16];

        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v17 = [v14 childStates];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v70 objects:v80 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v71;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v71 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = [*(id *)(*((void *)&v70 + 1) + 8 * j) label];
              [v3 appendFormat:@"%@ ;\n", v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v70 objects:v80 count:16];
          }
          while (v19);
        }

        [v3 appendString:@"}\n"];
      }
      uint64_t v11 = [(NSMutableSet *)obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v11);
  }

  v23 = [(NSMutableSet *)v58->_parentStates allObjects];
  v24 = [v56 arrayByAddingObjectsFromArray:v23];

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v53 = v24;
  uint64_t v55 = [v53 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v67;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v67 != v54) {
          objc_enumerationMutation(v53);
        }
        uint64_t v57 = v25;
        v26 = *(void **)(*((void *)&v66 + 1) + 8 * v25);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v27 = [v26 allTransitions];
        v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_323_0];

        id v59 = v28;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          id obja = *(id *)v63;
          do
          {
            for (uint64_t k = 0; k != v30; ++k)
            {
              if (*(id *)v63 != obja) {
                objc_enumerationMutation(v59);
              }
              v32 = *(void **)(*((void *)&v62 + 1) + 8 * k);
              v33 = [v26 childStates];
              if ([v33 count])
              {
                v34 = [v26 childStates];
                v35 = [v34 allObjects];
                id v36 = [v35 firstObject];
              }
              else
              {
                id v36 = v26;
              }

              v37 = [v32 toState];
              v38 = [v37 entryState];
              v39 = [v32 toState];
              v40 = v39;
              if (v38)
              {
                uint64_t v41 = [v39 entryState];

                v40 = (void *)v41;
              }

              v42 = [v36 label];
              v43 = [v40 label];
              v44 = [v32 label];
              [v3 appendFormat:@"   \"%@\" -> \"%@\" [ label = \"%@ (%ld)\" ", v42, v43, v44, objc_msgSend(v32, "event")];

              v45 = [v26 childStates];
              uint64_t v46 = [v45 count];

              if (v46)
              {
                v47 = [v26 label];
                [v3 appendFormat:@", ltail = cluster%@ ", v47];
              }
              v48 = [v32 toState];
              v49 = [v48 entryState];

              if (v49)
              {
                v50 = [v32 toState];
                v51 = [v50 label];
                [v3 appendFormat:@", lhead = cluster%@ ", v51];
              }
              [v3 appendString:@"];\n"];
            }
            uint64_t v30 = [v59 countByEnumeratingWithState:&v62 objects:v78 count:16];
          }
          while (v30);
        }

        uint64_t v25 = v57 + 1;
      }
      while (v57 + 1 != v55);
      uint64_t v55 = [v53 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v55);
  }

  [v3 appendString:@"}"];
  return v3;
}

uint64_t __36__FIUIStateMachine_graphDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 label];
  uint64_t v6 = [v4 label];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)label
{
  return self->_label;
}

uint64_t __36__FIUIStateMachine_graphDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 label];
  uint64_t v6 = [v4 label];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)addStates:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableSet addObject:](self->_states, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v5 firstObject];
  [(FIUIStateMachine *)self _queue_setInitialStateIfNeeded:v10];
}

- (id)state
{
  return self->_state;
}

- (void)event:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pendingEvents = self->_pendingEvents;
  uint64_t v6 = [NSNumber numberWithLong:a3];
  [(NSMutableArray *)pendingEvents addObject:v6];

  [(FIUIStateMachine *)self _queue_handleEvents];
}

- (void)_queue_handleEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_handlingEvent)
  {
    self->_handlingEvent = 1;
    while ([(NSMutableArray *)self->_pendingEvents count])
    {
      v3 = [(NSMutableArray *)self->_pendingEvents firstObject];
      uint64_t v4 = [v3 longValue];

      [(NSMutableArray *)self->_pendingEvents removeObjectAtIndex:0];
      [(FIUIStateMachine *)self _queue_processEvent:v4];
    }
    self->_handlingEvent = 0;
  }
}

- (void)_queue_processEvent:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = self->_state;
  if (v5)
  {
    while (1)
    {
      uint64_t v6 = [(FIUIState *)v5 transitionForEvent:a3];
      if (v6) {
        break;
      }
      uint64_t v7 = [(FIUIState *)v5 parentState];

      id v5 = (FIUIState *)v7;
      if (!v7) {
        goto LABEL_4;
      }
    }
    id v33 = (id)v6;
  }
  else
  {
LABEL_4:
    id v33 = 0;
  }
  uint64_t v8 = self->_state;
  uint64_t v9 = [v33 toState];
  uint64_t v10 = [v33 toState];
  long long v11 = [v10 entryState];

  if (v11)
  {
    long long v12 = [v33 toState];
    uint64_t v13 = [v12 entryState];

    uint64_t v9 = (void *)v13;
  }
  long long v14 = [(FIUIStateMachine *)self diagnosticHandler];
  v15 = [(FIUIStateMachine *)self errorHandler];
  uint64_t v31 = [v9 entry];
  uint64_t v32 = [(FIUIState *)self->_state exit];
  uint64_t v16 = [v33 handler];
  uint64_t v30 = [(FIUIStateMachine *)self transitionalEventFilter];
  v17 = [v33 gate];
  if (!v33 && [(FIUIState *)v8 isTransitional])
  {
    uint64_t v29 = v8;
    transitionalEvents = self->_transitionalEvents;
    if (!transitionalEvents)
    {
      uint64_t v19 = [MEMORY[0x263EFF980] array];
      uint64_t v20 = self->_transitionalEvents;
      self->_transitionalEvents = v19;

      transitionalEvents = self->_transitionalEvents;
    }
    v21 = [NSNumber numberWithLong:a3];
    [(NSMutableArray *)transitionalEvents addObject:v21];
    v22 = (void *)v30;
    goto LABEL_34;
  }
  if (v17
    && (((uint64_t (**)(void, FIUIStateMachine *, FIUIState *, void *, int64_t, void))v17)[2](v17, self, self->_state, v9, a3, 0) & 1) == 0)
  {

    uint64_t v9 = 0;
  }
  id v23 = v33;
  if (v14)
  {
    ((void (**)(void, FIUIStateMachine *, FIUIState *, void *, int64_t, void))v14)[2](v14, self, self->_state, v9, a3, 0);
    id v23 = v33;
  }
  if (!v23 && v15) {
    ((void (**)(void, FIUIStateMachine *, FIUIState *, int64_t, void))v15)[2](v15, self, self->_state, a3, 0);
  }
  if (v9)
  {
    if (v32) {
      (*(void (**)(void))(v32 + 16))();
    }
    objc_storeStrong((id *)&self->_state, v9);
    if (v16) {
      ((void (**)(void, FIUIStateMachine *, FIUIState *, void *, int64_t, void))v16)[2](v16, self, v8, v9, a3, 0);
    }
    v24 = (void *)v31;
    if (v31) {
      (*(void (**)(uint64_t, FIUIStateMachine *, FIUIState *, void *, int64_t, void))(v31 + 16))(v31, self, v8, v9, a3, 0);
    }
    if (([v9 isTransitional] & 1) == 0)
    {
      v22 = (void *)v30;
      if (![(NSMutableArray *)self->_transitionalEvents count])
      {
LABEL_35:
        v28 = (void *)v32;
        goto LABEL_38;
      }
      uint64_t v29 = v8;
      v21 = self->_transitionalEvents;
      uint64_t v25 = self->_transitionalEvents;
      self->_transitionalEvents = 0;

      if (v30)
      {
        uint64_t v26 = (*(void (**)(uint64_t, FIUIStateMachine *, void *, NSMutableArray *, void))(v30 + 16))(v30, self, v9, v21, 0);

        v21 = (NSMutableArray *)v26;
      }
      if ([(NSMutableArray *)v21 count])
      {
        v27 = objc_msgSend(objc_alloc(MEMORY[0x263F088D0]), "initWithIndexesInRange:", 0, -[NSMutableArray count](v21, "count"));
        [(NSMutableArray *)self->_pendingEvents insertObjects:v21 atIndexes:v27];
      }
LABEL_34:

      uint64_t v8 = v29;
      v24 = (void *)v31;
      goto LABEL_35;
    }
  }
  else
  {
    v24 = (void *)v31;
  }
  v28 = (void *)v32;
  v22 = (void *)v30;
LABEL_38:
}

- (id)diagnosticHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (id)transitionalEventFilter
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)FIUIStateMachine;
  [(FIUIStateMachine *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionalEventFilter, 0);
  objc_storeStrong(&self->_diagnosticHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_parentStates, 0);
  objc_storeStrong((id *)&self->_transitionalEvents, 0);
  objc_storeStrong((id *)&self->_queueKey, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)eventAsync:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__FIUIStateMachine_eventAsync___block_invoke;
  block[3] = &unk_2644A8940;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __31__FIUIStateMachine_eventAsync___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained event:*(void *)(a1 + 40)];
}

- (id)queue
{
  return self->_queue;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIStateMachine;
  objc_super v3 = [(FIUIStateMachine *)&v6 description];
  uint64_t v4 = objc_msgSend(v3, "stringByAppendingFormat:", @"(%s)", dispatch_queue_get_label((dispatch_queue_t)self->_queue));

  return v4;
}

- (void)export
{
  id v4 = [(FIUIStateMachine *)self label];
  objc_super v3 = [(FIUIStateMachine *)self graphDescription];
  +[FIUIStateMachineExporter exportWithName:v4 graphDescription:v3];
}

- (void)addChildStates:(id)a3 toState:(id)a4 withEntryState:(id)a5
{
  parentStates = self->_parentStates;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(NSMutableSet *)parentStates addObject:v9];
  [v9 addChildStates:v10 withEntryState:v8];
}

- (void)setLabel:(id)a3
{
}

- (void)setTransitionalEventFilter:(id)a3
{
}

- (int64_t)pendingEvent
{
  return self->_pendingEvent;
}

- (void)setPendingEvent:(int64_t)a3
{
  self->_pendingEvent = a3;
}

@end