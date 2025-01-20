@interface BSActionResponder
+ (id)responderByWrappingResponder:(id)a3 withHandler:(id)a4;
+ (id)responderWithHandler:(id)a3;
- (BSActionResponder)init;
- (os_unfair_lock)_lock_underlying;
- (void)_initWithHandler:(void *)a1;
- (void)annul;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)setTimeout:(unint64_t)a3;
@end

@implementation BSActionResponder

id __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 105) withName:@"clientInvalidated"];
  id result = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 103) withName:@"clientEncoded"];
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v4 + 101))
  {
    id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(v4 + 104) withName:@"clientResponded"];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = 72;
    if (*(unsigned char *)(v6 + 104))
    {
      v8 = @"response";
    }
    else
    {
      uint64_t v7 = 40;
      v8 = @"reply";
    }
    id v9 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v6 + v7) withName:v8];
    id result = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 106) withName:@"annulled"];
  }
  if (*(void *)(a1 + 48) == 2)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v10 + 100))
    {
      if (!*(unsigned char *)(v10 + 101) && !*(unsigned char *)(v10 + 104))
      {
        uint64_t v11 = *(void *)(v10 + 72);
        if (v11)
        {
          id v12 = (id)[*(id *)(a1 + 32) appendObject:v11 withName:@"receivedResponse"];
          uint64_t v10 = *(void *)(a1 + 40);
        }
      }
      id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v10 + 8) withName:@"responseQueue" skipIfNil:1];
      v14 = *(void **)(a1 + 32);
      v15 = (void *)MEMORY[0x18C125630](*(void *)(*(void *)(a1 + 40) + 16));
      id v16 = (id)[v14 appendObject:v15 withName:@"responseHandler" skipIfNil:1];

      id v17 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"timeoutSource" skipIfNil:1];
      id v18 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"replySource" skipIfNil:1];
      uint64_t v10 = *(void *)(a1 + 40);
    }
    id v19 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v10 + 80) withName:@"nullificationQueue" skipIfNil:1];
    v20 = *(void **)(a1 + 32);
    v21 = (void *)MEMORY[0x18C125630](*(void *)(*(void *)(a1 + 40) + 88));
    id v22 = (id)[v20 appendObject:v21 withName:@"nullificationHandler" skipIfNil:1];

    id v23 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 107) withName:@"nullificationHandlerIsLegacy" ifEqualTo:1];
    id v24 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"nullificationMach" skipIfNil:1];
    return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"inactivationStack" skipIfNil:1];
  }
  return result;
}

uint64_t __118___BSActionResponder__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_underlying, 0);
  objc_storeStrong(&self->_lock_handler, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
}

void __36___BSActionResponder_action_encode___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = xpc_pipe_receive();
  if (v2 == 5)
  {
    v3 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](*(void *)(a1 + 32), v3, 0, 1, 1);
  }
  else if (v2 == 35)
  {
    v3 = BSLogBSAction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 56);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_debug_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_DEBUG, "Responder-receiveReply %@: xpc_pipe_receive unexpectedly returned EAGAIN", buf, 0xCu);
    }
  }
  else
  {
    if (v2)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    v3 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 3uLL);
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](*(void *)(a1 + 32), v3, 0, 1, 1);
  }
}

const os_unfair_lock *__68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:-[_BSActionResponder _lock_isClientActive](*(const os_unfair_lock **)(a1 + 40)) withName:@"active"];
  id result = *(const os_unfair_lock **)(a1 + 40);
  if (!BYTE1(result[25]._os_unfair_lock_opaque)) {
    return (const os_unfair_lock *)(id)[*(id *)(a1 + 32) appendBool:-[_BSActionResponder _lock_canSendResponse](result) withName:@"waiting"];
  }
  return result;
}

- (os_unfair_lock)_lock_underlying
{
  if (a1)
  {
    v1 = a1;
    os_unfair_lock_assert_owner(a1 + 10);
    id v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    if (!v2)
    {
      v3 = *(void **)&v1[2]._os_unfair_lock_opaque;
      uint64_t v4 = v3;
      if (!v3)
      {
        uint64_t v4 = dispatch_get_global_queue(21, 0);
      }
      uint64_t v5 = +[_BSActionResponder originator_responderOnQueue:forHandler:]((uint64_t)_BSActionResponder, v4, *(void **)&v1[4]._os_unfair_lock_opaque);
      uint64_t v6 = *(void **)&v1[6]._os_unfair_lock_opaque;
      *(void *)&v1[6]._os_unfair_lock_opaque = v5;

      if (!v3) {
      dispatch_time_t v7 = *(void *)&v1[8]._os_unfair_lock_opaque;
      }
      if (v7 != -1) {
        -[_BSActionResponder originator_setTimeout:](*(void *)&v1[6]._os_unfair_lock_opaque, v7);
      }
      v8 = *(void **)&v1[2]._os_unfair_lock_opaque;
      *(void *)&v1[2]._os_unfair_lock_opaque = 0;

      id v9 = *(void **)&v1[4]._os_unfair_lock_opaque;
      *(void *)&v1[4]._os_unfair_lock_opaque = 0;

      id v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    }
    a1 = v2;
  }
  return a1;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_underlying)
  {
    -[BSActionResponder _lock_underlying]((os_unfair_lock *)self);
    uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder originator_annulWithErrorCode:](v4, 1uLL);
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BSActionResponder;
  [(BSActionResponder *)&v5 dealloc];
}

+ (id)responderWithHandler:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      id v17 = a1;
      __int16 v18 = 2114;
      id v19 = @"BSAction.m";
      __int16 v20 = 1024;
      int v21 = 76;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v8 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEB2B0);
  }
  uint64_t v6 = -[BSActionResponder _initWithHandler:]([BSActionResponder alloc], v5);

  return v6;
}

- (void)_initWithHandler:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BSActionResponder;
    uint64_t v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 10) = 0;
      uint64_t v5 = [v3 copy];
      uint64_t v6 = (void *)a1[2];
      a1[2] = v5;

      a1[4] = -1;
    }
  }

  return a1;
}

uint64_t __36___BSActionResponder_action_encode___block_invoke(uint64_t a1)
{
  return mach_port_destruct(*MEMORY[0x1E4F14960], *(_DWORD *)(a1 + 40), 0, *(void *)(a1 + 32));
}

+ (id)responderByWrappingResponder:(id)a3 withHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Bsactionrespon_1.isa);
  if (!v9)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      int v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      id v43 = v20;
      __int16 v44 = 2114;
      v45 = v22;
      __int16 v46 = 2048;
      id v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSAction.m";
      __int16 v50 = 1024;
      int v51 = 81;
      __int16 v52 = 2114;
      v53 = v19;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v19 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF2CF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSActionResponderClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v43 = v24;
      __int16 v44 = 2114;
      v45 = v26;
      __int16 v46 = 2048;
      id v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSAction.m";
      __int16 v50 = 1024;
      int v51 = 81;
      __int16 v52 = 2114;
      v53 = v23;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v23 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF2DFCLL);
  }

  if (!v8)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      id v43 = v28;
      __int16 v44 = 2114;
      v45 = v30;
      __int16 v46 = 2048;
      id v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSAction.m";
      __int16 v50 = 1024;
      int v51 = 82;
      __int16 v52 = 2114;
      v53 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF2F00);
  }
  os_unfair_lock_lock((os_unfair_lock_t)v9 + 10);
  if (*((void *)v9 + 3))
  {
    v31 = [NSString stringWithFormat:@"cannot query after associating with an action or annulling"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__queue);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138544642;
      id v43 = v32;
      __int16 v44 = 2114;
      v45 = v34;
      __int16 v46 = 2048;
      id v47 = v9;
      __int16 v48 = 2114;
      v49 = @"BSAction.m";
      __int16 v50 = 1024;
      int v51 = 136;
      __int16 v52 = 2114;
      v53 = v31;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v31 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF2FFCLL);
  }
  id v10 = *((id *)v9 + 1);
  os_unfair_lock_unlock((os_unfair_lock_t)v9 + 10);
  uint64_t v11 = [[BSAction alloc] initWithInfo:0 responder:v9];
  id v12 = [BSActionResponder alloc];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke;
  v37[3] = &unk_1E5446BD8;
  id v13 = v8;
  id v39 = v13;
  SEL v40 = a2;
  id v41 = a1;
  __int16 v14 = v11;
  v38 = v14;
  v15 = -[BSActionResponder _initWithHandler:](v12, v37);
  __int16 v16 = v15;
  if (v10) {
    [v15 setQueue:v10];
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_64;
  v35[3] = &unk_1E54457C8;
  id v17 = v16;
  id v36 = v17;
  [(BSAction *)v14 setNullificationHandler:v35];

  return v17;
}

- (void)setTimeout:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_underlying)
  {
    id v7 = [NSString stringWithFormat:@"cannot mutate timeout after associating with an action or annulling"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      id v12 = v8;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2114;
      __int16 v18 = @"BSAction.m";
      __int16 v19 = 1024;
      int v20 = 115;
      __int16 v21 = 2114;
      __int16 v22 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF5258);
  }
  self->_lock_timeout = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (OS_dispatch_queue *)a3;
  if (!v5)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v16 = v8;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      __int16 v19 = 2048;
      int v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = @"BSAction.m";
      __int16 v23 = 1024;
      int v24 = 106;
      __int16 v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF7A30);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_underlying)
  {
    int v11 = [NSString stringWithFormat:@"cannot mutate queue after associating with an action or annulling"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v13 = (objc_class *)objc_opt_class();
      __int16 v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      id v16 = v12;
      __int16 v17 = 2114;
      __int16 v18 = v14;
      __int16 v19 = 2048;
      int v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = @"BSAction.m";
      __int16 v23 = 1024;
      int v24 = 108;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v11 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF7B28);
  }
  lock_queue = self->_lock_queue;
  self->_lock_queue = v5;

  os_unfair_lock_unlock(&self->_lock);
}

void __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke(uint64_t a1, mach_port_name_t a2)
{
  kern_return_t v8;
  uint64_t v9;
  void *v10;
  mach_port_t previous;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  uint64_t *v16;
  id v17[2];
  mach_port_name_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id location;
  mach_port_options_t options;
  mach_port_name_t name;

  if (a2 - 1 > 0xFFFFFFFD) {
    return;
  }
  name = 0;
  options.8 = 0uLL;
  *(void *)&options.flags = 163;
  uint64_t v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
  if (mach_port_construct(*MEMORY[0x1E4F14960], &options, (mach_port_context_t)&name, &name))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (name + 1 <= 1)
  {
LABEL_11:
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  __int16 v19 = 0;
  int v20 = (id *)&v19;
  __int16 v21 = 0x3042000000;
  __int16 v22 = __Block_byref_object_copy__6;
  __int16 v23 = __Block_byref_object_dispose__6;
  int v24 = 0;
  id v12 = MEMORY[0x1E4F143A8];
  __int16 v13 = 3221225472;
  __int16 v14 = __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke_80;
  __int16 v15 = &unk_1E5446538;
  objc_copyWeak(v17, &location);
  __int16 v18 = name;
  id v16 = &v19;
  v17[1] = &name;
  uint64_t v5 = (void *)dispatch_mach_create();
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  objc_storeWeak(v20 + 5, v5);
  dispatch_mach_connect();
  previous = 0;
  id v8 = mach_port_request_notification(*v4, a2, 72, 0, name, 0x15u, &previous);
  if (previous) {
    mach_port_deallocate(*v4, previous);
  }
  if (v8)
  {
    dispatch_mach_cancel();
    id v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = 0;
  }
  objc_destroyWeak(v17);
  _Block_object_dispose(&v19, 8);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke_80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 == 8)
  {
    mach_port_destruct(*MEMORY[0x1E4F14960], *(_DWORD *)(a1 + 56), 0, *(void *)(a1 + 48));
  }
  else if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    if (WeakRetained)
    {
      os_unfair_lock_lock(WeakRetained + 24);
      if (v8
        && *(id *)&WeakRetained[12]._os_unfair_lock_opaque == v8
        && (BYTE2(WeakRetained[26]._os_unfair_lock_opaque) = 1,
            dispatch_mach_cancel(),
            id v10 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque,
            *(void *)&WeakRetained[12]._os_unfair_lock_opaque = 0,
            v10,
            *(void *)&WeakRetained[22]._os_unfair_lock_opaque))
      {
        id v9 = (void (**)(void))MEMORY[0x18C125630]();
        int v11 = *(void **)&WeakRetained[20]._os_unfair_lock_opaque;
        if (!v11)
        {
          __int16 v13 = [NSString stringWithFormat:@"missing nullification queue"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__nullificationQueue_didNullifyWithMach_);
            id v14 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v15 = (objc_class *)objc_opt_class();
            id v16 = NSStringFromClass(v15);
            *(_DWORD *)buf = 138544642;
            id v18 = v14;
            __int16 v19 = 2114;
            int v20 = v16;
            __int16 v21 = 2048;
            __int16 v22 = WeakRetained;
            __int16 v23 = 2114;
            int v24 = @"BSActionResponder.m";
            __int16 v25 = 1024;
            int v26 = 680;
            __int16 v27 = 2114;
            id v28 = v13;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v13 UTF8String];
          __break(0);
          JUMPOUT(0x18AB2BA10);
        }
        *(void *)&WeakRetained[20]._os_unfair_lock_opaque = 0;

        id v12 = *(void **)&WeakRetained[22]._os_unfair_lock_opaque;
        *(void *)&WeakRetained[22]._os_unfair_lock_opaque = 0;

        os_unfair_lock_unlock(WeakRetained + 24);
        if (v9) {
          v9[2](v9);
        }
      }
      else
      {
        os_unfair_lock_unlock(WeakRetained + 24);
        id v9 = 0;
      }
    }
  }
}

void __44___BSActionResponder_originator_setTimeout___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 24);
    -[_BSActionResponder _consumeLock_originator_annulWithCode:alreadyOnResponseQueue:]((uint64_t)WeakRetained, 2uLL, 1);
  }
}

- (BSActionResponder)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on BSActionResponder"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSAction.m";
    __int16 v17 = 1024;
    int v18 = 52;
    __int16 v19 = 2114;
    int v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  id result = (BSActionResponder *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

void __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_2;
  __int16 v17 = &unk_1E5446BB0;
  id v6 = v4;
  long long v21 = *(_OWORD *)(a1 + 48);
  id v18 = v6;
  int v20 = &v22;
  id v19 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, uint64_t *))(v5 + 16))(v5, v3, &v14);
  if (!*((unsigned char *)v23 + 24))
  {
    id v7 = NSString;
    id v8 = (void *)MEMORY[0x18C125630](*(void *)(a1 + 40));
    int v9 = [v7 stringWithFormat:@"handler failed to call wrappedHandler in scope : handler = %@", v8, v14, v15, v16, v17, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544642;
      id v27 = v10;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      __int16 v30 = 2048;
      uint64_t v31 = v13;
      __int16 v32 = 2114;
      v33 = @"BSAction.m";
      __int16 v34 = 1024;
      int v35 = 94;
      __int16 v36 = 2114;
      v37 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AB38324);
  }

  _Block_object_dispose(&v22, 8);
}

void __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F29060] currentThread];

  if (v3 != v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"handler failed to call wrappedHandler in scope"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v17 = v6;
      __int16 v18 = 2114;
      id v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      __int16 v23 = @"BSAction.m";
      __int16 v24 = 1024;
      int v25 = 89;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v5 UTF8String];
    __break(0);
    JUMPOUT(0x18AB38548);
  }
  if (!v15)
  {
    id v10 = [NSString stringWithFormat:@"handler failed to call wrappedHandler with a valid response"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      id v17 = v11;
      __int16 v18 = 2114;
      id v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      __int16 v23 = @"BSAction.m";
      __int16 v24 = 1024;
      int v25 = 90;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AB38644);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 40), "sendResponse:");
}

uint64_t __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_64(uint64_t a1)
{
  return [*(id *)(a1 + 32) annul];
}

- (void)annul
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSActionResponder _lock_underlying]((os_unfair_lock *)self);
  uint64_t v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[_BSActionResponder originator_annulWithErrorCode:](v4, 6uLL);

  os_unfair_lock_unlock(p_lock);
}

@end