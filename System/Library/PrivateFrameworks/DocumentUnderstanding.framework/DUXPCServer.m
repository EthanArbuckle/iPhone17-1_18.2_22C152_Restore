@interface DUXPCServer
+ (id)sharedInstance;
+ (void)_registerDocumentUnderstandingListenerWithTextUnderstandingManager:(id)a3;
+ (void)_registerPoemMonthlyActivityWithTextUnderstandingManager:(id)a3;
+ (void)_registerPoemWeeklyActivityWithTextUnderstandingManager:(id)a3;
+ (void)registerDUXPCListenersWithManager:(id)a3;
- (DUXPCServer)init;
- (void)_newClientConnection:(id)a3 withTextUnderstandingManager:(id)a4;
- (void)_registerDocumentUpdateHandlerListenerWithTextUnderstandingManager:(id)a3;
@end

@implementation DUXPCServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_documentUpdateQueue, 0);
}

- (void)_newClientConnection:(id)a3 withTextUnderstandingManager:(id)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  if (objc_msgSend_checkForAndLogTrueCStringEntitlement_connection_(DUXPCServerHelper, v8, (uint64_t)"com.apple.TextUnderstanding.DocumentUpdateHandler", (uint64_t)v6, v9))
  {
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)self->_documentUpdateQueue);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_23696ED48;
    handler[3] = &unk_264CB4340;
    id v11 = v7;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(v6);
  }
}

- (void)_registerDocumentUpdateHandlerListenerWithTextUnderstandingManager:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Registering DocumentUpdateHandler", buf, 2u);
  }
  listener = self->_listener;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23696F0E0;
  v7[3] = &unk_264CB4318;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  xpc_connection_set_event_handler(listener, v7);
  xpc_connection_resume(self->_listener);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Registered DocumentUpdateHandler", buf, 2u);
  }
}

- (DUXPCServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)DUXPCServer;
  v2 = [(DUXPCServer *)&v13 init];
  if (!v2) {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2367AD000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: Initializing DUXPCServer for DocumentUpdateHandler", v12, 2u);
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.TextUnderstanding.DocumentUpdateHandler.queue", 0);
  documentUpdateQueue = v2->_documentUpdateQueue;
  v2->_documentUpdateQueue = (OS_dispatch_queue *)v3;

  v5 = v2->_documentUpdateQueue;
  if (!v5)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      id v8 = 0;
      goto LABEL_11;
    }
    *(_WORD *)v12 = 0;
    uint64_t v9 = &_os_log_internal;
    v10 = "DocumentUnderstanding: failed to create DocumentUpdateHandler queue";
LABEL_13:
    _os_log_error_impl(&dword_2367AD000, v9, OS_LOG_TYPE_ERROR, v10, v12, 2u);
    goto LABEL_10;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.TextUnderstanding.DocumentUpdateHandler", v5, 1uLL);
  listener = v2->_listener;
  v2->_listener = mach_service;

  if (!v2->_listener)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)v12 = 0;
    uint64_t v9 = &_os_log_internal;
    v10 = "DocumentUnderstanding: could not start DocumentUpdateHandler xpc listener";
    goto LABEL_13;
  }
LABEL_6:
  id v8 = v2;
LABEL_11:

  return v8;
}

+ (void)_registerPoemMonthlyActivityWithTextUnderstandingManager:(id)a3
{
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_23696F464;
  handler[3] = &unk_264CB4340;
  id v7 = v3;
  id v5 = v3;
  xpc_activity_register("com.apple.TextUnderstanding.Poem.RunMonthly", v4, handler);
}

+ (void)_registerPoemWeeklyActivityWithTextUnderstandingManager:(id)a3
{
  id v3 = a3;
  id v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_23696F854;
  handler[3] = &unk_264CB4340;
  id v7 = v3;
  id v5 = v3;
  xpc_activity_register("com.apple.TextUnderstanding.Poem.RunWeekly", v4, handler);
}

+ (void)_registerDocumentUnderstandingListenerWithTextUnderstandingManager:(id)a3
{
  id v3 = a3;
  id v4 = [DUXPCServerDelegate alloc];
  uint64_t v8 = objc_msgSend_initWithManager_(v4, v5, (uint64_t)v3, v6, v7);

  uint64_t v9 = (void *)qword_26AD8BC48;
  qword_26AD8BC48 = v8;

  id v10 = objc_alloc(MEMORY[0x263F08D88]);
  uint64_t v14 = objc_msgSend_initWithMachServiceName_(v10, v11, @"com.apple.TextUnderstanding.DocumentUnderstandingHarvesting", v12, v13);
  v15 = (void *)qword_26AD8BC50;
  qword_26AD8BC50 = v14;

  objc_msgSend_setDelegate_((void *)qword_26AD8BC50, v16, qword_26AD8BC48, v17, v18);
  v23 = (void *)qword_26AD8BC50;
  objc_msgSend_resume(v23, v19, v20, v21, v22);
}

+ (void)registerDUXPCListenersWithManager:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_23696FAEC;
  aBlock[3] = &unk_264CB42C8;
  id v12 = v4;
  id v13 = a1;
  id v5 = v4;
  uint64_t v6 = _Block_copy(aBlock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23696FB10;
  block[3] = &unk_264CB42F0;
  id v10 = v6;
  uint64_t v7 = qword_26AD8BC40;
  id v8 = v6;
  if (v7 != -1) {
    dispatch_once(&qword_26AD8BC40, block);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23696FBFC;
  block[3] = &unk_264CB45A0;
  void block[4] = a1;
  if (qword_2688A6F20 != -1) {
    dispatch_once(&qword_2688A6F20, block);
  }
  v2 = (void *)qword_2688A6F18;
  return v2;
}

@end