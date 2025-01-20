@interface CUStateMachine
- (CUState)initialState;
- (NSArray)states;
- (void)_firstTimeInit;
- (void)dealloc;
- (void)dispatchEvent:(id)a3;
- (void)invalidate;
- (void)setInitialState:(id)a3;
- (void)setStates:(id)a3;
- (void)start;
- (void)transitionToState:(id)a3;
@end

@implementation CUStateMachine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_targetState, 0);
  objc_storeStrong((id *)&self->_lcaPath, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)setStates:(id)a3
{
}

- (NSArray)states
{
  return self->_states;
}

- (void)setInitialState:(id)a3
{
}

- (CUState)initialState
{
  return self->_initialState;
}

- (void)_firstTimeInit
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_states count];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v62 = self;
  v4 = self->_states;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v5)
  {
    uint64_t v13 = v5;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v78 != v15) {
          objc_enumerationMutation(v4);
        }
        uint64_t v17 = *(void *)(*((void *)&v77 + 1) + 8 * i);
        if (*(void *)(v17 + 24)) {
          FatalErrorF((uint64_t)"Duplicate state %@", v6, v7, v8, v9, v10, v11, v12, *(void *)(*((void *)&v77 + 1) + 8 * i));
        }
        *(void *)(v17 + 16) = v14 + i;
        uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:2];
        v19 = *(void **)(v17 + 24);
        *(void *)(v17 + 24) = v18;

        [*(id *)(v17 + 24) setCount:v3];
      }
      v14 += i;
      uint64_t v13 = [(NSArray *)v4 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v13);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obj = v62->_states;
  uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v82 count:16];
  unint64_t v20 = 0;
  if (v63)
  {
    uint64_t v61 = *(void *)v74;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v74 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v21;
        uint64_t v22 = *(void *)(*((void *)&v73 + 1) + 8 * v21);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        v23 = v62->_states;
        uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v69 objects:v81 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v70;
          uint64_t v65 = *(void *)v70;
          v66 = v23;
          do
          {
            uint64_t v27 = 0;
            uint64_t v67 = v25;
            do
            {
              if (*(void *)v70 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v69 + 1) + 8 * v27);
              if (v28 == v22)
              {
                [*(id *)(v22 + 24) replacePointerAtIndex:*(void *)(v22 + 16) withPointer:v22];
              }
              else
              {
                uint64_t v29 = [*(id *)(v28 + 24) pointerAtIndex:*(void *)(v22 + 16)];
                if (v29)
                {
                  v30 = (void *)v29;
                  [*(id *)(v22 + 24) replacePointerAtIndex:*(void *)(v28 + 16) withPointer:v29];
                }
                else
                {
                  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v32 = (id *)(id)v22;
                  do
                  {
                    [v31 insertObject:v32 atIndex:0];
                    v33 = (id *)v32[5];

                    v32 = v33;
                  }
                  while (v33);
                  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v35 = (id *)(id)v28;
                  v36 = v35;
                  if (v35)
                  {
                    do
                    {
                      [v34 insertObject:v36 atIndex:0];
                      v37 = (id *)v36[5];

                      v36 = v37;
                    }
                    while (v37);
                  }
                  unint64_t v38 = [v31 count];
                  if (v38 >= [v34 count]) {
                    v39 = v34;
                  }
                  else {
                    v39 = v31;
                  }
                  uint64_t v40 = [v39 count];
                  if (!v40) {
                    goto LABEL_50;
                  }
                  uint64_t v48 = v40;
                  unint64_t v68 = v20;
                  uint64_t v49 = 0;
                  v50 = 0;
                  while (1)
                  {
                    v30 = [v31 objectAtIndexedSubscript:v49];
                    v51 = [v34 objectAtIndexedSubscript:v49];

                    if (v30 != v51) {
                      break;
                    }

                    ++v49;
                    v50 = v30;
                    if (v48 == v49) {
                      goto LABEL_36;
                    }
                  }

                  v30 = v50;
LABEL_36:
                  unint64_t v20 = v68;
                  if (!v30) {
LABEL_50:
                  }
                    FatalErrorF((uint64_t)"Find LCA failed...invalid state graph", v41, v42, v43, v44, v45, v46, v47, v59);
                  [*(id *)(v22 + 24) replacePointerAtIndex:v35[2] withPointer:v30];
                  unint64_t v52 = [v31 count];
                  if (v52 <= [v34 count]) {
                    v53 = v34;
                  }
                  else {
                    v53 = v31;
                  }
                  unint64_t v54 = [v53 count];
                  if (v54 > v68) {
                    unint64_t v20 = v54;
                  }

                  uint64_t v26 = v65;
                  v23 = v66;
                  uint64_t v25 = v67;
                }
              }
              ++v27;
            }
            while (v27 != v25);
            uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v69 objects:v81 count:16];
          }
          while (v25);
        }

        uint64_t v21 = v64 + 1;
      }
      while (v64 + 1 != v63);
      uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v63);
  }

  v55 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  eventQueue = v62->_eventQueue;
  v62->_eventQueue = v55;

  uint64_t v57 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:2];
  lcaPath = v62->_lcaPath;
  v62->_lcaPath = (NSPointerArray *)v57;

  [(NSPointerArray *)v62->_lcaPath setCount:v20];
  v62->_started = 1;
}

- (void)transitionToState:(id)a3
{
  v4 = (CUState *)a3;
  if (!self->_dispatching) {
    FatalErrorF((uint64_t)"Transition to state %@ only allowed from a state handler", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  if (self->_targetState) {
    FatalErrorF((uint64_t)"Transition to state %@ while transitioning to state %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  self->_targetState = v4;
  MEMORY[0x1F41817F8](v4, 0);
}

- (void)dispatchEvent:(id)a3
{
  id v4 = a3;
  id v53 = v4;
  if (self->_dispatching)
  {
    [(NSMutableArray *)self->_eventQueue addObject:v4];
  }
  else
  {
    id v5 = v4;
    p_currentState = &self->_currentState;
    uint64_t v7 = self->_currentState;
    while (1)
    {
      uint64_t v8 = (uint64_t)v7;
      while (1)
      {
        self->_dispatching = 1;
        uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(v8 + 8) + 16))();
        self->_dispatching = 0;
        if (v9 != 1) {
          break;
        }
        if (self->_targetState) {
          FatalErrorF((uint64_t)"State %@ unhandled, but transitioned to state %@", v10, v11, v12, v13, v14, v15, v16, v8);
        }
        id v17 = *(id *)(v8 + 40);

        uint64_t v8 = (uint64_t)v17;
        if (!v17) {
          FatalErrorF((uint64_t)"Event %@ unhandled\n", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
        }
      }
      if (v9 != 2) {
        FatalErrorF((uint64_t)"State %@ bad result %ld", v10, v11, v12, v13, v14, v15, v16, v8);
      }
      self->_dispatching = 1;
      while (1)
      {
        targetState = self->_targetState;
        if (!targetState) {
          break;
        }
        uint64_t v26 = [*(id *)(v8 + 24) pointerAtIndex:targetState->_index];
        for (uint64_t i = *p_currentState; *p_currentState != v26; uint64_t i = *p_currentState)
        {
          eventHandler = (void (**)(id, void *))i->_eventHandler;
          uint64_t v29 = +[CUStateEvent exitState];
          eventHandler[2](eventHandler, v29);

          objc_storeStrong((id *)&self->_currentState, (*p_currentState)->_parent);
        }
        v30 = self->_targetState;
        if ((CUState *)v8 == v30)
        {
          uint64_t v45 = *(void *)(v8 + 8);
          uint64_t v46 = +[CUStateEvent exitState];
          (*(void (**)(uint64_t, void *))(v45 + 16))(v45, v46);

          uint64_t v47 = *(void *)(v8 + 8);
          uint64_t v48 = +[CUStateEvent enterState];
          (*(void (**)(uint64_t, void *))(v47 + 16))(v47, v48);

          objc_storeStrong((id *)&self->_currentState, (id)v8);
        }
        else
        {
          p_isa = v30;

          uint64_t v8 = (uint64_t)v26;
          if (p_isa != (id *)v26)
          {
            uint64_t v39 = 0;
            do
            {
              uint64_t v40 = v39++;
              [(NSPointerArray *)self->_lcaPath replacePointerAtIndex:v40 withPointer:p_isa];
              uint64_t v41 = (CUState *)p_isa[5];

              p_isa = (id *)&v41->super.isa;
            }
            while (v41 != v26);
            uint64_t v42 = v26;
            uint64_t v8 = (uint64_t)v26;
            if (v39)
            {
              do
              {
                uint64_t v8 = [(NSPointerArray *)self->_lcaPath pointerAtIndex:v40];

                uint64_t v43 = *(void *)(v8 + 8);
                uint64_t v44 = +[CUStateEvent enterState];
                (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v44);

                objc_storeStrong((id *)&self->_currentState, (id)v8);
                --v40;
                uint64_t v42 = (void *)v8;
              }
              while (v40 != -1);
            }
          }
        }
        currentState = self->_currentState;
        if (currentState != self->_targetState) {
          FatalErrorF((uint64_t)"Transitioned state %@ not target %@", v32, v33, v34, v35, v36, v37, v38, (uint64_t)self->_currentState);
        }
        self->_targetState = 0;

        v50 = (void (**)(id, void *))self->_currentState->_eventHandler;
        v51 = +[CUStateEvent initialTransition];
        v50[2](v50, v51);
      }
      self->_dispatching = 0;
      uint64_t v7 = self->_currentState;

      unint64_t v52 = [(NSMutableArray *)self->_eventQueue firstObject];

      if (!v52) {
        break;
      }
      id v5 = v52;

      [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
    }
  }
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  currentState = self->_currentState;
  self->_currentState = 0;

  [(NSMutableArray *)self->_eventQueue removeAllObjects];
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  [(NSPointerArray *)self->_lcaPath setCount:0];
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0;

  targetState = self->_targetState;
  self->_targetState = 0;

  [(CUState *)self->_initialState invalidate];
  initialState = self->_initialState;
  self->_initialState = 0;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_states;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "invalidate", (void)v14);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  states = self->_states;
  self->_states = 0;
}

- (void)start
{
  if (self->_started) {
    FatalErrorF((uint64_t)"Attempt to start an already-started state machine", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v48);
  }
  [(CUStateMachine *)self _firstTimeInit];
  initialState = self->_initialState;
  if (!initialState) {
    FatalErrorF((uint64_t)"No initial state", v9, v10, v11, v12, v13, v14, v15, v48);
  }
  long long v17 = initialState;
  uint64_t v18 = -1;
  do
  {
    uint64_t v19 = v18++;
    [(NSPointerArray *)self->_lcaPath replacePointerAtIndex:v18 withPointer:v17];
    uint64_t v20 = (id *)v17[5];

    long long v17 = v20;
  }
  while (v20);
  self->_dispatching = 1;
  if (v19 != -2)
  {
    do
    {
      uint64_t v21 = [(NSPointerArray *)self->_lcaPath pointerAtIndex:v18];
      eventHandler = (void (**)(id, void *))v21->_eventHandler;
      uint64_t v23 = +[CUStateEvent enterState];
      eventHandler[2](eventHandler, v23);

      currentState = self->_currentState;
      self->_currentState = v21;

      --v18;
    }
    while (v18 != -1);
  }
  uint64_t v25 = (void (**)(id, void *))self->_currentState->_eventHandler;
  uint64_t v26 = +[CUStateEvent initialTransition];
  v25[2](v25, v26);

  for (uint64_t i = self->_targetState; i; uint64_t i = self->_targetState)
  {
    uint64_t v28 = i;
    uint64_t v29 = v28;
    if (v28 == self->_currentState)
    {

LABEL_22:
      FatalErrorF((uint64_t)"Bad initial transition %@ -> %@", v33, v34, v35, v36, v37, v38, v39, (uint64_t)self->_currentState);
    }
    uint64_t v30 = 0;
    do
    {
      id v31 = v29;
      uint64_t v32 = v30++;
      [(NSPointerArray *)self->_lcaPath replacePointerAtIndex:v32 withPointer:v29];
      uint64_t v29 = v29->_parent;
    }
    while (v29 != self->_currentState);

    if (!v30) {
      goto LABEL_22;
    }
    do
    {
      uint64_t v40 = [(NSPointerArray *)self->_lcaPath pointerAtIndex:v32];
      uint64_t v41 = v40[1];
      uint64_t v42 = +[CUStateEvent enterState];
      (*(void (**)(uint64_t, void *))(v41 + 16))(v41, v42);

      --v32;
    }
    while (v32 != -1);
    objc_storeStrong((id *)&self->_currentState, self->_targetState);
    targetState = self->_targetState;
    self->_targetState = 0;

    uint64_t v44 = (void (**)(id, void *))self->_currentState->_eventHandler;
    uint64_t v45 = +[CUStateEvent initialTransition];
    v44[2](v44, v45);
  }
  self->_dispatching = 0;
  uint64_t v46 = [(NSMutableArray *)self->_eventQueue firstObject];
  if (v46)
  {
    id v49 = v46;
    id v47 = v46;

    [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
    [(CUStateMachine *)self dispatchEvent:v47];
    uint64_t v46 = v49;
  }
}

- (void)dealloc
{
  if (self->_currentState || self->_targetState) {
    FatalErrorF((uint64_t)"State machine invalidate not called", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v11.receiver);
  }
  [(NSMutableArray *)self->_eventQueue removeAllObjects];
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  [(NSPointerArray *)self->_lcaPath setCount:0];
  lcaPath = self->_lcaPath;
  self->_lcaPath = 0;

  v11.receiver = self;
  v11.super_class = (Class)CUStateMachine;
  [(CUStateMachine *)&v11 dealloc];
}

@end