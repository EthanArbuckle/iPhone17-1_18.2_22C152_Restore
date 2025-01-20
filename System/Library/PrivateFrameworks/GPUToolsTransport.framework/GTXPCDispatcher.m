@interface GTXPCDispatcher
- (GTXPCDispatcher)initWithProtocolMethods:(id)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
@end

@implementation GTXPCDispatcher

- (GTXPCDispatcher)initWithProtocolMethods:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTXPCDispatcher;
  v5 = [(GTXPCDispatcher *)&v11 init];
  if (v5)
  {
    os_log_t v6 = os_log_create("com.apple.gputools.transport", "GTXPCDispatcher");
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSSet *)v8;
  }
  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "_cmd");
  if (string)
  {
    v9 = [NSString stringWithUTF8String:string];
    if ([(NSSet *)self->_protocolMethods containsObject:v9])
    {
      v10 = [v9 stringByReplacingOccurrencesOfString:@":" withString:@"_"];
      objc_super v11 = [v10 stringByAppendingString:@":replyConnection:"];

      [(GTXPCDispatcher *)self performSelector:NSSelectorFromString(v11) withObject:v6 withObject:v7];
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[GTXPCDispatcher dispatchMessage:replyConnection:](log);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolMethods, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)dispatchMessage:(os_log_t)log replyConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "Malformed message: missing selector", v1, 2u);
}

@end