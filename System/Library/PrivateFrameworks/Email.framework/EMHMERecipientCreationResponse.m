@interface EMHMERecipientCreationResponse
+ (id)log;
- (EMHMERecipientCreationResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)replyToAddress;
- (void)setReplyToAddress:(id)a3;
@end

@implementation EMHMERecipientCreationResponse

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EMHMERecipientCreationResponse_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_87 != -1) {
    dispatch_once(&log_onceToken_87, block);
  }
  v2 = (void *)log_log_86;
  return v2;
}

void __37__EMHMERecipientCreationResponse_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_86;
  log_log_86 = (uint64_t)v1;
}

- (EMHMERecipientCreationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EMHMERecipientCreationResponse;
  v8 = [(AAResponse *)&v21 initWithHTTPResponse:v6 data:v7];
  v9 = v8;
  if (v8)
  {
    v10 = (uint64_t *)((char *)v8 + (int)*MEMORY[0x1E4F4C020]);
    if ([(id)*v10 statusCode] == 200)
    {
      id v20 = 0;
      v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v20];
      v12 = v20;
      if (v12)
      {
        v13 = +[EMHMERecipientCreationRequest log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(EMHMERecipientCreationRequest *)(uint64_t)v12 _httpBody];
        }

        uint64_t v14 = (int)*MEMORY[0x1E4F4C018];
        v15 = v12;
        v16 = *(NSObject **)((char *)&v9->super.super.isa + v14);
        *(Class *)((char *)&v9->super.super.isa + v14) = (Class)v15;
      }
      else
      {
        uint64_t v17 = [v11 objectForKeyedSubscript:@"replyToAddress"];
        replyToAddress = v9->_replyToAddress;
        v9->_replyToAddress = (NSString *)v17;

        v16 = +[EMHMERecipientCreationRequest log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[EMHMERecipientCreationResponse initWithHTTPResponse:data:]((uint64_t *)&v9->_replyToAddress, (uint64_t)v11, v16);
        }
      }
    }
    else
    {
      v12 = +[EMHMERecipientCreationResponse log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[EMHMERecipientCreationResponse initWithHTTPResponse:data:](v10, buf, [(id)*v10 statusCode], v12);
      }
    }
  }
  return v9;
}

- (NSString)replyToAddress
{
  return self->_replyToAddress;
}

- (void)setReplyToAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithHTTPResponse:(os_log_t)log data:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_DEBUG, "Received _replyToAddress:%@ from jsonData: %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithHTTPResponse:(uint64_t)a3 data:(os_log_t)log .cold.3(uint64_t *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = *a1;
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "EMHMERecipientCreationResponse has non-200 status code: %zd for response: %@", buf, 0x16u);
}

@end