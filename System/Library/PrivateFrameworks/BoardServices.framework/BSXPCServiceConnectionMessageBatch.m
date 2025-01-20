@interface BSXPCServiceConnectionMessageBatch
- (BOOL)appendMessage:(id)a3;
- (BOOL)commit;
- (BOOL)containsMessage:(SEL)a3;
- (BOOL)didCommit;
- (BOOL)sendSynchronously;
- (BSXPCServiceConnectionMessageBatch)initWithMessage:(id)a3;
- (id)batchHandler;
- (unint64_t)commitWithReason:(id)a3;
- (unint64_t)messageCount;
- (void)invalidate;
- (void)setBatchHandler:(id)a3;
@end

@implementation BSXPCServiceConnectionMessageBatch

- (BOOL)appendMessage:(id)a3
{
  v4 = (id *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  if (lock_messages && self->_lock_batchHandler)
  {
    v6 = lock_messages;
    v7 = (void (**)(void, void))MEMORY[0x19F399B00](self->_lock_batchHandler);
    v8 = [v4 createMessage];
    xpc_array_append_value(v6, v8);

    size_t count = xpc_array_get_count(v6);
    if (v4)
    {
      id v10 = v4[10];
      v11 = v10;
      if (v10)
      {
        lock_completions = self->_lock_completions;
        v13 = (void *)MEMORY[0x19F399B00](v10);
        [(NSMutableArray *)lock_completions addObject:v13];
      }
    }
    else
    {
      v11 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (count == 1) {
      ((void (**)(void, BSXPCServiceConnectionMessageBatch *))v7)[2](v7, self);
    }
    [v4 invalidate];
    dispatch_time_t v14 = dispatch_time(0, 100000000);
    targetQueue = self->super._targetQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__BSXPCServiceConnectionMessageBatch_appendMessage___block_invoke;
    v18[3] = &unk_1E58FCA70;
    v18[4] = self;
    v18[5] = count;
    dispatch_after(v14, targetQueue, v18);

    BOOL v16 = 1;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    BOOL v16 = 0;
  }

  return v16;
}

- (void)setBatchHandler:(id)a3
{
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  self->_lock_messages = 0;

  lock_completions = self->_lock_completions;
  self->_lock_completions = 0;

  id lock_batchHandler = self->_lock_batchHandler;
  self->_id lock_batchHandler = 0;

  os_unfair_lock_unlock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)BSXPCServiceConnectionMessageBatch;
  [(BSXPCServiceConnectionMessage *)&v7 invalidate];
}

uint64_t __52__BSXPCServiceConnectionMessageBatch_appendMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) messageCount];
  if (v2 == result)
  {
    v4 = *(void **)(a1 + 32);
    return [v4 commitWithReason:@"internal timeout"];
  }
  return result;
}

- (unint64_t)messageCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  if (lock_messages) {
    size_t count = xpc_array_get_count(lock_messages);
  }
  else {
    size_t count = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return count;
}

void __55__BSXPCServiceConnectionMessageBatch_commitWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (BSXPCServiceConnectionMessageBatch)initWithMessage:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BSXPCServiceConnectionMessageBatch;
  id v5 = [(BSXPCServiceConnectionMessage *)&v14 initWithMessage:v4];
  id v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    id v7 = (OS_xpc_object *)xpc_array_create(0, 0);
    lock_messages = v6->_lock_messages;
    v6->_lock_messages = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    lock_completions = v6->_lock_completions;
    v6->_lock_completions = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    date = v6->_date;
    v6->_date = (NSDate *)v11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_batchHandler, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_lock_completions, 0);

  objc_storeStrong((id *)&self->_lock_messages, 0);
}

- (unint64_t)commitWithReason:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = self->_lock_messages;
  id v6 = self->_lock_completions;
  id v7 = self->super._completion;
  lock_messages = self->_lock_messages;
  self->_lock_messages = 0;

  lock_completions = self->_lock_completions;
  self->_lock_completions = 0;

  id lock_batchHandler = self->_lock_batchHandler;
  self->_id lock_batchHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    size_t count = xpc_array_get_count(v5);
    if (count == 1)
    {
      xpc_array_get_value(v5, 0);
      long long v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = (int)*MEMORY[0x1E4F4F888];
      objc_super v14 = *(Class *)((char *)&self->super.super.super.isa + v13);
      *(Class *)((char *)&self->super.super.super.isa + v13) = v12;

      long long v15 = [(NSMutableArray *)v6 firstObject];
      objc_setProperty_nonatomic_copy(self, v16, v15, 80);
    }
    else
    {
      uint64_t v17 = BSServiceXPCBatchLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [(NSDate *)self->_date timeIntervalSinceNow];
        v18 = @"(reason unspecified)";
        *(_DWORD *)buf = 134218498;
        double v27 = -v19;
        if (v4) {
          v18 = v4;
        }
        __int16 v28 = 2048;
        size_t v29 = count;
        __int16 v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_19C754000, v17, OS_LOG_TYPE_DEFAULT, "sending batch message after %.3f with %zu messages: \"%@\"", buf, 0x20u);
      }

      [(BSXPCCoder *)self encodeXPCObject:v5 forKey:@"bsxpc_BATCH"];
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __55__BSXPCServiceConnectionMessageBatch_commitWithReason___block_invoke;
      newValue[3] = &unk_1E58FC2C8;
      v24 = v6;
      id v25 = v7;
      objc_setProperty_nonatomic_copy(self, v20, newValue, 80);
    }
    v22.receiver = self;
    v22.super_class = (Class)BSXPCServiceConnectionMessageBatch;
    [(BSXPCServiceConnectionMessage *)&v22 send];
  }
  else
  {
    size_t count = 0;
  }

  return count;
}

- (BOOL)sendSynchronously
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"batched messages must be sent asynchronously"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    long long v12 = v7;
    __int16 v13 = 2048;
    objc_super v14 = self;
    __int16 v15 = 2114;
    SEL v16 = @"BSXPCServiceConnectionMessage.m";
    __int16 v17 = 1024;
    int v18 = 376;
    __int16 v19 = 2114;
    SEL v20 = v4;
    _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  BOOL result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)didCommit
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_messages == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)commit
{
  return [(BSXPCServiceConnectionMessageBatch *)self commitWithReason:0] != 0;
}

- (BOOL)containsMessage:(SEL)a3
{
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_messages)
  {
    uint64_t v6 = [@"bsxpc_SEL" UTF8String];
    NSStringFromSelector(a3);
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];

    lock_messages = self->_lock_messages;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __54__BSXPCServiceConnectionMessageBatch_containsMessage___block_invoke;
    applier[3] = &unk_1E58FCCE8;
    applier[4] = &v13;
    applier[5] = v6;
    applier[6] = v8;
    xpc_array_apply(lock_messages, applier);
    os_unfair_lock_unlock(p_lock);
  }
  os_unfair_lock_unlock(p_lock);
  char v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

BOOL __54__BSXPCServiceConnectionMessageBatch_containsMessage___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, *(const char **)(a1 + 40));
  if (string) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = strcmp(string, *(const char **)(a1 + 48)) == 0;
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

- (id)batchHandler
{
  return self->_lock_batchHandler;
}

@end