@interface AAFMIPAuthenticateResponse
- (AAFMIPAuthenticateResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)fmipDsid;
- (NSString)fmipUrl;
- (NSString)fmipWipeToken;
@end

@implementation AAFMIPAuthenticateResponse

- (AAFMIPAuthenticateResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AAFMIPAuthenticateResponse;
  v4 = [(AAResponse *)&v16 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4 && [(NSHTTPURLResponse *)v4->super._httpResponse statusCode] == 200)
  {
    v6 = [(AAResponse *)v5 responseDictionary];

    if (v6)
    {
      v7 = [(AAResponse *)v5 responseDictionary];
      v8 = [v7 objectForKey:@"tokens"];
      uint64_t v9 = [v8 copy];
      tokens = v5->_tokens;
      v5->_tokens = (NSDictionary *)v9;

      v11 = [(AAResponse *)v5 responseDictionary];
      v12 = [v11 objectForKey:@"appleAccountInfo"];
      uint64_t v13 = [v12 copy];
      appleAccountInfo = v5->_appleAccountInfo;
      v5->_appleAccountInfo = (NSDictionary *)v13;
    }
    [(AAResponse *)v5 setError:0];
  }
  return v5;
}

- (NSString)fmipWipeToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKeyedSubscript:@"mmeFMIPWipeToken"];
}

- (NSString)fmipUrl
{
  v2 = [(AAResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"url"];

  return (NSString *)v3;
}

- (NSString)fmipDsid
{
  return (NSString *)[(NSDictionary *)self->_appleAccountInfo objectForKey:@"dsid"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountInfo, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end