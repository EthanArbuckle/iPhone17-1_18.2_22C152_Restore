@interface DBTodayViewSynchronizedAnimationManager
- (DBTodayViewSynchronizedAnimationManager)init;
- (NSMutableDictionary)animationsByIdentifier;
- (void)invalidate;
- (void)registerAnimation:(id)a3 client:(id)a4 animation:(id)a5;
- (void)runAnimationIfPossible:(id)a3 client:(id)a4;
- (void)setAnimationsByIdentifier:(id)a3;
@end

@implementation DBTodayViewSynchronizedAnimationManager

- (DBTodayViewSynchronizedAnimationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBTodayViewSynchronizedAnimationManager;
  v2 = [(DBTodayViewSynchronizedAnimationManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    animationsByIdentifier = v2->_animationsByIdentifier;
    v2->_animationsByIdentifier = v3;
  }
  return v2;
}

- (void)registerAnimation:(id)a3 client:(id)a4 animation:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(DBTodayViewSynchronizedAnimationManager *)self animationsByIdentifier];
  v12 = [v11 objectForKey:v8];

  v13 = DBLogForCategory(0xFuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Registering animation for identifier: %@ client: %@", (uint8_t *)&v17, 0x16u);
  }

  if (!v12)
  {
    v12 = [MEMORY[0x263EFF8C0] array];
  }
  v14 = objc_alloc_init(DBTodayViewSynchronizedAnimation);
  [(DBTodayViewSynchronizedAnimation *)v14 setAnimationBlock:v10];

  [(DBTodayViewSynchronizedAnimation *)v14 setClient:v9];
  v15 = [v12 arrayByAddingObject:v14];

  v16 = [(DBTodayViewSynchronizedAnimationManager *)self animationsByIdentifier];
  [v16 setObject:v15 forKey:v8];
}

- (void)runAnimationIfPossible:(id)a3 client:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DBLogForCategory(0xFuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to run animation for identifier: %@ client: %@", buf, 0x16u);
  }

  id v9 = [(DBTodayViewSynchronizedAnimationManager *)self animationsByIdentifier];
  id v10 = [v9 objectForKey:v6];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __73__DBTodayViewSynchronizedAnimationManager_runAnimationIfPossible_client___block_invoke;
  int v17 = &unk_2649B5878;
  id v11 = v7;
  id v18 = v11;
  __int16 v19 = buf;
  [v10 enumerateObjectsUsingBlock:&v14];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v12 = DBLogForCategory(0xFuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Running animation for identifier: %@", v20, 0xCu);
    }

    objc_msgSend(MEMORY[0x263F158F8], "begin", v14, v15, v16, v17);
    [v10 enumerateObjectsUsingBlock:&__block_literal_global_16];
    [MEMORY[0x263F158F8] commit];
    v13 = [(DBTodayViewSynchronizedAnimationManager *)self animationsByIdentifier];
    [v13 removeObjectForKey:v6];
  }
  else
  {
    v13 = DBLogForCategory(0xFuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Postponing animation for identifier: %@, not all clients ready", v20, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

void __73__DBTodayViewSynchronizedAnimationManager_runAnimationIfPossible_client___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 client];
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    [v6 setReady:1];
  }
  else
  {
    char v5 = [v6 ready];

    if ((v5 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

void __73__DBTodayViewSynchronizedAnimationManager_runAnimationIfPossible_client___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  v2 = [v3 animationBlock];
  v2[2]();

  [v3 setAnimationBlock:0];
}

- (void)invalidate
{
  id v2 = [(DBTodayViewSynchronizedAnimationManager *)self animationsByIdentifier];
  [v2 removeAllObjects];
}

- (NSMutableDictionary)animationsByIdentifier
{
  return self->_animationsByIdentifier;
}

- (void)setAnimationsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end