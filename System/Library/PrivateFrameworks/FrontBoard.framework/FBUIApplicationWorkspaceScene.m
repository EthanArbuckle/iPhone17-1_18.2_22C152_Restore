@interface FBUIApplicationWorkspaceScene
- (FBUIApplicationWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7;
- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5;
- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3;
- (void)_workspaceQueue_invalidate;
@end

@implementation FBUIApplicationWorkspaceScene

- (void)_workspaceQueue_cancelWatchdogTimer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6 = v4;
    if ([(NSMutableArray *)self->_watchdogStack indexOfObjectIdenticalTo:v4] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_watchdogStack removeObjectIdenticalTo:v6];
      if ([(NSMutableArray *)self->_watchdogStack count])
      {
        v5 = [(NSMutableArray *)self->_watchdogStack firstObject];
        [v5 activate];
      }
    }
    [(NSMutableSet *)self->_allWatchdogs removeObject:v6];
    [v6 invalidate];
    id v4 = v6;
  }
}

- (id)_workspaceQueue_createWatchdogForProcess:(id)a3 sceneAction:(unsigned __int8)a4 transitionContext:(id)a5
{
  unsigned int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(FBWorkspaceScene *)self settings];
  v11 = [v9 watchdogTransitionContext];
  char v12 = [v11 runIndependently];
  uint64_t v13 = [v11 watchdogBehavior];
  if (v13)
  {
    if (v13 != 1)
    {
      v14 = 0;
      v15 = 0;
      self->_BOOL sentSceneCreate = 1;
      goto LABEL_17;
    }
    goto LABEL_5;
  }
  if (_FBSceneActionIsSignificant(v6))
  {
LABEL_5:
    BOOL sentSceneCreate = self->_sentSceneCreate;
    self->_BOOL sentSceneCreate = 1;
    goto LABEL_6;
  }
  char v18 = [v10 isForeground];
  BOOL sentSceneCreate = self->_sentSceneCreate;
  self->_BOOL sentSceneCreate = 1;
  if (v18)
  {
    v14 = 0;
    v15 = 0;
    goto LABEL_17;
  }
LABEL_6:
  if (sentSceneCreate) { {
    uint64_t v17 = 3;
  }
  }
  else {
    uint64_t v17 = 2;
  }
  v15 = +[FBProcessWatchdogEventContext contextForEvent:v17 settings:v10 transitionContext:v9];
  if (v15)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke;
    v20[3] = &unk_1E5C4AD88;
    v20[4] = self;
    v14 = (void *)[v8 _newWatchdogForContext:v15 completion:v20];
    if (v14)
    {
      [(NSMutableSet *)self->_allWatchdogs addObject:v14];
      if ((v12 & 1) != 0
        || ([(NSMutableArray *)self->_watchdogStack addObject:v14],
            [(NSMutableArray *)self->_watchdogStack count] == 1))
      {
        [v14 activate];
      }
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_17:

  return v14;
}

uint64_t __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workspaceQueue_cancelWatchdogTimer:", *(void *)(a1 + 40));
}

- (FBUIApplicationWorkspaceScene)initWithConnection:(id)a3 host:(id)a4 settings:(id)a5 clientSettings:(id)a6 fromRemnant:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)FBUIApplicationWorkspaceScene;
  v7 = [(FBWorkspaceScene *)&v13 initWithConnection:a3 host:a4 settings:a5 clientSettings:a6 fromRemnant:a7];
  if (v7)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    watchdogStack = v7->_watchdogStack;
    v7->_watchdogStack = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allWatchdogs = v7->_allWatchdogs;
    v7->_allWatchdogs = v10;
  }
  return v7;
}

void __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __104__FBUIApplicationWorkspaceScene__workspaceQueue_createWatchdogForProcess_sceneAction_transitionContext___block_invoke_2;
  v7[3] = &unk_1E5C497A0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 performAsync:v7];
}

- (void)_workspaceQueue_invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_allWatchdogs;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) { {
          objc_enumerationMutation(v3);
        }
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_allWatchdogs removeAllObjects];
  [(NSMutableArray *)self->_watchdogStack removeAllObjects];
  v8.receiver = self;
  v8.super_class = (Class)FBUIApplicationWorkspaceScene;
  [(FBWorkspaceScene *)&v8 _workspaceQueue_invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allWatchdogs, 0);
}

@end