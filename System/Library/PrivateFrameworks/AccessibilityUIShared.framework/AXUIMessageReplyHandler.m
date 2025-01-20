@interface AXUIMessageReplyHandler
+ (id)createReplyObject:(id)a3 fromMessage:(id)a4 withError:(id)a5;
+ (void)sendReply:(id)a3 withError:(id)a4 andOriginalXPCMessage:(id)a5 usingConnection:(id)a6 customDataAddingBlock:(id)a7;
@end

@implementation AXUIMessageReplyHandler

+ (id)createReplyObject:(id)a3 fromMessage:(id)a4 withError:(id)a5
{
  unint64_t v7 = (unint64_t)a3;
  id v8 = a4;
  unint64_t v9 = (unint64_t)a5;
  if (!v7
    || (id v21 = (id)v9,
        v10 = (void *)[MEMORY[0x263F21408] copyXPCMessageFromDictionary:v7 inReplyToXPCMessage:v8 error:&v21], v11 = v21, (id)v9, unint64_t v9 = (unint64_t)v11, !v10))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v8);
    v10 = reply;
    if (reply)
    {
      if (v7 | v9)
      {
        v13 = [(id)v9 domain];
        v14 = [(id)v9 localizedDescription];
        if (!v13) {
          v13 = @"AXUIErrorDomainCommunication";
        }
        if (!v14) {
          v14 = @"Unexpected error converting reply to an XPC object.";
        }
        v15 = AXLogUI();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[AXUIMessageReplyHandler createReplyObject:fromMessage:withError:]((uint64_t)v13, (uint64_t)v14, v15);
        }

        v16 = _AXUIMessageReplyKeyErrorDomain[0];
        v17 = v13;
        xpc_dictionary_set_string(v10, v16, (const char *)[(__CFString *)v17 UTF8String]);
        v18 = _AXUIMessageReplyKeyErrorDescription[0];
        v19 = v14;
        xpc_dictionary_set_string(v10, v18, (const char *)[(__CFString *)v19 UTF8String]);
      }
      else
      {
        xpc_dictionary_set_BOOL(reply, _AXUIMessageReplyKeyDidSucceed[0], 1);
        unint64_t v9 = 0;
      }
    }
  }

  return v10;
}

+ (void)sendReply:(id)a3 withError:(id)a4 andOriginalXPCMessage:(id)a5 usingConnection:(id)a6 customDataAddingBlock:(id)a7
{
  id v18 = a5;
  id v12 = a6;
  v13 = (void (**)(id, void *))a7;
  v14 = [a1 createReplyObject:a3 fromMessage:v18 withError:a4];
  if (v14)
  {
    if (v13) {
      v13[2](v13, v14);
    }
    v15 = [v12 connection];

    if (v15)
    {
      v16 = [v12 connection];
      xpc_connection_send_message(v16, v14);
    }
    else
    {
      v16 = [v12 serviceConnection];
      v17 = [(_xpc_connection_s *)v16 remoteTarget];
      [v17 sendBoardServiceMessage:v18 callback:&__block_literal_global_0];
    }
  }
}

+ (void)createReplyObject:(uint64_t)a1 fromMessage:(uint64_t)a2 withError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E675000, log, OS_LOG_TYPE_ERROR, "Unexpected error with domain %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end