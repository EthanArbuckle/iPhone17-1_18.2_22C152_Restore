@interface SKGImporterAgent
+ (id)sharedAgent;
+ (void)initialize;
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)handleProcessRecordMessage:(id)a3;
- (BOOL)start;
- (void)_setup;
- (void)didReceiveMemoryPressureNotification:(unint64_t)a3;
- (void)didReceiveSignal:(unint64_t)a3;
@end

@implementation SKGImporterAgent

+ (id)sharedAgent
{
  return (id)qword_1000F8EF0;
}

+ (void)initialize
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sEnableCSEventListener: %d", (uint8_t *)v4, 8u);
  }
  id v2 = [[SKGImporterAgent alloc] initMachServiceListenerWithName:@"com.apple.spotlightknowledged.importer" enableConnectionLogging:0];
  v3 = (void *)qword_1000F8EF0;
  qword_1000F8EF0 = (uint64_t)v2;

  [(id)qword_1000F8EF0 _setup];
}

- (BOOL)start
{
  return 1;
}

- (void)_setup
{
  +[SDSignalHandler setDelegate:self memoryStatusFlags:55];

  +[SDSignalHandler setupHandlers];
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  v3 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  memset(&token, 0, sizeof(token));
  v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.private.corespotlight.sender.importer", 0);
    unsigned int v8 = [v7 BOOLValue];
    v9 = sub_10000FA24();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_1000A0D5C(pid, v10);
    }

    CFRelease(v6);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v7 = a4;
  unsigned int v8 = sub_10000FA24();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = a3;
    __int16 v18 = 2048;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "command %s info:%p", (uint8_t *)&v16, 0x16u);
  }

  if (!strcmp(a3, "test"))
  {
    xpc_object_t v10 = xpc_data_create("TEST", 5uLL);

    int64_t v11 = 0;
  }
  else
  {
    if (!strcmp(a3, "processRecord")
      && [(SKGImporterAgent *)self handleProcessRecordMessage:v7])
    {
      BOOL v9 = 1;
      goto LABEL_17;
    }
    xpc_object_t v10 = 0;
    int64_t v11 = -1;
  }
  xpc_dictionary_get_remote_connection(v7);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    v14 = reply;
    BOOL v9 = reply != 0;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", v11);
      if (v10) {
        xpc_dictionary_set_data(v14, "data", "TEST", 5uLL);
      }
      xpc_connection_send_message(v12, v14);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

LABEL_17:
  return v9;
}

- (void)didReceiveSignal:(unint64_t)a3
{
  v4 = sub_10000FA24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveSignal %ld", (uint8_t *)&v5, 0xCu);
  }

  if (a3 == 15) {
    exit(0);
  }
}

- (void)didReceiveMemoryPressureNotification:(unint64_t)a3
{
  v4 = sub_10000FA24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "didReceiveMemoryPressureNotification %llx", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)handleProcessRecordMessage:(id)a3
{
  id v3 = a3;
  v4 = sub_10000FA24();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "handleProcessRecord", (uint8_t *)v8, 2u);
  }

  if (+[CSXPCConnection copyBoolForKey:"includeEmbeddings" fromXPCDictionary:v3])
  {
    int v5 = +[SKGProcessorContext sharedContext];
    [v5 enableEmbeddings];
  }
  if (+[CSXPCConnection copyBoolForKey:"includeKeyphrases" fromXPCDictionary:v3])
  {
    unint64_t v6 = +[SKGProcessorContext sharedContext];
    [v6 enableKeyphrases];
  }
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  int v9 = -1;
  _Block_object_dispose(v8, 8);

  return 0;
}

@end