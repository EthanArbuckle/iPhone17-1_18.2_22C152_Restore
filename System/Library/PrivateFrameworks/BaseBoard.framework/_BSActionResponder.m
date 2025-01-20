@interface _BSActionResponder
+ (_BYTE)action_decodeFromXPCObject:(uint64_t)a1;
+ (void)originator_nullResponder;
+ (void)originator_responderOnQueue:(void *)a3 forHandler:;
- (NSString)debugDescription;
- (_BSActionResponder)init;
- (_BYTE)_initWithReply:(unsigned char *)a1;
- (const)_lock_canSendResponse;
- (const)_lock_invalidateForEncode:(const os_unfair_lock *)result;
- (const)_lock_isClientActive;
- (id)_descriptionBuilderOfType:(os_unfair_lock_s *)a1 withMultilinePrefix:(uint64_t)a2;
- (id)action_encode:(uint64_t)a1;
- (id)action_fullIdentifier;
- (id)action_shortIdentifier;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)action_canSendResponse;
- (os_unfair_lock_s)action_isValid;
- (uint64_t)_consumeLock_trySendResponse:(int)a3 alreadyLocked:(int)a4 alreadyOnResponseQueue:(int)a5 fireLegacyInvalidationHandler:;
- (uint64_t)_lock_isValid;
- (uint64_t)action:(void *)a3 sendResponse:;
- (void)_consumeLock_originator_annulWithCode:(int)a3 alreadyOnResponseQueue:;
- (void)_initWithQueue:(void *)a3 handler:;
- (void)_lock_logResponse:(uint64_t)a1;
- (void)action:(void *)a3 setNullificationQueue:(int)a4 isLegacy:(void *)a5 handler:;
- (void)action_didDealloc;
- (void)action_invalidate;
- (void)dealloc;
- (void)originator_annulWithErrorCode:(os_unfair_lock_s *)a1;
- (void)originator_didInit:(uint64_t)a1;
- (void)originator_setTimeout:(uint64_t)a1;
@end

@implementation _BSActionResponder

- (id)action_shortIdentifier
{
  if (a1
    && (-[_BSActionResponder action_fullIdentifier](a1), (v1 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = v1;
    uint64_t v3 = [v1 rangeOfString:@"0x"];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      v4 = objc_msgSend(v2, "substringWithRange:", v3, objc_msgSend(v2, "length") + ~v3);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)action_fullIdentifier
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 24;
    os_unfair_lock_lock(a1 + 24);
    v1 = (id *)v1[7];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_BSActionResponder *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v3 = -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 1);
  return v3;
}

- (id)_descriptionBuilderOfType:(os_unfair_lock_s *)a1 withMultilinePrefix:(uint64_t)a2
{
  if (a1)
  {
    os_unfair_lock_lock(a1 + 24);
    v4 = +[BSDescriptionBuilder builderWithObject:a1];
    v5 = v4;
    if (a2 == 2) {
      [v4 setUseDebugDescription:1];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke;
    v15[3] = &unk_1E54456B8;
    id v6 = v5;
    id v16 = v6;
    v17 = a1;
    id v7 = (id)[v6 modifyProem:v15];
    if (a2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke_2;
      v11[3] = &unk_1E5446288;
      id v12 = v6;
      v13 = a1;
      uint64_t v14 = a2;
      id v8 = (id)[v12 modifyBody:v11];
    }
    os_unfair_lock_unlock(a1 + 24);
    id v9 = v6;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_nullificationHandler, 0);
  objc_storeStrong((id *)&self->_lock_nullificationQueue, 0);
  objc_storeStrong((id *)&self->_lock_response, 0);
  objc_storeStrong((id *)&self->_lock_inactivationCallStack, 0);
  objc_storeStrong((id *)&self->_lock_action_identifier, 0);
  objc_storeStrong((id *)&self->_lock_nullificationMach, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_lock_originator_replySource, 0);
  objc_storeStrong((id *)&self->_lock_originator_timeoutSource, 0);
  objc_storeStrong(&self->_lock_originator_responseHandler, 0);
  objc_storeStrong((id *)&self->_originator_responseQueue, 0);
}

- (void)action_didDealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    os_unfair_lock_assert_owner(v2);
    if (*(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 103) || *(unsigned char *)(a1 + 105))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      if (-[_BSActionResponder _lock_canSendResponse]((const os_unfair_lock *)a1))
      {
        uint64_t v3 = BSLogBSAction();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          uint64_t v4 = *(void *)(a1 + 56);
          int v6 = 138543362;
          uint64_t v7 = v4;
          _os_log_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_INFO, "Dealloc %{public}@", (uint8_t *)&v6, 0xCu);
        }
      }
      v5 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
      -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v5, 1, 0, 1);
    }
  }
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[_BSActionResponder _lock_isClientActive]((const os_unfair_lock *)self))
  {
    v5 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:]((uint64_t)self, v5, 1, 0, 1);
  }
  else
  {
    if (self->_lock_originator_responseHandler)
    {
      uint64_t v7 = [NSString stringWithFormat:@"response handler must have been called by now"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138544642;
        id v13 = v8;
        __int16 v14 = 2114;
        v15 = v10;
        __int16 v16 = 2048;
        v17 = self;
        __int16 v18 = 2114;
        v19 = @"BSActionResponder.m";
        __int16 v20 = 1024;
        int v21 = 96;
        __int16 v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v7 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE1EECLL);
    }
    id lock_nullificationHandler = self->_lock_nullificationHandler;
    if (lock_nullificationHandler && self->_lock_nullificationHandlerIsLegacy) {
      dispatch_async((dispatch_queue_t)self->_lock_nullificationQueue, lock_nullificationHandler);
    }
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)self, 0);
    os_unfair_lock_unlock(p_lock);
  }
  v11.receiver = self;
  v11.super_class = (Class)_BSActionResponder;
  [(_BSActionResponder *)&v11 dealloc];
}

- (const)_lock_isClientActive
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 24);
    if (LOBYTE(v1[26]._os_unfair_lock_opaque) || HIBYTE(v1[25]._os_unfair_lock_opaque)) {
      return 0;
    }
    else {
      return (const os_unfair_lock *)(BYTE1(v1[26]._os_unfair_lock_opaque) == 0);
    }
  }
  return result;
}

- (uint64_t)_consumeLock_trySendResponse:(int)a3 alreadyLocked:(int)a4 alreadyOnResponseQueue:(int)a5 fireLegacyInvalidationHandler:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = v10;
  if (!a1)
  {
    unsigned __int8 v53 = 0;
    goto LABEL_57;
  }
  id v11 = v10;
  NSClassFromString(&cfstr_Bsactionrespon_0.isa);
  if (!v11)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler_);
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      *(_DWORD *)buf = 138544642;
      id v55 = v43;
      __int16 v56 = 2114;
      *(void *)v57 = v45;
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = a1;
      __int16 v58 = 2114;
      v59 = @"BSActionResponder.m";
      __int16 v60 = 1024;
      int v61 = 557;
      __int16 v62 = 2114;
      v63 = v42;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v42 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE2560);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSActionResponseClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler_);
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      *(_DWORD *)buf = 138544642;
      id v55 = v47;
      __int16 v56 = 2114;
      *(void *)v57 = v49;
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = a1;
      __int16 v58 = 2114;
      v59 = @"BSActionResponder.m";
      __int16 v60 = 1024;
      int v61 = 557;
      __int16 v62 = 2114;
      v63 = v46;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v46 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE2664);
  }

  id v12 = (os_unfair_lock_s *)(a1 + 96);
  if (a3)
  {
    os_unfair_lock_assert_owner(v12);
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    os_unfair_lock_lock(v12);
    if (!a4) {
      goto LABEL_10;
    }
  }
  id v13 = *(NSObject **)(a1 + 8);
  if (v13) {
    dispatch_assert_queue_V2(v13);
  }
LABEL_10:
  __int16 v14 = *(void **)(a1 + 72);
  if (v14)
  {
    id v15 = v14;

    id v11 = v15;
  }
  else
  {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
  __int16 v16 = *(void **)(a1 + 40);
  if (v16)
  {
    mach_port_name_t v17 = [v16 extractPortAndIKnowWhatImDoingISwear];
    mach_port_name_t v18 = v17;
    if (v17 - 1 > 0xFFFFFFFD)
    {
      if (v17)
      {
        v30 = BSLogBSAction();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543362;
          id v55 = v31;
          _os_log_impl(&dword_18AAA8000, v30, OS_LOG_TYPE_DEFAULT, "Reply failed %{public}@: port is invalid (originating action likely timed out)", buf, 0xCu);
        }

        BSMachSendRightRelease(v18);
      }
      char v32 = 0;
      goto LABEL_44;
    }
    -[_BSActionResponder _lock_logResponse:](a1, v11);
    reply_from_port = (void *)xpc_pipe_create_reply_from_port();
    if (reply_from_port)
    {
      id v20 = BSSerializeBSXPCEncodableObjectToXPCDictionary(v11, reply_from_port);
      int v21 = xpc_pipe_routine_reply();
      int v22 = v21;
      if (!v21)
      {
        char v32 = 1;
LABEL_43:

LABEL_44:
        [*(id *)(a1 + 40) invalidate];
        goto LABEL_45;
      }
      if (v21 == 32)
      {
        v23 = BSLogBSAction();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543362;
          id v55 = v24;
          _os_log_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_DEFAULT, "Reply failed %{public}@: receiver is no longer valid (EPIPE)", buf, 0xCu);
        }
      }
      else
      {
        v23 = BSLogBSAction();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v41 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          id v55 = v41;
          __int16 v56 = 1024;
          *(_DWORD *)v57 = v22;
          *(_WORD *)&v57[4] = 2082;
          *(void *)&v57[6] = strerror(v22);
          _os_log_error_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_ERROR, "Reply failed %{public}@: xpc_pipe_routine_reply() returned %i (%{public}s)", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v35 = BSLogBSAction();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v40 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        id v55 = v40;
        _os_log_error_impl(&dword_18AAA8000, v35, OS_LOG_TYPE_ERROR, "Reply failed %{public}@: xpc_pipe_create_reply_from_port() failed to create a reply", buf, 0xCu);
      }

      BSMachSendRightRelease(v18);
    }
    char v32 = 0;
    goto LABEL_43;
  }
  v25 = *(NSObject **)(a1 + 24);
  if (v25)
  {
    dispatch_source_cancel(v25);
    v26 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
  if (*(void *)(a1 + 32))
  {
    -[_BSActionResponder _lock_logResponse:](a1, v11);
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v27 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v28 = *(void *)(a1 + 16);
  if (!v28)
  {
    char v32 = 0;
LABEL_45:
    v29 = 0;
    v33 = 0;
    goto LABEL_46;
  }
  if (a4)
  {
    v29 = 0;
  }
  else
  {
    v29 = *(id *)(a1 + 8);
    uint64_t v28 = *(void *)(a1 + 16);
  }
  v33 = (void (**)(void, void))MEMORY[0x18C125630](v28);
  v34 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = 0;

  char v32 = 1;
LABEL_46:
  v36 = *(id *)(a1 + 80);
  if (a5 && *(unsigned char *)(a1 + 107)) {
    uint64_t v37 = *(void *)(a1 + 88);
  }
  else {
    uint64_t v37 = 0;
  }
  v38 = (void *)MEMORY[0x18C125630](v37);
  -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  if (v33)
  {
    if (v29)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __118___BSActionResponder__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler___block_invoke;
      block[3] = &unk_1E5445C90;
      v52 = v33;
      id v51 = v11;
      dispatch_async(v29, block);
    }
    else
    {
      ((void (**)(void, id))v33)[2](v33, v11);
    }
  }
  if (v38) {
    dispatch_async(v36, v38);
  }
  unsigned __int8 v53 = v32;

LABEL_57:
  return v53;
}

- (const)_lock_invalidateForEncode:(const os_unfair_lock *)result
{
  if (result)
  {
    uint64_t v3 = result;
    os_unfair_lock_assert_owner(result + 24);
    if (!a2 || !HIBYTE(v3[26]._os_unfair_lock_opaque) || !LOBYTE(v3[25]._os_unfair_lock_opaque))
    {
      uint64_t v4 = *(void **)&v3[20]._os_unfair_lock_opaque;
      *(void *)&v3[20]._os_unfair_lock_opaque = 0;

      v5 = *(void **)&v3[22]._os_unfair_lock_opaque;
      *(void *)&v3[22]._os_unfair_lock_opaque = 0;
    }
    if (*(void *)&v3[12]._os_unfair_lock_opaque)
    {
      dispatch_mach_cancel();
      int v6 = *(void **)&v3[12]._os_unfair_lock_opaque;
      *(void *)&v3[12]._os_unfair_lock_opaque = 0;
    }
    uint64_t v7 = *(void **)&v3[10]._os_unfair_lock_opaque;
    return (const os_unfair_lock *)[v7 invalidate];
  }
  return result;
}

- (os_unfair_lock_s)action_canSendResponse
{
  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    uint64_t v3 = -[_BSActionResponder _lock_canSendResponse](v1);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (void)action_invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v2 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if (!*(unsigned char *)(a1 + 105))
  {
    os_unfair_lock_assert_owner(v2);
    BOOL v3 = !*(unsigned char *)(a1 + 104) && !*(unsigned char *)(a1 + 103) && *(unsigned char *)(a1 + 105) == 0;
    *(unsigned char *)(a1 + 105) = 1;
    if (*(void *)(a1 + 64))
    {
      if (v3)
      {
LABEL_8:
        if (-[_BSActionResponder _lock_canSendResponse]((const os_unfair_lock *)a1))
        {
          uint64_t v4 = BSLogBSAction();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            uint64_t v5 = *(void *)(a1 + 56);
            int v10 = 138543362;
            uint64_t v11 = v5;
            _os_log_impl(&dword_18AAA8000, v4, OS_LOG_TYPE_INFO, "Invalidate %{public}@", (uint8_t *)&v10, 0xCu);
          }
        }
        if (*(unsigned char *)(a1 + 102)) {
          unint64_t v6 = 1;
        }
        else {
          unint64_t v6 = 5;
        }
        uint64_t v7 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, v6);
        -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v7, 1, 0, 1);

        return;
      }
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v9 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v8;

      if (v3) {
        goto LABEL_8;
      }
    }
  }
  -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
  os_unfair_lock_unlock(v2);
}

- (const)_lock_canSendResponse
{
  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_assert_owner(result + 24);
    result = 0;
    if (!BYTE1(v1[25]._os_unfair_lock_opaque) && !BYTE2(v1[26]._os_unfair_lock_opaque))
    {
      os_unfair_lock_assert_owner(v2);
      if (!LOBYTE(v1[26]._os_unfair_lock_opaque)
        && !HIBYTE(v1[25]._os_unfair_lock_opaque)
        && !BYTE1(v1[26]._os_unfair_lock_opaque))
      {
        return (const os_unfair_lock *)1;
      }
    }
  }
  return result;
}

- (void)_lock_logResponse:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 40)) {
    uint64_t v4 = @"Reply";
  }
  else {
    uint64_t v4 = @"Response";
  }
  uint64_t v5 = v4;
  unint64_t v6 = [v3 error];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 domain];
    if ([v8 isEqualToString:@"BSActionErrorDomain"])
    {
      id v9 = NSStringFromBSActionErrorCode([v7 code]);
      int v10 = BSLogBSAction();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        int v15 = 138543874;
        __int16 v16 = v5;
        __int16 v17 = 2114;
        mach_port_name_t v18 = v9;
        __int16 v19 = 2114;
        uint64_t v20 = v11;
        _os_log_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (error: %{public}@) %{public}@", (uint8_t *)&v15, 0x20u);
      }
    }
    else
    {
      id v9 = BSLogBSAction();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v7 code];
        uint64_t v14 = *(void *)(a1 + 56);
        int v15 = 138544130;
        __int16 v16 = v5;
        __int16 v17 = 2114;
        mach_port_name_t v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = v13;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        _os_log_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (error: %{public}@/%ld) %{public}@", (uint8_t *)&v15, 0x2Au);
      }
    }
  }
  else
  {
    uint64_t v8 = BSLogBSAction();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(NSObject **)(a1 + 56);
      int v15 = 138543618;
      __int16 v16 = v5;
      __int16 v17 = 2114;
      mach_port_name_t v18 = v12;
      _os_log_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)originator_didInit:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 100))
    {
      uint64_t v11 = [NSString stringWithFormat:@"must be called on the originator"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_didInit_);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        id v20 = v12;
        __int16 v21 = 2114;
        uint64_t v22 = v14;
        __int16 v23 = 2048;
        uint64_t v24 = a1;
        __int16 v25 = 2114;
        v26 = @"BSActionResponder.m";
        __int16 v27 = 1024;
        int v28 = 442;
        __int16 v29 = 2114;
        v30 = v11;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v11 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE4084);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if (*(void *)(a1 + 56))
    {
      int v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_action_identifier == nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_didInit_);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v17 = (objc_class *)objc_opt_class();
        mach_port_name_t v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138544642;
        id v20 = v16;
        __int16 v21 = 2114;
        uint64_t v22 = v18;
        __int16 v23 = 2048;
        uint64_t v24 = a1;
        __int16 v25 = 2114;
        v26 = @"BSActionResponder.m";
        __int16 v27 = 1024;
        int v28 = 444;
        __int16 v29 = 2114;
        v30 = v15;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v15 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE4188);
    }
    if (!*(unsigned char *)(a1 + 101))
    {
      uint64_t add_explicit = atomic_fetch_add_explicit(originator_didInit____count, 1u, memory_order_relaxed);
      uint64_t v5 = NSString;
      unint64_t v6 = NSStringFromClass(a2);
      uint64_t v7 = [v5 stringWithFormat:@"<%@: 0x%04x%04x>", v6, getpid(), add_explicit];
      uint64_t v8 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v7;

      id v9 = BSLogBSAction();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        id v20 = v10;
        _os_log_debug_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_DEBUG, "Alloc %{public}@", buf, 0xCu);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

+ (void)originator_responderOnQueue:(void *)a3 forHandler:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (!v4)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_originator_responderOnQueue_forHandler_);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v18 = v10;
      __int16 v19 = 2114;
      id v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = @"BSActionResponder.m";
      __int16 v25 = 1024;
      int v26 = 455;
      __int16 v27 = 2114;
      int v28 = v9;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v9 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE44E8);
  }
  if (!v5)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_originator_responderOnQueue_forHandler_);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      int v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v6;
      __int16 v23 = 2114;
      uint64_t v24 = @"BSActionResponder.m";
      __int16 v25 = 1024;
      int v26 = 456;
      __int16 v27 = 2114;
      int v28 = v13;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v13 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE45ECLL);
  }
  uint64_t v7 = -[_BSActionResponder _initWithQueue:handler:]([_BSActionResponder alloc], v4, v5);

  return v7;
}

- (void)_initWithQueue:(void *)a3 handler:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_BSActionResponder;
    id v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 24) = 0;
      *((unsigned char *)v8 + 100) = 1;
      if (v7)
      {
        objc_storeStrong((id *)v8 + 1, a2);
        uint64_t v9 = [v7 copy];
        id v10 = (void *)a1[2];
        a1[2] = v9;
      }
      else
      {
        *((unsigned char *)v8 + 101) = 1;
      }
    }
  }

  return a1;
}

- (void)originator_setTimeout:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 100))
    {
      objc_super v12 = [NSString stringWithFormat:@"must be called on the originator"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_setTimeout_);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = (objc_class *)objc_opt_class();
        int v15 = NSStringFromClass(v14);
        *(_DWORD *)location = 138544642;
        *(void *)&location[4] = v13;
        __int16 v27 = 2114;
        int v28 = v15;
        __int16 v29 = 2048;
        uint64_t v30 = a1;
        __int16 v31 = 2114;
        char v32 = @"BSActionResponder.m";
        __int16 v33 = 1024;
        int v34 = 471;
        __int16 v35 = 2114;
        v36 = v12;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
      }
      qword_1E911F420 = [v12 UTF8String];
      __break(0);
      JUMPOUT(0x18AAE49B4);
    }
    id v4 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    id v5 = *(NSObject **)(a1 + 24);
    if (v5)
    {
      dispatch_source_cancel(v5);
      id v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;
    }
    if (a2 != -1 && !*(void *)(a1 + 72))
    {
      id v7 = *(NSObject **)(a1 + 8);
      if (!v7)
      {
        id v16 = [NSString stringWithFormat:@"missing response queue"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_originator_setTimeout_);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          id v18 = (objc_class *)objc_opt_class();
          __int16 v19 = NSStringFromClass(v18);
          *(_DWORD *)location = 138544642;
          *(void *)&location[4] = v17;
          __int16 v27 = 2114;
          int v28 = v19;
          __int16 v29 = 2048;
          uint64_t v30 = a1;
          __int16 v31 = 2114;
          char v32 = @"BSActionResponder.m";
          __int16 v33 = 1024;
          int v34 = 478;
          __int16 v35 = 2114;
          v36 = v16;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
        }
        qword_1E911F420 = [v16 UTF8String];
        __break(0);
        JUMPOUT(0x18AAE4AB0);
      }
      if (!*(void *)(a1 + 16))
      {
        id v20 = [NSString stringWithFormat:@"missing response handler"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_originator_setTimeout_);
          id v21 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = (objc_class *)objc_opt_class();
          __int16 v23 = NSStringFromClass(v22);
          *(_DWORD *)location = 138544642;
          *(void *)&location[4] = v21;
          __int16 v27 = 2114;
          int v28 = v23;
          __int16 v29 = 2048;
          uint64_t v30 = a1;
          __int16 v31 = 2114;
          char v32 = @"BSActionResponder.m";
          __int16 v33 = 1024;
          int v34 = 479;
          __int16 v35 = 2114;
          v36 = v20;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);
        }
        qword_1E911F420 = [v20 UTF8String];
        __break(0);
        JUMPOUT(0x18AAE4BACLL);
      }
      dispatch_source_t v8 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
      id v10 = (dispatch_object_t *)(a1 + 24);
      uint64_t v9 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v8;

      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 24), a2, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)location, (id)a1);
      uint64_t v11 = *(NSObject **)(a1 + 24);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __44___BSActionResponder_originator_setTimeout___block_invoke;
      handler[3] = &unk_1E5446210;
      objc_copyWeak(&v25, (id *)location);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume(*v10);
      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)location);
    }
    os_unfair_lock_unlock(v4);
  }
}

+ (void)originator_nullResponder
{
  self;
  v0 = -[_BSActionResponder _initWithQueue:handler:]([_BSActionResponder alloc], 0, 0);
  return v0;
}

+ (_BYTE)action_decodeFromXPCObject:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = v2;
  id v5 = v4;
  if (!v4)
  {
LABEL_6:
    uint64_t v9 = -[_BSActionResponder _initWithReply:]([_BSActionResponder alloc], 0);
    goto LABEL_14;
  }
  Class Class = object_getClass(v4);
  id v7 = (objc_class *)MEMORY[0x1E4F14590];

  if (Class != v7)
  {
    dispatch_source_t v8 = BSLogBSAction();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543362;
      id v20 = v5;
      _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Responder-decode: unexpected encoding -> %{public}@", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_6;
  }
  id v10 = [(BSMachPortRight *)[BSMachPortSendOnceRight alloc] initWithXPCDictionary:v5];
  if (!v10)
  {
    uint64_t v17 = v3;
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel_action_decodeFromXPCObject_ object:v17 file:@"BSActionResponder.m" lineNumber:256 description:@"must decode to a reply even if it is invalid"];
  }
  uint64_t v9 = -[_BSActionResponder _initWithReply:]([_BSActionResponder alloc], v10);
  v9[102] = xpc_dictionary_get_BOOL(v5, "bsar_isnp");
  string = xpc_dictionary_get_string(v5, "bsar_aid");
  if (string)
  {
    uint64_t v12 = [NSString stringWithUTF8String:string];
    id v13 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v12;

    id v14 = BSLogBSAction();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = (void *)*((void *)v9 + 7);
      int v19 = 138543362;
      id v20 = v15;
      _os_log_impl(&dword_18AAA8000, v14, OS_LOG_TYPE_INFO, "Decode %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
LABEL_14:

  return v9;
}

- (_BYTE)_initWithReply:(unsigned char *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    id v6 = v4;
    if (v6)
    {
      NSClassFromString(&cfstr_Bsmachportsend_0.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSMachPortSendOnceRightClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithReply_);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          id v13 = (objc_class *)objc_opt_class();
          id v14 = NSStringFromClass(v13);
          *(_DWORD *)buf = 138544642;
          id v17 = v12;
          __int16 v18 = 2114;
          int v19 = v14;
          __int16 v20 = 2048;
          uint64_t v21 = a1;
          __int16 v22 = 2114;
          __int16 v23 = @"BSActionResponder.m";
          __int16 v24 = 1024;
          int v25 = 77;
          __int16 v26 = 2114;
          __int16 v27 = v11;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v11 UTF8String];
        __break(0);
        JUMPOUT(0x18AAE57F8);
      }
    }

    v15.receiver = a1;
    v15.super_class = (Class)_BSActionResponder;
    id v7 = (char *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_DWORD *)v7 + 24) = 0;
      if (v6)
      {
        dispatch_source_t v8 = (os_unfair_lock_s **)(v7 + 40);
        objc_storeStrong((id *)v7 + 5, a2);
        if (-[BSMachPortRight _port](*v8)) {
          BOOL v9 = -[BSMachPortRight _port](*v8) == -1;
        }
        else {
          BOOL v9 = 1;
        }
        a1[106] = v9;
      }
      else
      {
        v7[101] = 1;
      }
    }
  }

  return a1;
}

- (id)action_encode:(uint64_t)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_49;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  if (*(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 103) || *(unsigned char *)(a1 + 105))
  {
    id v10 = *(id *)(a1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    uint64_t v11 = [NSString stringWithFormat:@"cannot -encode from an inactive instance : action=%@\nprevious inactivation was at %@", v3, v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_action_encode_);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      buf.flags = 138544642;
      *(void *)&buf.mpl.mpl_qlimit = v12;
      *((_WORD *)&buf.service_port_name + 2) = 2114;
      *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v14;
      *((_WORD *)&buf.service_port_name + 7) = 2048;
      uint64_t v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSActionResponder.m";
      __int16 v50 = 1024;
      int v51 = 155;
      __int16 v52 = 2114;
      unsigned __int8 v53 = v11;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);
    }
    qword_1E911F420 = [v11 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF5578);
  }
  *(unsigned char *)(a1 + 103) = 1;
  uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v5 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v4;

  if (*(unsigned char *)(a1 + 101))
  {
    id v6 = 0;
LABEL_30:
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    goto LABEL_31;
  }
  id v7 = BSLogBSAction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    buf.flags = 138543362;
    *(void *)&buf.mpl.mpl_qlimit = v8;
    _os_log_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_INFO, "Encode %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (!*(unsigned char *)(a1 + 100))
  {
    BOOL v9 = (BSMachPortSendOnceRight *)*(id *)(a1 + 40);
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 106))
  {
    BOOL v9 = [[BSMachPortSendOnceRight alloc] initWithPort:0];
LABEL_16:
    objc_super v15 = v9;
LABEL_24:
    if (!v15)
    {
      int v25 = [NSString stringWithFormat:@"must have a reply even if it is invalid"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_encode_);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v27);
        buf.flags = 138544642;
        *(void *)&buf.mpl.mpl_qlimit = v26;
        *((_WORD *)&buf.service_port_name + 2) = 2114;
        *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v28;
        *((_WORD *)&buf.service_port_name + 7) = 2048;
        uint64_t v47 = a1;
        __int16 v48 = 2114;
        v49 = @"BSActionResponder.m";
        __int16 v50 = 1024;
        int v51 = 236;
        __int16 v52 = 2114;
        unsigned __int8 v53 = v25;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);
      }
      qword_1E911F420 = [v25 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF58D0);
    }
    xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
    id v6 = v22;
    if (*(unsigned char *)(a1 + 102)) {
      xpc_dictionary_set_BOOL(v22, "bsar_isnp", 1);
    }
    __int16 v23 = *(void **)(a1 + 56);
    if (v23) {
      xpc_dictionary_set_string(v6, "bsar_aid", (const char *)[v23 UTF8String]);
    }
    [(BSMachPortRight *)v15 encodeWithXPCDictionary:v6];
    [(BSMachPortRight *)v15 invalidate];

    goto LABEL_30;
  }
  if (!*(void *)(a1 + 8))
  {
    __int16 v29 = [NSString stringWithFormat:@"missing response queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_action_encode_);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v31 = (objc_class *)objc_opt_class();
      char v32 = NSStringFromClass(v31);
      buf.flags = 138544642;
      *(void *)&buf.mpl.mpl_qlimit = v30;
      *((_WORD *)&buf.service_port_name + 2) = 2114;
      *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v32;
      *((_WORD *)&buf.service_port_name + 7) = 2048;
      uint64_t v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSActionResponder.m";
      __int16 v50 = 1024;
      int v51 = 167;
      __int16 v52 = 2114;
      unsigned __int8 v53 = v29;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);
    }
    qword_1E911F420 = [v29 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF59C8);
  }
  if (!*(void *)(a1 + 16))
  {
    __int16 v33 = [NSString stringWithFormat:@"missing response handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_action_encode_);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      buf.flags = 138544642;
      *(void *)&buf.mpl.mpl_qlimit = v34;
      *((_WORD *)&buf.service_port_name + 2) = 2114;
      *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v36;
      *((_WORD *)&buf.service_port_name + 7) = 2048;
      uint64_t v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSActionResponder.m";
      __int16 v50 = 1024;
      int v51 = 168;
      __int16 v52 = 2114;
      unsigned __int8 v53 = v33;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);
    }
    qword_1E911F420 = [v33 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF5AC0);
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v37 = [NSString stringWithFormat:@"mach source already set up"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_action_encode_);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      buf.flags = 138544642;
      *(void *)&buf.mpl.mpl_qlimit = v38;
      *((_WORD *)&buf.service_port_name + 2) = 2114;
      *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v40;
      *((_WORD *)&buf.service_port_name + 7) = 2048;
      uint64_t v47 = a1;
      __int16 v48 = 2114;
      v49 = @"BSActionResponder.m";
      __int16 v50 = 1024;
      int v51 = 169;
      __int16 v52 = 2114;
      unsigned __int8 v53 = v37;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);
    }
    qword_1E911F420 = [v37 UTF8String];
    __break(0);
    JUMPOUT(0x18AAF5BB8);
  }
  mach_port_name_t name = 0;
  buf.8 = 0uLL;
  *(void *)&buf.flags = 163;
  if (mach_port_construct(*MEMORY[0x1E4F14960], &buf, a1 + 96, &name))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else if (name + 1 > 1)
  {
    uint64_t SendOnceRight = BSMachCreateSendOnceRight(name);
    if ((SendOnceRight + 1) >= 2)
    {
      objc_super v15 = [[BSMachPortSendOnceRight alloc] initWithPort:SendOnceRight];
      dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14458], name, 0, *(dispatch_queue_t *)(a1 + 8));
      __int16 v18 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v17;

      int v19 = *(NSObject **)(a1 + 32);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __36___BSActionResponder_action_encode___block_invoke;
      handler[3] = &__block_descriptor_44_e5_v8__0l;
      mach_port_name_t v44 = name;
      void handler[4] = a1 + 96;
      dispatch_source_set_cancel_handler(v19, handler);
      __int16 v20 = *(NSObject **)(a1 + 32);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __36___BSActionResponder_action_encode___block_invoke_2;
      v41[3] = &unk_1E5446510;
      mach_port_name_t v42 = name;
      v41[4] = a1;
      v41[5] = a1;
      id v21 = (id)a1;
      dispatch_source_set_event_handler(v20, v41);
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));

      goto LABEL_24;
    }
    goto LABEL_48;
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
LABEL_48:
  _os_assert_log();
  _os_crash();
  __break(1u);
LABEL_49:
  id v6 = 0;
LABEL_31:

  return v6;
}

- (uint64_t)action:(void *)a3 sendResponse:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = v6;
    NSClassFromString(&cfstr_Bsactionrespon_0.isa);
    if (!v8)
    {
      id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v23 = (objc_class *)objc_opt_class();
        __int16 v24 = NSStringFromClass(v23);
        *(_DWORD *)mach_port_options_t buf = 138544642;
        id v30 = v22;
        __int16 v31 = 2114;
        char v32 = v24;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        v36 = @"BSActionResponder.m";
        __int16 v37 = 1024;
        int v38 = 131;
        __int16 v39 = 2114;
        v40 = v21;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v21 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF8088);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSActionResponseClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v27);
        *(_DWORD *)mach_port_options_t buf = 138544642;
        id v30 = v26;
        __int16 v31 = 2114;
        char v32 = v28;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        v36 = @"BSActionResponder.m";
        __int16 v37 = 1024;
        int v38 = 131;
        __int16 v39 = 2114;
        v40 = v25;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v25 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF818CLL);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
    if (*(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 103) || *(unsigned char *)(a1 + 105))
    {
      id v12 = *(id *)(a1 + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      id v13 = [NSString stringWithFormat:@"cannot -sendResponse: from an inactive instance : action=%@\nprevious inactivation was at %@", v5, v12];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_super v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        *(_DWORD *)mach_port_options_t buf = 138544642;
        id v30 = v14;
        __int16 v31 = 2114;
        char v32 = v16;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        v36 = @"BSActionResponder.m";
        __int16 v37 = 1024;
        int v38 = 136;
        __int16 v39 = 2114;
        v40 = v13;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v13 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF7E80);
    }
    *(unsigned char *)(a1 + 104) = 1;
    uint64_t v9 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v10 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v9;

    if (*(unsigned char *)(a1 + 101))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      dispatch_source_t v17 = [NSString stringWithFormat:@"cannot -sendResponse: if no response was expected : action=%@", v5];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        int v19 = (objc_class *)objc_opt_class();
        __int16 v20 = NSStringFromClass(v19);
        *(_DWORD *)mach_port_options_t buf = 138544642;
        id v30 = v18;
        __int16 v31 = 2114;
        char v32 = v20;
        __int16 v33 = 2048;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        v36 = @"BSActionResponder.m";
        __int16 v37 = 1024;
        int v38 = 142;
        __int16 v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v17 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF7F84);
    }
    a1 = -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v8, 1, 0, 0);
  }

  return a1;
}

- (_BSActionResponder)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on BSActionResponseObserver"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    id v16 = @"BSActionResponder.m";
    __int16 v17 = 1024;
    int v18 = 58;
    __int16 v19 = 2114;
    __int16 v20 = v4;
    _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  result = (_BSActionResponder *)[v4 UTF8String];
  qword_1E911F420 = (uint64_t)result;
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)[(_BSActionResponder *)self debugDescriptionWithMultilinePrefix:0];
}

- (os_unfair_lock_s)action_isValid
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    id v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    uint64_t v3 = -[_BSActionResponder _lock_isValid](v1);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (uint64_t)_lock_isValid
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = (const os_unfair_lock *)(result + 96);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 96));
    os_unfair_lock_assert_owner(v2);
    if (*(unsigned char *)(v1 + 104) || *(unsigned char *)(v1 + 103) || *(unsigned char *)(v1 + 105) || *(unsigned char *)(v1 + 106))
    {
      return 0;
    }
    else if (*(unsigned char *)(v1 + 100) || *(unsigned char *)(v1 + 101))
    {
      return 1;
    }
    else
    {
      uint64_t v3 = *(void **)(v1 + 40);
      return [v3 isUsable];
    }
  }
  return result;
}

- (void)action:(void *)a3 setNullificationQueue:(int)a4 isLegacy:(void *)a5 handler:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if (*(void *)(a1 + 48))
    {
      dispatch_mach_cancel();
      id v12 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      __int16 v13 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
    if (!v11)
    {
      id v14 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;

      __int16 v15 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = 0;

LABEL_19:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      goto LABEL_20;
    }
    if (v10)
    {
      if (a4)
      {
LABEL_7:
        if (*(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 103)) {
          goto LABEL_18;
        }
        if (*(unsigned char *)(a1 + 105))
        {
LABEL_17:
          dispatch_async(v10, v11);
LABEL_18:

          id v11 = 0;
          goto LABEL_19;
        }
LABEL_16:
        if (!*(unsigned char *)(a1 + 106))
        {
          objc_storeStrong((id *)(a1 + 80), v10);
          uint64_t v16 = [v11 copy];
          __int16 v17 = *(void **)(a1 + 88);
          *(void *)(a1 + 88) = v16;

          *(unsigned char *)(a1 + 107) = a4;
          int v18 = *(void **)(a1 + 40);
          if (v18)
          {
            if (*(void *)(a1 + 48))
            {
              uint64_t v28 = [NSString stringWithFormat:@"dispatch mach already set up"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_action_setNullificationQueue_isLegacy_handler_);
                id v29 = (id)objc_claimAutoreleasedReturnValue();
                id v30 = (objc_class *)objc_opt_class();
                __int16 v31 = NSStringFromClass(v30);
                *(_DWORD *)mach_port_options_t buf = 138544642;
                id v35 = v29;
                __int16 v36 = 2114;
                __int16 v37 = v31;
                __int16 v38 = 2048;
                uint64_t v39 = a1;
                __int16 v40 = 2114;
                uint64_t v41 = @"BSActionResponder.m";
                __int16 v42 = 1024;
                int v43 = 341;
                __int16 v44 = 2114;
                v45 = v28;
                _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
              }
              qword_1E911F420 = [v28 UTF8String];
              __break(0);
              JUMPOUT(0x18AB2B48CLL);
            }
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke;
            v32[3] = &unk_1E5446560;
            v32[4] = a1;
            __int16 v19 = v10;
            __int16 v33 = v19;
            [v18 accessPort:v32];
            if (!*(void *)(a1 + 48))
            {
              *(unsigned char *)(a1 + 106) = 1;
              __int16 v20 = *(void **)(a1 + 88);
              if (v20)
              {
                dispatch_async(*(dispatch_queue_t *)(a1 + 80), v20);
                uint64_t v21 = *(void **)(a1 + 80);
                *(void *)(a1 + 80) = 0;

                id v22 = *(void **)(a1 + 88);
                *(void *)(a1 + 88) = 0;
              }
            }

            id v10 = v19;
          }
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v10 = dispatch_get_global_queue(21, 0);
      if (a4) {
        goto LABEL_7;
      }
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
    if (*(unsigned char *)(a1 + 104) || *(unsigned char *)(a1 + 103) || *(unsigned char *)(a1 + 105))
    {
      id v23 = *(id *)(a1 + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      __int16 v24 = [NSString stringWithFormat:@"cannot -setNullificationHandler: on an inactive instance : action=%@\nprevious inactivation was at %@", v9, v23];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_setNullificationQueue_isLegacy_handler_);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v26 = (objc_class *)objc_opt_class();
        __int16 v27 = NSStringFromClass(v26);
        *(_DWORD *)mach_port_options_t buf = 138544642;
        id v35 = v25;
        __int16 v36 = 2114;
        __int16 v37 = v27;
        __int16 v38 = 2048;
        uint64_t v39 = a1;
        __int16 v40 = 2114;
        uint64_t v41 = @"BSActionResponder.m";
        __int16 v42 = 1024;
        int v43 = 326;
        __int16 v44 = 2114;
        v45 = v24;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v24 UTF8String];
      __break(0);
      JUMPOUT(0x18AB2B394);
    }
    goto LABEL_16;
  }
LABEL_20:
}

- (void)originator_annulWithErrorCode:(os_unfair_lock_s *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v4 = [NSString stringWithFormat:@"must send a valid error code to annul"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_annulWithErrorCode_);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        id v6 = (objc_class *)objc_opt_class();
        id v7 = NSStringFromClass(v6);
        int v8 = 138544642;
        id v9 = v5;
        __int16 v10 = 2114;
        id v11 = v7;
        __int16 v12 = 2048;
        __int16 v13 = a1;
        __int16 v14 = 2114;
        __int16 v15 = @"BSActionResponder.m";
        __int16 v16 = 1024;
        int v17 = 492;
        __int16 v18 = 2114;
        __int16 v19 = v4;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
      }
      qword_1E911F420 = [v4 UTF8String];
      __break(0);
      JUMPOUT(0x18AB2BC68);
    }
    os_unfair_lock_lock(a1 + 24);
    -[_BSActionResponder _consumeLock_originator_annulWithCode:alreadyOnResponseQueue:]((uint64_t)a1, a2, 0);
  }
}

- (void)_consumeLock_originator_annulWithCode:(int)a3 alreadyOnResponseQueue:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  if (a3)
  {
    id v7 = *(NSObject **)(a1 + 8);
    if (v7) {
      dispatch_assert_queue_V2(v7);
    }
  }
  if (!*(unsigned char *)(a1 + 100))
  {
    __int16 v15 = [NSString stringWithFormat:@"annul may only be called on the originator"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_originator_annulWithCode_alreadyOnResponseQueue_);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      int v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      *(_DWORD *)mach_port_options_t buf = 138544642;
      id v24 = v16;
      __int16 v25 = 2114;
      id v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = a1;
      __int16 v29 = 2114;
      id v30 = @"BSActionResponder.m";
      __int16 v31 = 1024;
      int v32 = 697;
      __int16 v33 = 2114;
      id v34 = v15;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v15 UTF8String];
    __break(0);
    JUMPOUT(0x18AB2BFA4);
  }
  if (*(unsigned char *)(a1 + 106))
  {
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
    os_unfair_lock_unlock(v6);
  }
  else
  {
    if (*(void *)(a1 + 56))
    {
      int v8 = BSLogBSAction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 56);
        *(_DWORD *)mach_port_options_t buf = 138543362;
        id v24 = v9;
        _os_log_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_INFO, "Annul %{public}@", buf, 0xCu);
      }
    }
    *(unsigned char *)(a1 + 106) = 1;
    __int16 v10 = *(id *)(a1 + 80);
    id v11 = (void *)MEMORY[0x18C125630](*(void *)(a1 + 88));
    __int16 v12 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    __int16 v13 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    __int16 v14 = +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, a2);
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v14, 1, a3, 1);
    if (v11)
    {
      if (!v10)
      {
        id v22 = [NSString stringWithFormat:@"missing nullification queue"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__consumeLock_originator_annulWithCode_alreadyOnResponseQueue_);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = (objc_class *)objc_opt_class();
          uint64_t v21 = NSStringFromClass(v20);
          *(_DWORD *)mach_port_options_t buf = 138544642;
          id v24 = v19;
          __int16 v25 = 2114;
          id v26 = v21;
          __int16 v27 = 2048;
          uint64_t v28 = a1;
          __int16 v29 = 2114;
          id v30 = @"BSActionResponder.m";
          __int16 v31 = 1024;
          int v32 = 715;
          __int16 v33 = 2114;
          id v34 = v22;
          _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        qword_1E911F420 = [v22 UTF8String];
        __break(0);
        JUMPOUT(0x18AB2C0A0);
      }
      dispatch_async(v10, v11);
    }
  }
}

- (id)succinctDescription
{
  id v2 = [(_BSActionResponder *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 0);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 2);
  uint64_t v4 = [v3 build];

  return v4;
}

@end