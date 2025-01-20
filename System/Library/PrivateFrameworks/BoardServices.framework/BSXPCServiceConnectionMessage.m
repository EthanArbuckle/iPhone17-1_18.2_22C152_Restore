@interface BSXPCServiceConnectionMessage
+ (id)messageWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:;
- (BOOL)_sendWithMode:(uint64_t)a1;
- (BOOL)expectsReply;
- (BOOL)send;
- (BOOL)sendSynchronously;
- (BSXPCServiceConnectionMessage)initWithMessage:(id)a3;
- (char)connection;
- (id)_subMessages;
- (id)createReply;
- (id)messageID;
- (id)selectorName;
- (id)sendSynchronouslyWithError:(id *)a3;
- (uint64_t)_initWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:;
- (void)childIdentifier;
- (void)childIdentifierIsRemotelyDefined;
- (void)invalidate;
- (void)setChildIdentifier:(void *)result;
- (void)setChildIdentifierIsRemotelyDefined:(void *)a1;
- (void)setMessageID:(void *)a1;
- (void)setReplyQueue:(uint64_t)a1;
- (void)setSelectorName:(void *)a1;
@end

@implementation BSXPCServiceConnectionMessage

- (BOOL)_sendWithMode:(uint64_t)a1
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((BSAtomicSetFlag() & 1) == 0)
    {
      v19 = [NSString stringWithFormat:@"can not send the same message twice"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__sendWithMode_);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)block = 138544642;
        *(void *)&block[4] = v20;
        *(_WORD *)&block[12] = 2114;
        *(void *)&block[14] = v22;
        *(_WORD *)&block[22] = 2048;
        v54 = (void *)a1;
        LOWORD(v55) = 2114;
        *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
        WORD5(v55) = 1024;
        HIDWORD(v55) = 145;
        __int16 v56 = 2114;
        v57 = v19;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C756D10);
    }
    if (a2)
    {
      if (a2 == 1 && !*(void *)(a1 + 80))
      {
        v27 = [NSString stringWithFormat:@"only messages with a reply can be sent synchronously"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__sendWithMode_);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          *(_DWORD *)block = 138544642;
          *(void *)&block[4] = v28;
          *(_WORD *)&block[12] = 2114;
          *(void *)&block[14] = v30;
          *(_WORD *)&block[22] = 2048;
          v54 = (void *)a1;
          LOWORD(v55) = 2114;
          *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
          WORD5(v55) = 1024;
          HIDWORD(v55) = 146;
          __int16 v56 = 2114;
          v57 = v27;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
        }
        [v27 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C756F00);
      }
      if (*(unsigned char *)(a1 + 60))
      {
        v23 = [NSString stringWithFormat:@"only async messages are batchable"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__sendWithMode_);
          id v24 = (id)objc_claimAutoreleasedReturnValue();
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          *(_DWORD *)block = 138544642;
          *(void *)&block[4] = v24;
          *(_WORD *)&block[12] = 2114;
          *(void *)&block[14] = v26;
          *(_WORD *)&block[22] = 2048;
          v54 = (void *)a1;
          LOWORD(v55) = 2114;
          *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
          WORD5(v55) = 1024;
          HIDWORD(v55) = 147;
          __int16 v56 = 2114;
          v57 = v23;
          _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
        }
        [v23 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x19C756E08);
      }
    }
    [*(id *)(a1 + 40) sendIfNecessary];
    v4 = *(void **)(a1 + 48);
    if (!v4 || [v4 shouldSendMessage:a1])
    {
      v5 = [(id)a1 createMessage];
      id v6 = *(id *)(a1 + 88);
      v7 = (void *)MEMORY[0x19F399B00](*(void *)(a1 + 80));
      id v8 = *(id *)(a1 + 48);
      if (v7)
      {
        int v9 = *(_DWORD *)(a1 + 64);
        v10 = v49;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke;
        v49[3] = &unk_1E58FCBF8;
        v47 = &v51;
        id v51 = v7;
        v48 = &v50;
        id v50 = v8;
        int v52 = v9;
      }
      else
      {
        v10 = 0;
      }
      v11 = (void (**)(void, void))MEMORY[0x19F399B00](v10);
      v12 = (int *)MEMORY[0x1E4F4F890];
      v13 = *(_xpc_connection_s **)(a1 + (int)*MEMORY[0x1E4F4F890]);
      if (v13)
      {
        if (!v11)
        {
          if (*(unsigned char *)(a1 + 61)) {
            xpc_connection_send_notification();
          }
          else {
            xpc_connection_send_message(v13, v5);
          }
          goto LABEL_34;
        }
        if (a2 == 1)
        {
          v14 = xpc_connection_send_message_with_reply_sync(v13, v5);
          ((void (**)(void, NSObject *))v11)[2](v11, v14);
LABEL_33:

          goto LABEL_34;
        }
        v14 = [v6 backingQueueIfExists];
        if (v14)
        {
          xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + *v12), v5, v14, v11);
          goto LABEL_33;
        }
        v15 = *(NSObject **)(a1 + 72);
        if (!v15)
        {
          v31 = [NSString stringWithFormat:@"Must have a connection target queue to send a message with a reply."];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__actuallySendWithMode_);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = (objc_class *)objc_opt_class();
            v34 = NSStringFromClass(v33);
            *(_DWORD *)block = 138544642;
            *(void *)&block[4] = v32;
            *(_WORD *)&block[12] = 2114;
            *(void *)&block[14] = v34;
            *(_WORD *)&block[22] = 2048;
            v54 = (void *)a1;
            LOWORD(v55) = 2114;
            *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
            WORD5(v55) = 1024;
            HIDWORD(v55) = 197;
            __int16 v56 = 2114;
            v57 = v31;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
          }
          [v31 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C756FF4);
        }
        if (!v6)
        {
          v35 = [NSString stringWithFormat:@"Must have a connection reply queue to send a message with a reply."];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__actuallySendWithMode_);
            id v36 = (id)objc_claimAutoreleasedReturnValue();
            v37 = (objc_class *)objc_opt_class();
            v38 = NSStringFromClass(v37);
            *(_DWORD *)block = 138544642;
            *(void *)&block[4] = v36;
            *(_WORD *)&block[12] = 2114;
            *(void *)&block[14] = v38;
            *(_WORD *)&block[22] = 2048;
            v54 = (void *)a1;
            LOWORD(v55) = 2114;
            *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
            WORD5(v55) = 1024;
            HIDWORD(v55) = 198;
            __int16 v56 = 2114;
            v57 = v35;
            _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
          }
          [v35 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x19C7570E8);
        }
        v16 = *(_xpc_connection_s **)(a1 + *v12);
        *(void *)block = MEMORY[0x1E4F143A8];
        *(void *)&block[8] = 3221225472;
        *(void *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_48;
        v54 = &unk_1E58FCC48;
        *(void *)&long long v55 = v6;
        *((void *)&v55 + 1) = v11;
        xpc_connection_send_message_with_reply(v16, v5, v15, block);

        v14 = 0;
LABEL_32:

        goto LABEL_33;
      }
      if (v11)
      {
        if (a2 != 1)
        {
          v14 = [v6 backingQueueIfExists];
          if (v14)
          {
            *(void *)block = MEMORY[0x1E4F143A8];
            *(void *)&block[8] = 3221225472;
            *(void *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_3;
            v54 = &unk_1E58FCC70;
            *(void *)&long long v55 = v11;
            dispatch_async(v14, block);
          }
          else
          {
            v17 = *(NSObject **)(a1 + 72);
            if (!v17)
            {
              v39 = [NSString stringWithFormat:@"Must have a connection target queue to send a message with a reply."];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__actuallySendWithMode_);
                id v40 = (id)objc_claimAutoreleasedReturnValue();
                v41 = (objc_class *)objc_opt_class();
                v42 = NSStringFromClass(v41);
                *(_DWORD *)block = 138544642;
                *(void *)&block[4] = v40;
                *(_WORD *)&block[12] = 2114;
                *(void *)&block[14] = v42;
                *(_WORD *)&block[22] = 2048;
                v54 = (void *)a1;
                LOWORD(v55) = 2114;
                *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
                WORD5(v55) = 1024;
                HIDWORD(v55) = 219;
                __int16 v56 = 2114;
                v57 = v39;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
              }
              [v39 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C7571DCLL);
            }
            if (!v6)
            {
              v43 = [NSString stringWithFormat:@"Must have a connection reply queue to send a message with a reply."];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel__actuallySendWithMode_);
                id v44 = (id)objc_claimAutoreleasedReturnValue();
                v45 = (objc_class *)objc_opt_class();
                v46 = NSStringFromClass(v45);
                *(_DWORD *)block = 138544642;
                *(void *)&block[4] = v44;
                *(_WORD *)&block[12] = 2114;
                *(void *)&block[14] = v46;
                *(_WORD *)&block[22] = 2048;
                v54 = (void *)a1;
                LOWORD(v55) = 2114;
                *(void *)((char *)&v55 + 2) = @"BSXPCServiceConnectionMessage.m";
                WORD5(v55) = 1024;
                HIDWORD(v55) = 220;
                __int16 v56 = 2114;
                v57 = v43;
                _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", block, 0x3Au);
              }
              [v43 UTF8String];
              _bs_set_crash_log_message();
              __break(0);
              JUMPOUT(0x19C7572D0);
            }
            *(void *)block = MEMORY[0x1E4F143A8];
            *(void *)&block[8] = 3221225472;
            *(void *)&block[16] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_50;
            v54 = &unk_1E58FCB28;
            *(void *)&long long v55 = v6;
            *((void *)&v55 + 1) = v11;
            dispatch_async(v17, block);

            v14 = 0;
          }
          goto LABEL_32;
        }
        v11[2](v11, MEMORY[0x1E4F14528]);
      }
LABEL_34:
      [(id)a1 invalidate];

      if (v7)
      {
      }
    }
  }
  return a1 != 0;
}

- (void)invalidate
{
  uint64_t v3 = (int)*MEMORY[0x1E4F4F888];
  v4 = *(Class *)((char *)&self->super.super.isa + v3);
  *(Class *)((char *)&self->super.super.isa + v3) = 0;

  id completion = self->_completion;
  self->_id completion = 0;

  uint64_t v6 = (int)*MEMORY[0x1E4F4F890];
  v7 = *(Class *)((char *)&self->super.super.isa + v6);
  *(Class *)((char *)&self->super.super.isa + v6) = 0;

  handshake = self->_handshake;
  self->_handshake = 0;

  delegate = self->_delegate;
  self->_delegate = 0;
}

- (BOOL)send
{
  return -[BSXPCServiceConnectionMessage _sendWithMode:]((uint64_t)self, 0);
}

+ (id)messageWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = objc_alloc((Class)self);
  v15 = (void *)-[BSXPCServiceConnectionMessage _initWithXPCConnection:targetQueue:handshake:activationGeneration:delegate:]((uint64_t)v14, v10, v11, v12, a5, v13);

  return v15;
}

- (void)setChildIdentifierIsRemotelyDefined:(void *)a1
{
  if (a1) {
    return (void *)[a1 encodeBool:a2 forKey:@"bsxpc_CIDr"];
  }
  return a1;
}

- (void)setChildIdentifier:(void *)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    if (!a2)
    {
      uint64_t v3 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"childIdentifier > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_setChildIdentifier_);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        v5 = (objc_class *)objc_opt_class();
        uint64_t v6 = NSStringFromClass(v5);
        *(_DWORD *)buf = 138544642;
        id v8 = v4;
        __int16 v9 = 2114;
        id v10 = v6;
        __int16 v11 = 2048;
        id v12 = v2;
        __int16 v13 = 2114;
        id v14 = @"BSXPCServiceConnectionMessage.m";
        __int16 v15 = 1024;
        int v16 = 117;
        __int16 v17 = 2114;
        v18 = v3;
        _os_log_error_impl(&dword_19C754000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v3 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x19C757720);
    }
    return (void *)[result encodeUInt64:a2 forKey:@"bsxpc_CID"];
  }
  return result;
}

- (void)childIdentifier
{
  if (a1) {
    return (void *)[a1 decodeUInt64ForKey:@"bsxpc_CID"];
  }
  return a1;
}

- (uint64_t)_initWithXPCConnection:(void *)a3 targetQueue:(void *)a4 handshake:(int)a5 activationGeneration:(void *)a6 delegate:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (a1)
  {
    uint64_t v16 = [(id)a1 initWithMessage:0];
    a1 = v16;
    if (v16)
    {
      objc_storeStrong((id *)(v16 + (int)*MEMORY[0x1E4F4F890]), a2);
      objc_storeStrong((id *)(a1 + 72), a3);
      objc_storeStrong((id *)(a1 + 40), a4);
      *(_DWORD *)(a1 + 64) = a5;
      objc_storeStrong((id *)(a1 + 48), a6);
    }
  }

  return a1;
}

- (BSXPCServiceConnectionMessage)initWithMessage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSXPCServiceConnectionMessage;
  result = [(BSXPCCoder *)&v4 initWithMessage:a3];
  if (result) {
    result->_sendFlag = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_handshake, 0);
}

- (id)messageID
{
  if (a1)
  {
    a1 = [a1 decodeStringForKey:@"bsxpc"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setReplyQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)childIdentifierIsRemotelyDefined
{
  if (a1) {
    return (void *)[a1 decodeBoolForKey:@"bsxpc_CIDr"];
  }
  return a1;
}

- (void)setSelectorName:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (v3) {
      [a1 encodeObject:v3 forKey:@"bsxpc_SEL"];
    }
    else {
      [a1 _removeValueForKey:@"bsxpc_SEL"];
    }
  }
}

- (char)connection
{
  if (a1)
  {
    a1 = (char *)*(id *)&a1[*MEMORY[0x1E4F4F890]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)createReply
{
  if ([(BSXPCServiceConnectionMessage *)self expectsReply])
  {
    id v3 = [BSXPCServiceConnectionMessageReply alloc];
    objc_super v4 = [(BSXPCServiceConnectionMessageReply *)v3 initWithMessage:*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F4F888])];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (BOOL)expectsReply
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F4F888]);
  if (v2) {
    LOBYTE(v2) = xpc_dictionary_expects_reply();
  }
  return v2;
}

- (id)_subMessages
{
  if (a1 && [a1 containsValueForKey:@"bsxpc_BATCH"])
  {
    uint64_t v2 = [a1 decodeXPCObjectOfType:MEMORY[0x1E4F14568] forKey:@"bsxpc_BATCH"];
    if (v2)
    {
      id v3 = [MEMORY[0x1E4F1CA48] array];
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = __45__BSXPCServiceConnectionMessage__subMessages__block_invoke;
      applier[3] = &unk_1E58FCC98;
      id v4 = v3;
      id v7 = v4;
      xpc_array_apply(v2, applier);
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)selectorName
{
  if (a1)
  {
    a1 = [a1 decodeStringForKey:@"bsxpc_SEL"];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMessageID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (v3) {
      [a1 encodeObject:v3 forKey:@"bsxpc"];
    }
    else {
      [a1 _removeValueForKey:@"bsxpc"];
    }
  }
}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7 && (uint64_t v3 = MEMORY[0x19F399FF0](), v4 = MEMORY[0x1E4F145A8], v7, v7, v3 == v4))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    BSServiceConnectionErrorCreate(3uLL, 0, @"XPC error received on message reply handler");
    v5 = (BSXPCServiceConnectionMessage *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, BSXPCServiceConnectionMessage *))(v6 + 16))(v6, 0, v5);
  }
  else
  {
    v5 = [[BSXPCServiceConnectionMessage alloc] initWithMessage:v7];
    [*(id *)(a1 + 32) updateAuditTokenFromReplyMessage:v5 fromActivationGeneration:*(unsigned int *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __60__BSXPCServiceConnectionMessage_sendSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t __45__BSXPCServiceConnectionMessage__subMessages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = [[BSXPCServiceConnectionMessage alloc] initWithMessage:v4];
  [v5 addObject:v6];

  return 1;
}

- (id)sendSynchronouslyWithError:(id *)a3
{
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  id v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__BSXPCServiceConnectionMessage_sendSynchronouslyWithError___block_invoke;
  v9[3] = &unk_1E58FCCC0;
  v9[4] = &v10;
  v9[5] = &v16;
  id v5 = (void *)MEMORY[0x19F399B00](v9, a2);
  id completion = self->_completion;
  self->_id completion = v5;

  [(BSXPCServiceConnectionMessage *)self sendSynchronously];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (BOOL)sendSynchronously
{
  return -[BSXPCServiceConnectionMessage _sendWithMode:]((uint64_t)self, 1);
}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_48(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2;
  v7[3] = &unk_1E58FCC20;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performAsync:v7];
}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_50(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2_51;
  v2[3] = &unk_1E58FCC70;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performAsync:v2];
}

uint64_t __55__BSXPCServiceConnectionMessage__actuallySendWithMode___block_invoke_2_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end