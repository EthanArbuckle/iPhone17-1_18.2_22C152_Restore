@interface FLHeadlessActionHandler
+ (id)handlerWithItem:(id)a3;
- (FLFollowUpItem)item;
- (FLHeadlessActionHandler)initWithItem:(id)a3;
- (void)dealloc;
- (void)handleAction:(id)a3 completion:(id)a4;
- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4;
- (void)setItem:(id)a3;
@end

@implementation FLHeadlessActionHandler

- (FLHeadlessActionHandler)initWithItem:(id)a3
{
  id v5 = a3;
  v6 = [(FLHeadlessActionHandler *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

+ (id)handlerWithItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithItem:v4];

  return v5;
}

- (void)handleAction:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = _os_activity_create(&dword_1BE24A000, "followup/handling-action", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v8, &v17);
  v9 = [(FLHeadlessActionHandler *)self item];
  v10 = [v9 extensionIdentifier];
  if (v10)
  {
    v11 = +[FLEnvironment currentEnvironment];
    int v12 = [v11 followUpExtensionSupportEnabled];

    if (v12)
    {
      [(FLHeadlessActionHandler *)self handleExtensionBasedAction:v6 completion:v7];
      goto LABEL_10;
    }
  }
  else
  {
  }
  if ([v6 _loadActionURL])
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    v13 = _FLLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = [(FLHeadlessActionHandler *)self item];
      v16 = [v15 uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_1BE24A000, v13, OS_LOG_TYPE_ERROR, "Action could not be handled for %@ - %@", buf, 0x16u);
    }
    v14 = FLError(1666);
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v14);
  }
LABEL_10:
  os_activity_scope_leave(&v17);
}

- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1BE24A000, "followup/silent-handling-action", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = _FLLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(FLHeadlessActionHandler *)self item];
    *(_DWORD *)buf = 138412290;
    id v19 = v10;
    _os_log_impl(&dword_1BE24A000, v9, OS_LOG_TYPE_DEFAULT, "Starting to load extension for follow up: %@", buf, 0xCu);
  }
  v11 = +[FLHeadlessExtensionLoader sharedExtensionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke;
  block[3] = &unk_1E637B028;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(v11, block);

  os_activity_scope_leave(&state);
}

void __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke(uint64_t a1)
{
  v2 = [FLHeadlessExtensionLoader alloc];
  v3 = [*(id *)(a1 + 32) item];
  id v4 = [v3 extensionIdentifier];
  id v5 = [(FLHeadlessExtensionLoader *)v2 initWithIdentifier:v4];

  id v6 = [(FLHeadlessExtensionLoader *)v5 remoteInterface];
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v7, OS_LOG_TYPE_DEFAULT, "Extension context loaded", buf, 2u);
  }

  if (v6)
  {
    v8 = [*(id *)(a1 + 32) item];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke_2;
    v12[3] = &unk_1E637B000;
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v13 = v5;
    [v6 processFollowUpItem:v8 selectedAction:v9 completion:v12];

    v10 = v14;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    v10 = FLError(1660);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
  }
}

uint64_t __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithBool:a2];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "Headless extension processed follow up: %@", (uint8_t *)&v7, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "Handler checking out", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLHeadlessActionHandler;
  [(FLHeadlessActionHandler *)&v4 dealloc];
}

- (FLFollowUpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end