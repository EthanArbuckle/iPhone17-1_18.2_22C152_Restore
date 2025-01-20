@interface BSXPCMessage
+ (const)messageTypeKey;
+ (id)message:(int64_t)a3 withPacker:(id)a4;
+ (id)message:(int64_t)a3 withPacker:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6;
+ (id)messageWithPacker:(id)a3;
+ (id)messageWithPacker:(id)a3 replyHandler:(id)a4 replyQueue:(id)a5;
+ (id)messageWithPayload:(id)a3;
+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5;
+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5 replyHandler:(id)a6 replyQueue:(id)a7;
+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4;
+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6;
- (BOOL)sendToConnection:(id)a3;
- (BOOL)sendToConnection:(id)a3 replyQueue:(id)a4 replyHandler:(id)a5;
- (BSXPCMessage)initWithMessage:(int64_t)a3 packer:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6;
- (OS_xpc_object)payload;
- (id)_errorForXPCMessageReply:(uint64_t)a1;
- (id)description;
- (id)initWithMessage:(void *)a3 replyHandler:(void *)a4 replyQueue:;
- (id)initWithMessagePacker:(void *)a3 replyHandler:(void *)a4 replyQueue:;
- (id)sendSynchronouslyToConnection:(id)a3 error:(id *)a4;
- (void)forcefullyInvokeReplyHandler:(id)a3;
@end

@implementation BSXPCMessage

+ (id)messageWithPacker:(id)a3
{
  v3 = (void (**)(id, xpc_object_t))a3;
  v4 = objc_alloc_init(BSXPCMessage);
  v5 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
  if (v3) {
    v3[2](v3, v5);
  }
  message = v4->_message;
  v4->_message = v5;

  return v4;
}

+ (id)messageWithPayload:(id)a3
{
  v3 = (OS_xpc_object *)a3;
  v4 = objc_alloc_init(BSXPCMessage);
  message = v4->_message;
  v4->_message = v3;

  return v4;
}

+ (const)messageTypeKey
{
  return "message";
}

+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5
{
}

+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4
{
}

+ (void)sendMessageWithPacker:(id)a3 toConnection:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = -[BSXPCMessage initWithMessagePacker:replyHandler:replyQueue:]((id *)[BSXPCMessage alloc], v13, v10, v11);
  [v12 sendToConnection:v9];
}

- (id)initWithMessagePacker:(void *)a3 replyHandler:(void *)a4 replyQueue:
{
  v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_initWithMessagePacker_replyHandler_replyQueue_ object:a1 file:@"BSXPCMessage.m" lineNumber:100 description:@"No message packer"];
    }
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    v7[2](v7, v10);
    a1 = -[BSXPCMessage initWithMessage:replyHandler:replyQueue:](a1, v10, v8, v9);
  }
  return a1;
}

+ (void)sendMessage:(int64_t)a3 toConnection:(id)a4 withMessagePacker:(id)a5 replyHandler:(id)a6 replyQueue:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = [[BSXPCMessage alloc] initWithMessage:a3 packer:v11 replyHandler:v12 replyQueue:v13];
  [(BSXPCMessage *)v14 sendToConnection:v15];
}

+ (id)message:(int64_t)a3 withPacker:(id)a4
{
  v4 = +[BSXPCMessage message:a3 withPacker:a4 replyHandler:0 replyQueue:0];
  return v4;
}

+ (id)message:(int64_t)a3 withPacker:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [[BSXPCMessage alloc] initWithMessage:a3 packer:v9 replyHandler:v10 replyQueue:v11];

  return v12;
}

+ (id)messageWithPacker:(id)a3 replyHandler:(id)a4 replyQueue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = -[BSXPCMessage initWithMessagePacker:replyHandler:replyQueue:]((id *)[BSXPCMessage alloc], v7, v8, v9);

  return v10;
}

- (id)initWithMessage:(void *)a3 replyHandler:(void *)a4 replyQueue:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)BSXPCMessage;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      if (!v8)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:sel_initWithMessage_replyHandler_replyQueue_ object:a1 file:@"BSXPCMessage.m" lineNumber:82 description:@"No message packer"];
      }
      objc_storeStrong(a1 + 4, a2);
      if (v9)
      {
        uint64_t v11 = [v9 copy];
        id v12 = a1[1];
        a1[1] = (id)v11;
      }
      if (v10) {
        objc_storeStrong(a1 + 2, a4);
      }
    }
  }

  return a1;
}

- (BSXPCMessage)initWithMessage:(int64_t)a3 packer:(id)a4 replyHandler:(id)a5 replyQueue:(id)a6
{
  uint64_t v11 = (void (**)(id, xpc_object_t))a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"BSXPCMessage.m" lineNumber:112 description:@"No message packer"];
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  objc_super v15 = (const char *)[(id)objc_opt_class() messageTypeKey];
  xpc_dictionary_set_int64(v14, v15, a3);
  v11[2](v11, v14);
  v16 = (BSXPCMessage *)-[BSXPCMessage initWithMessage:replyHandler:replyQueue:]((id *)&self->super.isa, v14, v12, v13);

  return v16;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_message withName:@"payload"];
  v5 = [v3 build];

  return v5;
}

- (BOOL)sendToConnection:(id)a3
{
  replyQueue = self->_replyQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BSXPCMessage_sendToConnection___block_invoke;
  v5[3] = &unk_1E5446060;
  v5[4] = self;
  return [(BSXPCMessage *)self sendToConnection:a3 replyQueue:replyQueue replyHandler:v5];
}

void __33__BSXPCMessage_sendToConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7)
  {
    if (v5)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [v9 payload];
    }
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    if (!v6) {
  }
    }
}

- (BOOL)sendToConnection:(id)a3 replyQueue:(id)a4 replyHandler:(id)a5
{
  id v8 = (_xpc_connection_s *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v8
    || (int v12 = 0,
        atomic_compare_exchange_strong_explicit(&self->_invalidated, (unsigned int *)&v12, 1u, memory_order_relaxed, memory_order_relaxed), v12))
  {
    BOOL v15 = 0;
  }
  else
  {
    if (v10)
    {
      if (!v9)
      {
        id v9 = MEMORY[0x1E4F14428];
        id v13 = MEMORY[0x1E4F14428];
      }
      message = self->_message;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__BSXPCMessage_sendToConnection_replyQueue_replyHandler___block_invoke;
      v18[3] = &unk_1E5446088;
      v18[4] = self;
      id v19 = v11;
      xpc_connection_send_message_with_reply(v8, message, v9, v18);
    }
    else
    {
      xpc_connection_send_message(v8, self->_message);
    }
    v16 = self->_message;
    self->_message = 0;

    BOOL v15 = 1;
  }

  return v15;
}

void __57__BSXPCMessage_sendToConnection_replyQueue_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = (void *)MEMORY[0x18C125360]();
  id v4 = -[BSXPCMessage _errorForXPCMessageReply:](*(void *)(a1 + 32), v7);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
  }
  else
  {
    v6 = +[BSXPCMessage messageWithPayload:v7];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

- (id)_errorForXPCMessageReply:(uint64_t)a1
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_10;
  }
  if (!v3) {
    goto LABEL_6;
  }
  int v5 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 28), (unsigned int *)&v5, 1u, memory_order_relaxed, memory_order_relaxed);
  if (v5) {
    goto LABEL_6;
  }
  if (object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
LABEL_10:
    v6 = 0;
  }
  else
  {
    if (object_getClass(v4) != (Class)MEMORY[0x1E4F145A8])
    {
LABEL_6:
      v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4101 userInfo:0];
      goto LABEL_7;
    }
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14530]);
    if (string)
    {
      uint64_t v13 = *MEMORY[0x1E4F28588];
      id v9 = [NSString stringWithUTF8String:string];
      v14[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = 4101;
    if (v4 == (void *)MEMORY[0x1E4F14528]) {
      uint64_t v11 = 4099;
    }
    if (v4 == (void *)MEMORY[0x1E4F14520]) {
      uint64_t v12 = 4097;
    }
    else {
      uint64_t v12 = v11;
    }
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:v12 userInfo:v10];
  }
LABEL_7:

  return v6;
}

- (id)sendSynchronouslyToConnection:(id)a3 error:(id *)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = v6;
  if (!v6
    || (int v8 = 0,
        atomic_compare_exchange_strong_explicit(&self->_invalidated, (unsigned int *)&v8, 1u, memory_order_relaxed, memory_order_relaxed), v8))
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v6, self->_message);
  id v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  int v11 = 0;
  atomic_compare_exchange_strong_explicit(&self->_replied, (unsigned int *)&v11, 1u, memory_order_relaxed, memory_order_relaxed);
  if (v11) {
    goto LABEL_9;
  }
  if (object_getClass(v9) == (Class)MEMORY[0x1E4F14590])
  {
    uint64_t v12 = +[BSXPCMessage messageWithPayload:v10];
    goto LABEL_10;
  }
  if (a4)
  {
    -[BSXPCMessage _errorForXPCMessageReply:]((uint64_t)self, v10);
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    uint64_t v12 = 0;
  }
LABEL_10:

LABEL_11:
  return v12;
}

- (void)forcefullyInvokeReplyHandler:(id)a3
{
  id v4 = a3;
  replyHandler = (void (**)(void))self->_replyHandler;
  if (replyHandler)
  {
    int v6 = 0;
    atomic_compare_exchange_strong_explicit(&self->_replied, (unsigned int *)&v6, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v6)
    {
      id v8 = v4;
      replyHandler[2]();
      id v7 = self->_replyHandler;
      self->_replyHandler = 0;

      id v4 = v8;
    }
  }
}

- (OS_xpc_object)payload
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_replyHandler, 0);
}

@end