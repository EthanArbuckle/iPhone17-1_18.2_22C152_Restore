@interface FBSXPCMessage
+ (id)message;
+ (id)messageWithBSXPCMessage:(id)a3 ownReply:(BOOL)a4;
+ (id)messageWithPacker:(id)a3;
+ (id)messageWithPayload:(id)a3;
- (FBSXPCMessage)init;
- (FBSXPCMessage)initWithMessagePacker:(id)a3;
- (FBSXPCMessage)initWithMessagePayload:(id)a3;
- (OS_xpc_object)payload;
- (void)sendReplyMessageWithPacker:(id)a3;
@end

@implementation FBSXPCMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)messageWithPacker:(id)a3
{
  id v3 = a3;
  v4 = [[FBSXPCMessage alloc] initWithMessagePacker:v3];

  return v4;
}

- (FBSXPCMessage)initWithMessagePacker:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"packer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSXPCMessage *)a2 initWithMessagePacker:(uint64_t)v10];
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = (void (**)(void, void))v5;
  v7 = [(FBSXPCMessage *)self init];
  v8 = v7;
  if (v7) {
    ((void (**)(void, OS_xpc_object *))v6)[2](v6, v7->_payload);
  }

  return v8;
}

- (FBSXPCMessage)init
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = [(FBSXPCMessage *)self initWithMessagePayload:v3];

  return v4;
}

+ (id)messageWithBSXPCMessage:(id)a3 ownReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"fbs_message"];
  v7 = [[FBSXPCMessage alloc] initWithMessagePayload:v6];
  if (v4)
  {
    uint64_t v8 = [v5 createReply];
    reply = v7->_reply;
    v7->_reply = (BSXPCServiceConnectionMessage *)v8;
  }

  return v7;
}

- (FBSXPCMessage)initWithMessagePayload:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSXPCMessage;
  v6 = [(FBSXPCMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_payload, a3);
  }

  return v7;
}

- (void)sendReplyMessageWithPacker:(id)a3
{
  BOOL v4 = (void (**)(id, xpc_object_t))a3;
  if (self->_reply)
  {
    v7 = v4;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v7) {
      v7[2](v7, v5);
    }
    [(BSXPCServiceConnectionMessage *)self->_reply encodeXPCObject:v5 forKey:@"fbs_message"];
    [(BSXPCServiceConnectionMessage *)self->_reply send];
    reply = self->_reply;
    self->_reply = 0;

    BOOL v4 = v7;
  }
}

- (OS_xpc_object)payload
{
  return self->_payload;
}

+ (id)message
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)messageWithPayload:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[FBSXPCMessage alloc] initWithMessagePayload:v3];

  return v4;
}

- (void)initWithMessagePacker:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  objc_super v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBSXPCMessage.m";
  __int16 v16 = 1024;
  int v17 = 51;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end