@interface BLSHGenericSceneDelegateWithActionHandlers
- (BLSHGenericSceneDelegateWithActionHandlers)init;
- (id)actionHandlers;
- (void)addActionHandler:(id)a3 forScene:(id)a4;
- (void)removeActionHandler:(id)a3 forScene:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
@end

@implementation BLSHGenericSceneDelegateWithActionHandlers

- (BLSHGenericSceneDelegateWithActionHandlers)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLSHGenericSceneDelegateWithActionHandlers;
  v2 = [(BLSHGenericSceneDelegateWithActionHandlers *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    actionHandlers = v3->_actionHandlers;
    v3->_actionHandlers = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)addActionHandler:(id)a3 forScene:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_actionHandlers addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeActionHandler:(id)a3 forScene:(id)a4
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_actionHandlers removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (id)actionHandlers
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (id *)[v1[1] copy];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = -[BLSHGenericSceneDelegateWithActionHandlers actionHandlers]((os_unfair_lock_s *)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      v13 = v7;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v7 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) respondToActions:v13 forFBScene:v6];

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void).cxx_destruct
{
}

@end