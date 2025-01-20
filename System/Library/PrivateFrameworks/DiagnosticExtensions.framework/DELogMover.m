@interface DELogMover
+ (void)moveSystemLogsWithExtensions:(id)a3;
- (BOOL)sendRequestReturningBooleanResponse:(id)a3 withSuccessKey:(char *)a4;
- (DELogMover)initWithServiceName:(id)a3;
- (NSString)serviceName;
@end

@implementation DELogMover

- (DELogMover)initWithServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DELogMover;
  v5 = [(DELogMover *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    conn = v5->_conn;
    v5->_conn = 0;
  }
  return v5;
}

- (BOOL)sendRequestReturningBooleanResponse:(id)a3 withSuccessKey:(char *)a4
{
  id v6 = a3;
  conn = self->_conn;
  if (!conn)
  {
    mach_service = xpc_connection_create_mach_service([(NSString *)self->_serviceName UTF8String], 0, 0);
    v12 = self->_conn;
    self->_conn = mach_service;

    if (!self->_conn)
    {
      v19 = +[DELogging fwHandle];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:]((uint64_t *)&self->_serviceName, v19);
      }
      BOOL value = 0;
      goto LABEL_19;
    }
    v13 = [NSString stringWithString:self->_serviceName];
    v14 = self->_conn;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke;
    handler[3] = &unk_1E5D304D8;
    id v23 = v13;
    id v15 = v13;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_resume(self->_conn);

    conn = self->_conn;
    if (!conn)
    {
      BOOL value = 0;
      goto LABEL_20;
    }
  }
  xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(conn, v6);
  uint64_t v9 = MEMORY[0x1AD0DCD30]();
  if (v9 == MEMORY[0x1E4F145A8])
  {
    v16 = +[DELogging fwHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:](v8, v16);
    }
  }
  else
  {
    if (v9 != MEMORY[0x1E4F14590])
    {
      BOOL value = 0;
      goto LABEL_14;
    }
    v17 = xpc_dictionary_get_value(v8, a4);
    v16 = v17;
    if (v17)
    {
      BOOL value = xpc_BOOL_get_value(v17);
      goto LABEL_13;
    }
    v21 = +[DELogging fwHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:](v21);
    }
  }
  BOOL value = 0;
LABEL_13:

LABEL_14:
  v18 = self->_conn;
  if (v18)
  {
    xpc_connection_cancel(v18);
    v19 = self->_conn;
    self->_conn = 0;
LABEL_19:
  }
LABEL_20:

  return value;
}

void __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1AD0DCD30]() == MEMORY[0x1E4F145A8] && v3 != (id)MEMORY[0x1E4F14528] && v3 != (id)MEMORY[0x1E4F14520])
  {
    id v6 = +[DELogging fwHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke_cold_1(a1, v3, v6);
    }
  }
}

+ (void)moveSystemLogsWithExtensions:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &unk_1EFE526C8;
  }
  id v5 = v3;
  id v6 = dispatch_queue_create("com.apple.DiagnosticExtensions.log_mover", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DELogMover_moveSystemLogsWithExtensions___block_invoke;
  block[3] = &unk_1E5D30190;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);
}

void __43__DELogMover_moveSystemLogsWithExtensions___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [[DELogMover alloc] initWithServiceName:@"com.apple.crash_mover"];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = @"Extensions";
  v7[0] = v3;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (![(DELogMover *)v2 sendRequestReturningBooleanResponse:v4 withSuccessKey:"Success"])
  {
    id v5 = +[DELogging fwHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__DELogMover_moveSystemLogsWithExtensions___block_invoke_cold_1(v5);
    }
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)sendRequestReturningBooleanResponse:(uint64_t *)a1 withSuccessKey:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_ERROR, "Failed to create client connection to service '%@'", (uint8_t *)&v3, 0xCu);
}

- (void)sendRequestReturningBooleanResponse:(void *)a1 withSuccessKey:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E4F14530]);
  int v4 = 136315138;
  uint64_t v5 = string;
  _os_log_error_impl(&dword_1A7E51000, a2, OS_LOG_TYPE_ERROR, "Error in response from XPC: %s", (uint8_t *)&v4, 0xCu);
}

- (void)sendRequestReturningBooleanResponse:(os_log_t)log withSuccessKey:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Missing status in server response, assuming request failed", v1, 2u);
}

void __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke_cold_1(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2080;
  id v9 = string;
  _os_log_error_impl(&dword_1A7E51000, a3, OS_LOG_TYPE_ERROR, "Got unexpected XPC error on connection to service '%@': %s.", (uint8_t *)&v6, 0x16u);
}

void __43__DELogMover_moveSystemLogsWithExtensions___block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1A7E51000, log, OS_LOG_TYPE_ERROR, "Moving logs failed %d", (uint8_t *)v1, 8u);
}

@end