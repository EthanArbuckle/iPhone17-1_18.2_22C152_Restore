@interface AAAuthenticationResponse
- (AAAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)altDSID;
- (NSString)authToken;
- (NSString)cloudKitToken;
- (NSString)fmfAppToken;
- (NSString)fmfToken;
- (NSString)fmipLostModeToken;
- (NSString)fmipToken;
- (NSString)mapsToken;
- (NSString)mdmServerToken;
- (NSString)personID;
@end

@implementation AAAuthenticationResponse

- (AAAuthenticationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AAAuthenticationResponse;
  v4 = [(AAResponse *)&v16 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4
    && ([(NSHTTPURLResponse *)v4->super._httpResponse statusCode] == 200
     || [(NSHTTPURLResponse *)v5->super._httpResponse statusCode] == 409))
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
      appleAccount = v5->_appleAccount;
      v5->_appleAccount = (NSDictionary *)v13;
    }
  }
  return v5;
}

- (NSString)fmfToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mmeFMFToken"];
}

- (NSString)fmfAppToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mmeFMFAppToken"];
}

- (NSString)fmipToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mmeFMIPToken"];
}

- (NSString)authToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mmeAuthToken"];
}

- (NSString)mapsToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mapsToken"];
}

- (NSString)cloudKitToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"cloudKitToken"];
}

- (NSString)fmipLostModeToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"lostModeExitAuthToken"];
}

- (NSString)mdmServerToken
{
  return (NSString *)[(NSDictionary *)self->_tokens objectForKey:@"mdmServerToken"];
}

- (NSString)personID
{
  v3 = [(NSDictionary *)self->_appleAccount objectForKey:@"dsid"];
  if (!v3)
  {
    v3 = [(NSDictionary *)self->_appleAccount objectForKey:@"dsPrsID"];
  }

  return (NSString *)v3;
}

- (NSString)altDSID
{
  return (NSString *)[(NSDictionary *)self->_appleAccount objectForKey:@"aDsID"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccount, 0);

  objc_storeStrong((id *)&self->_tokens, 0);
}

@end