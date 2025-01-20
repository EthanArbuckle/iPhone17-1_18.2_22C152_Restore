@interface ANRapportEventStreamHandler
- (ANRapportEventStreamHandler)init;
- (NSMutableDictionary)rapportActivationHandlers;
- (void)addAnnounceRapportServiceType;
- (void)addRapportServiceType:(id)a3 activationBlock:(id)a4;
- (void)setEventStreamHandler;
@end

@implementation ANRapportEventStreamHandler

- (ANRapportEventStreamHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)ANRapportEventStreamHandler;
  v2 = [(ANRapportEventStreamHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rapportActivationHandlers = v2->_rapportActivationHandlers;
    v2->_rapportActivationHandlers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addRapportServiceType:(id)a3 activationBlock:(id)a4
{
  id v6 = a3;
  id v8 = _Block_copy(a4);
  v7 = [(ANRapportEventStreamHandler *)self rapportActivationHandlers];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void)addAnnounceRapportServiceType
{
  if ([MEMORY[0x1E4F4A898] isAnnounceEnabled])
  {
    id v3 = [(ANRapportEventStreamHandler *)self rapportActivationHandlers];
    [v3 setObject:&__block_literal_global_7 forKeyedSubscript:*MEMORY[0x1E4F4A4D8]];
  }
}

void __60__ANRapportEventStreamHandler_addAnnounceRapportServiceType__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[ANRapportConnection sharedConnection];
  [v3 activateLinkWithOptions:1 completion:v2];
}

- (void)setEventStreamHandler
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke;
  handler[3] = &unk_1E6BCE050;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x1E4F14428], handler);
}

void __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]);
  v5 = ANLogHandleRapportEventStreamHandler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_1F34A0E10;
    __int16 v15 = 2080;
    v16 = string;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@XPC Event Stream Name: %s", buf, 0x16u);
  }

  if (string && xpc_dictionary_expects_reply())
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      v7 = [*(id *)(a1 + 32) rapportActivationHandlers];
      id v8 = [NSString stringWithUTF8String:string];
      v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke_6;
        v11[3] = &unk_1E6BCE028;
        v12 = reply;
        ((void (**)(void, void *))v9)[2](v9, v11);
        v10 = v12;
      }
      else
      {
        v10 = ANLogHandleRapportEventStreamHandler();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v14 = &stru_1F34A0E10;
          __int16 v15 = 2080;
          v16 = string;
          _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_ERROR, "%@Unsupported XPC Event Stream Name: %s", buf, 0x16u);
        }
      }
    }
  }
}

void __52__ANRapportEventStreamHandler_setEventStreamHandler__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3) {
    CUXPCEncodeNSError();
  }
  v4 = ANLogHandleRapportEventStreamHandler();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Sending Reply %@", (uint8_t *)&v6, 0x16u);
  }

  xpc_dictionary_send_reply();
}

- (NSMutableDictionary)rapportActivationHandlers
{
  return self->_rapportActivationHandlers;
}

- (void).cxx_destruct
{
}

@end