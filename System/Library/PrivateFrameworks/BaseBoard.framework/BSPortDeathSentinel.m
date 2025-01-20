@interface BSPortDeathSentinel
+ (void)monitorSendRight:(id)a3 withHandler:(id)a4;
- (BOOL)isValid;
- (BSPortDeathSentinel)initWithSendRight:(id)a3;
- (OS_dispatch_queue)queue;
- (void)activateWithHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setQueue:(id)a3;
@end

@implementation BSPortDeathSentinel

+ (void)monitorSendRight:(id)a3 withHandler:(id)a4
{
  if (!a4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"BSPortDeathSentinel.m", 59, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  v6 = [[BSPortDeathSentinel alloc] initWithSendRight:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__BSPortDeathSentinel_monitorSendRight_withHandler___block_invoke;
  v11[3] = &unk_1E5445C90;
  v12 = v6;
  id v13 = a4;
  v7 = v6;
  [(BSPortDeathSentinel *)v7 activateWithHandler:v11];
}

- (BSPortDeathSentinel)initWithSendRight:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Bsmachportsend.isa);
  if (!v5)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v20 = v11;
      __int16 v21 = 2114;
      v22 = v13;
      __int16 v23 = 2048;
      v24 = self;
      __int16 v25 = 2114;
      v26 = @"BSPortDeathSentinel.m";
      __int16 v27 = 1024;
      int v28 = 43;
      __int16 v29 = 2114;
      v30 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AACDC20);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSMachPortSendRightClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v20 = v15;
      __int16 v21 = 2114;
      v22 = v17;
      __int16 v23 = 2048;
      v24 = self;
      __int16 v25 = 2114;
      v26 = @"BSPortDeathSentinel.m";
      __int16 v27 = 1024;
      int v28 = 43;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v14 UTF8String];
    __break(0);
    JUMPOUT(0x18AACDD24);
  }

  v18.receiver = self;
  v18.super_class = (Class)BSPortDeathSentinel;
  v6 = [(BSPortDeathSentinel *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    sendRight = v6->_sendRight;
    v6->_sendRight = (BSMachPortSendRight *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

- (void)setQueue:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__BSPortDeathSentinel_setQueue___block_invoke;
  v3[3] = &unk_1E5446288;
  v3[5] = a3;
  v3[6] = a2;
  v3[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v3);
}

- (void)activateWithHandler:(id)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"BSPortDeathSentinel.m", 69, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke;
  v7[3] = &unk_1E5446260;
  v7[5] = a3;
  v7[6] = a2;
  v7[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v7);
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"BSPortDeathSentinel.m" lineNumber:72 description:@"port right sentinel cannot be activated multiple times"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 33))
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"BSPortDeathSentinel.m" lineNumber:73 description:@"port right sentinel cannot be activated after invalidation"];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 32) = 1;
  v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v3)
  {
    self;
    if (qword_1EB21B1B8 != -1) {
      dispatch_once(&qword_1EB21B1B8, &__block_literal_global_18);
    }
    v3 = (void *)_MergedGlobals_20;
  }
  v4 = v3;
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
  unsigned int v6 = [v5 rawPort];
  if (v6 - 1 > 0xFFFFFFFD)
  {
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32) + 16;
    dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14460], v6, 1uLL, v4);
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;

    id v11 = v8;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke_2;
    handler[3] = &unk_1E5446260;
    uint64_t v12 = *(void *)(a1 + 40);
    objc_super v18 = v11;
    uint64_t v19 = v12;
    uint64_t v20 = v7;
    id v13 = v11;
    dispatch_source_set_event_handler(v13, handler);
    id v16 = v5;
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v13);
  }
}

void __32__BSPortDeathSentinel_setQueue___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 32))
  {
    unsigned int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a1[6] object:a1[4] file:@"BSPortDeathSentinel.m" lineNumber:117 description:@"port right sentinel cannot be mutated after activation"];

    uint64_t v2 = a1[4];
  }
  if (*(unsigned char *)(v2 + 33))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[6] object:a1[4] file:@"BSPortDeathSentinel.m" lineNumber:118 description:@"port right sentinel cannot be mutated after invalidation"];

    uint64_t v2 = a1[4];
  }
  v4 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  id v5 = (void *)a1[5];
  if (v4 != v5)
  {
    objc_storeStrong(v3, v5);
  }
}

uint64_t __52__BSPortDeathSentinel_monitorSendRight_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke_3;
  v6[3] = &unk_1E5446238;
  id v7 = *(id *)(a1 + 32);
  dispatch_source_t v8 = &v9;
  __lockAndExecute(v2, (uint64_t)v6);
  if (*((unsigned char *)v10 + 24)) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v4, v5);
  }

  _Block_object_dispose(&v9, 8);
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (!dispatch_source_testcancel(v2))
  {
    dispatch_source_cancel(v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __43__BSPortDeathSentinel_activateWithHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)dealloc
{
  source = self->_source;
  if (source) {
    dispatch_source_cancel(source);
  }
  v4.receiver = self;
  v4.super_class = (Class)BSPortDeathSentinel;
  [(BSPortDeathSentinel *)&v4 dealloc];
}

- (BOOL)isValid
{
  uint64_t v5 = 0;
  unsigned int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__BSPortDeathSentinel_isValid__block_invoke;
  v4[3] = &unk_1E5446238;
  v4[4] = self;
  v4[5] = &v5;
  __lockAndExecute(&self->_lock, (uint64_t)v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__BSPortDeathSentinel_isValid__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 33))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v3 = *(NSObject **)(v2 + 24);
    if (v3 && dispatch_source_testcancel(v3)) {
      result = 0;
    }
    else {
      result = [*(id *)(v2 + 8) isUsable];
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __36__BSPortDeathSentinel__callOutQueue__block_invoke()
{
  dispatch_queue_t Serial = BSDispatchQueueCreateSerial(@"BSPortDeathSentinelCallOut");
  uint64_t v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = (uint64_t)Serial;
}

- (void)invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__BSPortDeathSentinel_invalidate__block_invoke;
  v2[3] = &unk_1E54457C8;
  v2[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v2);
}

void __33__BSPortDeathSentinel_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 33))
  {
    *(unsigned char *)(v1 + 33) = 1;
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (v2) {
      dispatch_source_cancel(v2);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_callOutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sendRight, 0);
}

@end