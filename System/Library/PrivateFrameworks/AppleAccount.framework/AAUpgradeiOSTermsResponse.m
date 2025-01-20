@interface AAUpgradeiOSTermsResponse
- (AAUpgradeiOSTermsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BOOL)bodyIsPlist;
- (NSData)xmlUIData;
@end

@implementation AAUpgradeiOSTermsResponse

- (AAUpgradeiOSTermsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAUpgradeiOSTermsResponse;
  v8 = [(AAResponse *)&v13 initWithHTTPResponse:v6 data:v7 bodyIsPlist:0];
  if (v8)
  {
    if ([v7 length])
    {
      v9 = (NSData *)v7;
      p_super = &v8->_xmlUIData->super;
      v8->_xmlUIData = v9;
    }
    else
    {
      p_super = _AALogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v6 statusCode];
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1A11D8000, p_super, OS_LOG_TYPE_DEFAULT, "Empty response for iOS Terms XMLUI, HTTP response: %ld", buf, 0xCu);
      }
    }
  }
  return v8;
}

- (BOOL)bodyIsPlist
{
  return 0;
}

- (NSData)xmlUIData
{
  return self->_xmlUIData;
}

- (void).cxx_destruct
{
}

@end