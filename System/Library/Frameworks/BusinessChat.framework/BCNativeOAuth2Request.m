@interface BCNativeOAuth2Request
- (id)_initWithDictionary:(id)a3;
@end

@implementation BCNativeOAuth2Request

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"oauth2"];
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"oauth2"];

    if (v8)
    {
      v9 = +[BCNativeOAuth2URLProvider URLProviderWithDictionary:v8];
      if (v9)
      {
        v13.receiver = self;
        v13.super_class = (Class)BCNativeOAuth2Request;
        self = (BCNativeOAuth2Request *)[(BCOAuth2Request *)&v13 _initWithDictionary:v4 URLProvider:v9];
        v10 = self;
      }
      else
      {
        v11 = LogCategory_Daemon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_228C26000, v11, OS_LOG_TYPE_ERROR, "Unable to create  BCOAuth2Parameters: missing 'oauth2' payload is invalid", buf, 2u);
        }

        v10 = 0;
      }

      goto LABEL_13;
    }
  }
  v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_228C26000, v8, OS_LOG_TYPE_ERROR, "Unable to create  BCOAuth2Parameters: missing 'oauth2' in payload", buf, 2u);
  }
  v10 = 0;
LABEL_13:

  return v10;
}

@end