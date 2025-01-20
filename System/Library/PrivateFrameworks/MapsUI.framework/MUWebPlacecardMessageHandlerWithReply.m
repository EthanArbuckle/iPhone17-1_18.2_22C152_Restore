@interface MUWebPlacecardMessageHandlerWithReply
- (MUWebPlacecardMessageHandlerWithReply)initWithDelegate:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5;
@end

@implementation MUWebPlacecardMessageHandlerWithReply

- (MUWebPlacecardMessageHandlerWithReply)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUWebPlacecardMessageHandlerWithReply;
  v5 = [(MUWebPlacecardMessageHandlerWithReply *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 body];

  if (!v9)
  {
    v12 = MUGetMUWebContentLog_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = [v7 body];
      int v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1931EA000, v12, OS_LOG_TYPE_ERROR, "Incorrect message from placecard web module: %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_8;
  }
  v10 = [v7 body];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v7 body];
    v13 = MUGetMUWebContentLog_0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "Received a message from JavaScript: %@", (uint8_t *)&v17, 0xCu);
    }

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveMessageFromWebContentViewController:v14 replyHandler:v8];

LABEL_8:
  }
}

- (void).cxx_destruct
{
}

@end