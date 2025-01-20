@interface CSPolicy
- (BOOL)_checkAllConditionsEnabled;
- (BOOL)isEnabled;
- (CSPolicy)init;
- (void)CSEventMonitorDidReceiveEvent:(id)a3;
- (void)addConditions:(id)a3;
- (void)dealloc;
- (void)notifyCallback:(BOOL)a3 option:(unint64_t)a4;
- (void)notifyCallbackWithOption:(unint64_t)a3;
- (void)setCallback:(id)a3;
- (void)subscribeEventMonitor:(id)a3;
@end

@implementation CSPolicy

uint64_t __21__CSPolicy_isEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _checkAllConditionsEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void *__42__CSPolicy_CSEventMonitorDidReceiveEvent___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[3];
  if (v3)
  {
    uint64_t v4 = [result _checkAllConditionsEnabled];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    return (void *)v6(v3, v4, v5);
  }
  return result;
}

- (BOOL)_checkAllConditionsEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_conditions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * i)))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)CSEventMonitorDidReceiveEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 type] == 1;
  uint64_t v6 = [v4 type];

  queue = self->_queue;
  if (v6 == 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CSPolicy_CSEventMonitorDidReceiveEvent___block_invoke;
    block[3] = &unk_1E6201378;
    block[4] = self;
    block[5] = v5 | 2;
    dispatch_sync(queue, block);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__CSPolicy_CSEventMonitorDidReceiveEvent___block_invoke_2;
    v8[3] = &unk_1E6201378;
    v8[4] = self;
    v8[5] = v5;
    dispatch_async(queue, v8);
  }
}

- (BOOL)isEnabled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__CSPolicy_isEnabled__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__37__CSPolicy_notifyCallbackWithOption___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[3];
  if (v3)
  {
    uint64_t v4 = [result _checkAllConditionsEnabled];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    return (void *)v6(v3, v4, v5);
  }
  return result;
}

- (void)notifyCallbackWithOption:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CSPolicy_notifyCallbackWithOption___block_invoke;
  v4[3] = &unk_1E6201378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
}

void *__42__CSPolicy_CSEventMonitorDidReceiveEvent___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = result[3];
  if (v3)
  {
    uint64_t v4 = [result _checkAllConditionsEnabled];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    return (void *)v6(v3, v4, v5);
  }
  return result;
}

- (void)notifyCallback:(BOOL)a3 option:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CSPolicy_notifyCallback_option___block_invoke;
  block[3] = &unk_1E61FFF90;
  BOOL v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(queue, block);
}

uint64_t __34__CSPolicy_notifyCallback_option___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
  return result;
}

- (void)subscribeEventMonitor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__CSPolicy_subscribeEventMonitor___block_invoke;
    v7[3] = &unk_1E6201030;
    id v8 = v4;
    char v9 = self;
    dispatch_sync(queue, v7);
  }
}

uint64_t __34__CSPolicy_subscribeEventMonitor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  return [v3 addObject:v2];
}

- (void)addConditions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__CSPolicy_addConditions___block_invoke;
    v7[3] = &unk_1E62012B0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

void __26__CSPolicy_addConditions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = (id)MEMORY[0x1BA9E7570](*(void *)(a1 + 40));
  [v1 addObject:v2];
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__CSPolicy_dealloc__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CSPolicy;
  [(CSPolicy *)&v4 dealloc];
}

void __19__CSPolicy_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeObserver:", *(void *)(a1 + 32), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__CSPolicy_setCallback___block_invoke;
  v7[3] = &unk_1E62012B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __24__CSPolicy_setCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = MEMORY[0x1BA9E7570](*(void *)(a1 + 40));
  return MEMORY[0x1F41817F8]();
}

- (CSPolicy)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSPolicy;
  id v2 = [(CSPolicy *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    monitors = v2->_monitors;
    v2->_monitors = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableArray *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("Serial CSPolicy queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

@end