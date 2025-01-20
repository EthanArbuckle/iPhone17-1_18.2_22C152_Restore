@interface AASigningSessionResponse
- (AASigningSessionResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSData)sessionData;
- (void)setSessionData:(id)a3;
@end

@implementation AASigningSessionResponse

- (AASigningSessionResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AASigningSessionResponse;
  v5 = [(AAResponse *)&v11 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v6 = v5;
  if (v5)
  {
    if (a4)
    {
      v7 = [(NSDictionary *)v5->super._responseDictionary objectForKey:@"session-info"];
      if (v7)
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        p_super = &v6->_sessionData->super;
        v6->_sessionData = (NSData *)v8;
      }
      else
      {
        p_super = _AALogSystem();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[AASigningSessionResponse initWithHTTPResponse:data:]((uint64_t *)&v6->super._responseDictionary, p_super);
        }
      }
    }
    else
    {
      v7 = _AALogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[AASigningSessionResponse initWithHTTPResponse:data:](v7);
      }
    }
  }
  return v6;
}

- (NSData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithHTTPResponse:(os_log_t)log data:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A11D8000, log, OS_LOG_TYPE_ERROR, "Error: No data for AASigningSessionResponse!", v1, 2u);
}

- (void)initWithHTTPResponse:(uint64_t *)a1 data:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "Error: session-info not present in response: %@", (uint8_t *)&v3, 0xCu);
}

@end