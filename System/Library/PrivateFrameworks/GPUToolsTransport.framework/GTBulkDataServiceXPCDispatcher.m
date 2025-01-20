@interface GTBulkDataServiceXPCDispatcher
- (GTBulkDataServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)downloadData_usingTransferOptions_chunkHandler_:(id)a3 replyConnection:(id)a4;
- (void)newUploadWithDescriptor_error_:(id)a3 replyConnection:(id)a4;
- (void)uploadChunk_forHandle_isFinalChunk_error_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTBulkDataServiceXPCDispatcher

- (GTBulkDataServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTBulkDataServiceXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)downloadData_usingTransferOptions_chunkHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "handle");
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "transferOptions", v9);
  uint64_t v11 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  v12 = xpc_dictionary_get_array(v7, "_pathHistory");

  service = self->_service;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__GTBulkDataServiceXPCDispatcher_downloadData_usingTransferOptions_chunkHandler__replyConnection___block_invoke;
  v16[3] = &unk_264E28980;
  id v18 = v6;
  uint64_t v19 = v11;
  id v17 = v12;
  id v14 = v6;
  id v15 = v12;
  [(GTBulkDataService *)service downloadData:uint64 usingTransferOptions:nsobject chunkHandler:v16];
}

void __98__GTBulkDataServiceXPCDispatcher_downloadData_usingTransferOptions_chunkHandler__replyConnection___block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(void *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  MessageSetHasReply(xdict);
  xpc_dictionary_set_nsdata(xdict, "chunk", v8);

  xpc_dictionary_set_BOOL(xdict, "isFinalChunk", a3);
  xpc_dictionary_set_nserror(xdict, "error", v7);

  id v9 = (id)[*(id *)(a1 + 40) sendMessageWithReplySync:xdict error:0];
}

- (void)newUploadWithDescriptor_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "descriptor", v9);

  service = self->_service;
  id v14 = 0;
  uint64_t v12 = [(GTBulkDataService *)service newUploadWithDescriptor:nsobject error:&v14];
  id v13 = v14;
  xpc_dictionary_set_uint64(v8, "result", v12);
  xpc_dictionary_set_nserror(v8, "error", v13);

  [v6 sendMessage:v8];
}

- (void)uploadChunk_forHandle_isFinalChunk_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  nsdata = (void *)xpc_dictionary_get_nsdata(v7, "chunk");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "handle");
  BOOL v11 = xpc_dictionary_get_BOOL(v7, "isFinalChunk");

  service = self->_service;
  id v14 = 0;
  LOBYTE(self) = [(GTBulkDataService *)service uploadChunk:nsdata forHandle:uint64 isFinalChunk:v11 error:&v14];
  id v13 = v14;
  xpc_dictionary_set_BOOL(v8, "result", (BOOL)self);
  xpc_dictionary_set_nserror(v8, "error", v13);

  [v6 sendMessage:v8];
}

- (void).cxx_destruct
{
}

@end