@interface FLItemChangeObserver
+ (FLItemChangeObserver)observerWithChangeHandler:(id)a3;
- (void)dealloc;
- (void)setItemChangeHandler:(id)a3;
- (void)timerUpdated;
@end

@implementation FLItemChangeObserver

- (void)setItemChangeHandler:(id)a3
{
  id v4 = a3;
  v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v5, OS_LOG_TYPE_DEFAULT, "setItemChangeHandler", buf, 2u);
  }

  int notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = 0;
  }
  v7 = _Block_copy(v4);
  id itemChangeObserver = self->_itemChangeObserver;
  self->_id itemChangeObserver = v7;

  id v9 = self->_itemChangeObserver;
  v10 = _FLLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Register ItemChangeHandler", buf, 2u);
    }

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__FLItemChangeObserver_setItemChangeHandler___block_invoke;
    handler[3] = &unk_1E637B378;
    handler[4] = self;
    notify_register_dispatch("com.apple.corefollowup.items_changed", &self->_notifyToken, MEMORY[0x1E4F14428], handler);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE24A000, v10, OS_LOG_TYPE_DEFAULT, "Unregister ItemChangeHandler", buf, 2u);
    }
  }
}

+ (FLItemChangeObserver)observerWithChangeHandler:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FLItemChangeObserver);
  [(FLItemChangeObserver *)v4 setItemChangeHandler:v3];

  return v4;
}

uint64_t __45__FLItemChangeObserver_setItemChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(id)objc_opt_class() description];
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BE24A000, v2, OS_LOG_TYPE_DEFAULT, "Observer <%@ : %p> detected store changed, calling observer...", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)timerUpdated
{
  id itemChangeObserver = (void (**)(void))self->_itemChangeObserver;
  if (itemChangeObserver) {
    itemChangeObserver[2]();
  }
}

- (void)dealloc
{
  [(FLItemChangeObserver *)self setItemChangeHandler:0];
  v3.receiver = self;
  v3.super_class = (Class)FLItemChangeObserver;
  [(FLItemChangeObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end