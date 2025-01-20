@interface ATVHighSecurityAccountDeviceList
+ (Class)responseClass;
- (id)urlRequest;
- (id)urlString;
@end

@implementation ATVHighSecurityAccountDeviceList

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 deviceListURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)ATVHighSecurityAccountDeviceList;
  v3 = [(AARequest *)&v21 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  uint64_t v5 = [(ACAccount *)self->super._account aa_password];
  if (v5
    && (v6 = (void *)v5,
        [(ACAccount *)self->super._account username],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Using password auth", buf, 2u);
    }

    v9 = NSString;
    v10 = [(ACAccount *)self->super._account username];
    v11 = [(ACAccount *)self->super._account aa_password];
    v12 = [v9 stringWithFormat:@"%@:%@", v10, v11];

    int v13 = 1;
  }
  else
  {
    v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "ERROR: Missing account username or password", buf, 2u);
    }
    int v13 = 0;
    v12 = 0;
  }

  v14 = [v12 dataUsingEncoding:4];
  v15 = [v14 base64EncodedStringWithOptions:0];

  v16 = [NSString stringWithFormat:@"Basic %@", v15];
  [v4 addValue:v16 forHTTPHeaderField:@"Authorization"];
  [v4 addValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
  v17 = _AALogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Authorization: *redacted*", buf, 2u);
    }
  }
  else if (v18)
  {
    v19 = [v4 valueForHTTPHeaderField:@"Authorization"];
    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  return v4;
}

@end