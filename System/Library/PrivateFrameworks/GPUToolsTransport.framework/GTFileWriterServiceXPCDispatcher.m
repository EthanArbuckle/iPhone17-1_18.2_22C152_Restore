@interface GTFileWriterServiceXPCDispatcher
- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTFileWriterServiceXPCDispatcher

- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTFileWriterServiceXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && ([NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __116__GTFileWriterServiceXPCDispatcher_initiateTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke;
      v26[3] = &unk_264E28CF0;
      id v27 = v8;
      id v28 = v7;
      [(GTFileWriterService *)service initiateTransfer:nsarray basePath:v13 fromDevice:v16 options:nsobject completionHandler:v26];
    }
    else
    {
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v24 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to initiateTransfer"];
      v30 = v24;
      v25 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v16 = [v23 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v25];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v21 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to initiateTransfer"];
    v32[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v13 = [v20 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v22];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

uint64_t __116__GTFileWriterServiceXPCDispatcher_initiateTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && ([NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __113__GTFileWriterServiceXPCDispatcher_startTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke;
      v26[3] = &unk_264E28BD8;
      id v27 = v8;
      id v28 = v7;
      [(GTFileWriterService *)service startTransfer:nsarray basePath:v13 fromDevice:v16 options:nsobject completionHandler:v26];
    }
    else
    {
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v24 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to startTransfer"];
      v30 = v24;
      v25 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v16 = [v23 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v25];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v21 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to startTransfer"];
    v32[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v13 = [v20 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v22];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

uint64_t __113__GTFileWriterServiceXPCDispatcher_startTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  return [v7 sendMessage:v8];
}

- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && ([NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "sessionID");
      service = self->_service;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __143__GTFileWriterServiceXPCDispatcher_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler__replyConnection___block_invoke;
      v27[3] = &unk_264E28CF0;
      id v28 = v8;
      id v29 = v7;
      [(GTFileWriterService *)service beginTransferSessionWithFileEntries:nsarray basePath:v13 toDevice:v16 options:nsobject sessionID:uint64 completionHandler:v27];
    }
    else
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      v25 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to beginTransferSessionWithFileEntries"];
      uint64_t v31 = v25;
      v26 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v16 = [v24 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v26];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    v22 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to beginTransferSessionWithFileEntries"];
    v33[0] = v22;
    v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v13 = [v21 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v23];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

uint64_t __143__GTFileWriterServiceXPCDispatcher_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(v7, "data");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "sessionID");
  v10 = gt_xpc_dictionary_create_reply(v7);

  service = self->_service;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __95__GTFileWriterServiceXPCDispatcher_writeFileData_sessionID_completionHandler__replyConnection___block_invoke;
  v14[3] = &unk_264E28CF0;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  [(GTFileWriterService *)service writeFileData:nsdata_nocopy sessionID:uint64 completionHandler:v14];
}

uint64_t __95__GTFileWriterServiceXPCDispatcher_writeFileData_sessionID_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void).cxx_destruct
{
}

@end