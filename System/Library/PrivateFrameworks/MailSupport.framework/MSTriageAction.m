@interface MSTriageAction
+ (id)_performAction:(id)a3 actionName:(id)a4;
+ (id)log;
+ (void)_performAction:(id)a3 undoManager:(id)a4 actionName:(id)a5;
- (BOOL)isUndoSupported;
- (EFFuture)changeActionFuture;
- (EMMessageRepository)messageRepository;
- (EMQuery)query;
- (MSMessageListItemSelection)messageListItemSelection;
- (MSTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6;
- (MSTriageAction)initWithOrigin:(int64_t)a3 actor:(int64_t)a4;
- (MSTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6;
- (MSTriageActionDelegate)delegate;
- (id)_changeAction;
- (int64_t)actor;
- (int64_t)origin;
- (void)performWithUndoManager:(id)a3 actionName:(id)a4 completion:(id)a5;
- (void)setActor:(int64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation MSTriageAction

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MSTriageAction_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return v2;
}

void __21__MSTriageAction_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (MSTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MSTriageAction;
  v14 = [(MSTriageAction *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_messageListItemSelection, a3);
    v15->_origin = a4;
    v15->_actor = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    v16 = [(MSTriageAction *)v15 messageRepository];

    if (!v16)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v15 file:@"MSTriageAction.m" lineNumber:32 description:@"messageRepository cannot be nil. Either pass non-nil delegate or have selection.messageListItems not be empty."];
    }
  }

  return v15;
}

- (MSTriageAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6
{
  v11 = (EMQuery *)a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MSTriageAction;
  id v13 = [(MSTriageAction *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_actor = a5;
    v13->_query = v11;
    v13->_origin = a4;
    objc_storeWeak((id *)&v13->_delegate, v12);
    v15 = [(MSTriageAction *)v14 messageRepository];

    if (!v15)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v14 file:@"MSTriageAction.m" lineNumber:45 description:@"messageRepository cannot be nil. Either pass non-nil delegate or have selection.messageListItems not be empty."];
    }
  }

  return v14;
}

- (MSTriageAction)initWithOrigin:(int64_t)a3 actor:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSTriageAction;
  result = [(MSTriageAction *)&v7 init];
  if (result)
  {
    result->_origin = a3;
    result->_actor = a4;
  }
  return result;
}

- (BOOL)isUndoSupported
{
  return 1;
}

- (EMMessageRepository)messageRepository
{
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  v6 = [v5 firstObject];

  objc_super v7 = [v6 repository];
  v8 = [(MSTriageAction *)self delegate];
  if (!v7)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_super v7 = [v8 messageRepositoryForTriageAction:self];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSTriageAction.m", 74, @"Expected messageRepository to be an EMMessageRepository, but was %@", objc_opt_class() object file lineNumber description];
  }
  return (EMMessageRepository *)v7;
}

- (id)_changeAction
{
}

- (EFFuture)changeActionFuture
{
  v2 = (void *)MEMORY[0x1E4F60D70];
  id v3 = [(MSTriageAction *)self _changeAction];
  v4 = [v2 futureWithResult:v3];

  return (EFFuture *)v4;
}

- (void)performWithUndoManager:(id)a3 actionName:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  +[MSTriageAction _performAction:self undoManager:v10 actionName:v8];
  if (v9) {
    v9[2](v9);
  }
}

+ (void)_performAction:(id)a3 undoManager:(id)a4 actionName:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[MSTriageAction log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl(&dword_1BF36E000, v11, OS_LOG_TYPE_DEFAULT, "%@: Request to perform action: %{public}@", buf, 0x16u);
  }

  id v12 = +[MSTriageAction _performAction:v8 actionName:v10];
  id v13 = v12;
  if (v12)
  {
    if (v9)
    {
      if ([v12 isValid])
      {
        v14 = +[MSTriageAction log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v8;
          __int16 v24 = 2114;
          id v25 = v10;
          _os_log_impl(&dword_1BF36E000, v14, OS_LOG_TYPE_DEFAULT, "%@: Register undo change action: %{public}@", buf, 0x16u);
        }

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__MSTriageAction__performAction_undoManager_actionName___block_invoke;
        v18[3] = &unk_1E63FF020;
        objc_super v19 = v13;
        id v15 = v9;
        id v20 = v15;
        id v16 = v10;
        id v21 = v16;
        [v15 registerUndoWithTarget:a1 handler:v18];
        if (v16 && ([v15 isUndoing] & 1) == 0) {
          [v15 setActionName:v16];
        }

        v17 = v19;
      }
      else
      {
        v17 = +[MSTriageAction log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[MSTriageAction _performAction:undoManager:actionName:]();
        }
      }
    }
    else
    {
      v17 = +[MSTriageAction log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[MSTriageAction _performAction:undoManager:actionName:]();
      }
    }
  }
}

void __56__MSTriageAction__performAction_undoManager_actionName___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  id v3 = [NSString stringWithFormat:@"[Undo] %@", a1[6]];
  +[MSTriageAction _performAction:undoManager:actionName:](MSTriageAction, "_performAction:undoManager:actionName:", v1, v2);
}

+ (id)_performAction:(id)a3 actionName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = objc_msgSend(MEMORY[0x1E4F60E18], "promise", v6);
  id v8 = [v5 messageRepository];
  id v9 = [v5 changeActionFuture];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__MSTriageAction__performAction_actionName___block_invoke;
  v21[3] = &unk_1E63FF048;
  id v10 = v5;
  id v22 = v10;
  id v11 = v6;
  id v23 = v11;
  id v12 = v8;
  id v24 = v12;
  id v13 = v7;
  id v25 = v13;
  [v9 addSuccessBlock:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__MSTriageAction__performAction_actionName___block_invoke_23;
  v19[3] = &unk_1E63FF070;
  id v14 = v10;
  id v20 = v14;
  [v9 addFailureBlock:v19];
  id v15 = [MSTriageUndoAction alloc];
  id v16 = [v13 future];
  v17 = [(MSTriageUndoAction *)v15 initWithChangeActionFuture:v16 messageRepository:v12];

  return v17;
}

void __44__MSTriageAction__performAction_actionName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[MSTriageAction log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    objc_super v7 = objc_msgSend(v3, "ef_publicDescription");
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_1BF36E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Performing change action: %{public}@ (%{public}@)", (uint8_t *)&v11, 0x20u);
  }
  int v8 = [*(id *)(a1 + 32) isUndoSupported];
  id v9 = *(void **)(a1 + 48);
  if (v8)
  {
    id v10 = [v9 performMessageChangeActionReturningUndoAction:v3];
    [*(id *)(a1 + 56) finishWithFuture:v10];
  }
  else
  {
    [v9 performMessageChangeAction:v3];
  }
}

void __44__MSTriageAction__performAction_actionName___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[MSTriageAction log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend(v3, "ef_publicDescription");
    __44__MSTriageAction__performAction_actionName___block_invoke_23_cold_1(v5, v6, v7, v4);
  }
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  self->_query = (EMQuery *)a3;
}

- (MSTriageActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSTriageActionDelegate *)WeakRetained;
}

- (MSMessageListItemSelection)messageListItemSelection
{
  return self->_messageListItemSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListItemSelection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)_performAction:undoManager:actionName:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BF36E000, v0, v1, "%@: Unable to register undo action (%{public}@) - undo manager is nil");
}

+ (void)_performAction:undoManager:actionName:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BF36E000, v0, v1, "%@: Unable to register undo action (%{public}@) - undo action is invalid");
}

void __44__MSTriageAction__performAction_actionName___block_invoke_23_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BF36E000, log, OS_LOG_TYPE_ERROR, "%@: Getting change action failed with error: %{public}@", buf, 0x16u);
}

@end