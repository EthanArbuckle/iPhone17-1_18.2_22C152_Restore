@interface GTFileWriterServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8;
- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7;
- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation GTFileWriterServiceXPCProxy

- (GTFileWriterServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GTFileWriterServiceXPCProxy;
  v8 = [(GTFileWriterServiceXPCProxy *)&v19 init];
  if (v8)
  {
    v9 = &unk_26EFBDE18;
    v10 = [GTServiceConnection alloc];
    v11 = [v7 deviceUDID];
    uint64_t v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v12;

    v14 = +[GTServiceProperties protocolMethods:v9];
    v15 = [v7 protocolMethods];
    uint64_t v16 = newSetWithArrayMinusArray(v14, v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;
  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTFileWriterServiceXPCProxy;
    BOOL v7 = [(GTFileWriterServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __94__GTFileWriterServiceXPCProxy_initiateTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v26[3] = &unk_264E28B60;
  id v27 = v13;
  id v25 = v13;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v26];
}

void __94__GTFileWriterServiceXPCProxy_initiateTransfer_basePath_fromDevice_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    uint64_t nserror = xpc_dictionary_get_nserror(a2, "error");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = (void *)nserror;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v7;
  }
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v17);

  id v20 = v16;
  v21 = (const char *)[v20 UTF8String];

  xpc_dictionary_set_string(empty, "path", v21);
  id v22 = v15;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v23);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v14);

  connection = self->_connection;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __91__GTFileWriterServiceXPCProxy_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v26[3] = &unk_264E28B60;
  id v27 = v13;
  id v25 = v13;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v26];
}

void __91__GTFileWriterServiceXPCProxy_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    uint64_t nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "fileEntries", (uint64_t)v19);

  id v22 = v18;
  v23 = (const char *)[v22 UTF8String];

  xpc_dictionary_set_string(empty, "path", v23);
  id v24 = v17;
  id v25 = (const char *)[v24 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v25);
  xpc_dictionary_set_nsobject(empty, "options", (uint64_t)v16);

  xpc_dictionary_set_uint64(empty, "sessionID", a7);
  connection = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __121__GTFileWriterServiceXPCProxy_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke;
  v28[3] = &unk_264E28B60;
  id v29 = v15;
  id v27 = v15;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v28];
}

void __121__GTFileWriterServiceXPCProxy_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "data", v10);

  xpc_dictionary_set_uint64(empty, "sessionID", a4);
  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__GTFileWriterServiceXPCProxy_writeFileData_sessionID_completionHandler___block_invoke;
  v15[3] = &unk_264E28B60;
  id v16 = v9;
  id v14 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v15];
}

void __73__GTFileWriterServiceXPCProxy_writeFileData_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);
  }
  else
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end