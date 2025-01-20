@interface BSXPCReply
+ (id)messageWithReply:(id)a3;
+ (id)replyForMessage:(id)a3;
- (BSXPCReply)initWithReply:(id)a3;
- (id)_initWithReply:(id *)a1;
- (id)initForMessage:(id)a3;
- (id)message;
- (int64_t)messageKind;
- (void)sendReply:(id)a3;
@end

@implementation BSXPCReply

- (id)_initWithReply:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSXPCReply;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

+ (id)replyForMessage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"BSXPCMessage.m", 235, @"Invalid parameter not satisfying: %@", @"originalMessage" object file lineNumber description];
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (reply) {
    objc_super v7 = -[BSXPCReply _initWithReply:]((id *)objc_alloc((Class)a1), reply);
  }
  else {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)initForMessage:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BSXPCMessage.m", 248, @"Invalid parameter not satisfying: %@", @"originalMessage" object file lineNumber description];
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  objc_super v7 = -[BSXPCReply _initWithReply:]((id *)&self->super.isa, reply);
  v8 = v7;
  if (!reply)
  {

    v8 = 0;
  }

  return v8;
}

- (void)sendReply:(id)a3
{
  objc_super v7 = (void (**)(void))a3;
  xpc_object_t reply = self->_reply;
  if (reply)
  {
    int v5 = 0;
    atomic_compare_exchange_strong_explicit(&self->_sent, (unsigned int *)&v5, 1u, memory_order_relaxed, memory_order_relaxed);
    if (!v5)
    {
      if (v7)
      {
        v7[2]();
        xpc_object_t reply = self->_reply;
      }
      xpc_dictionary_get_remote_connection(reply);
      v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v6, self->_reply);
    }
  }
}

+ (id)messageWithReply:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc((Class)a1) initWithReply:v4];

  return v5;
}

- (BSXPCReply)initWithReply:(id)a3
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  int v5 = (BSXPCReply *)-[BSXPCReply _initWithReply:]((id *)&self->super.isa, reply);

  return v5;
}

- (int64_t)messageKind
{
  return -1;
}

- (id)message
{
  return 0;
}

- (void).cxx_destruct
{
}

@end