@interface NSMutableURLRequest(iTunes)
- (void)fam_addiTunesHeadersWithAccount:()iTunes;
@end

@implementation NSMutableURLRequest(iTunes)

- (void)fam_addiTunesHeadersWithAccount:()iTunes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "ams_DSID");
    v7 = v6;
    if (v6)
    {
      v8 = [v6 stringValue];
      [a1 setValue:v8 forHTTPHeaderField:@"X-iTunes-DSID"];
    }
    v9 = objc_msgSend(v5, "ams_cookies");
    v10 = [MEMORY[0x1E4F28D10] requestHeaderFieldsWithCookies:v9];
    if (v10)
    {
      id v18 = 0;
      v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:&v18];
      id v12 = v18;
      if (v11)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        if (v13) {
          [a1 setValue:v13 forHTTPHeaderField:@"X-iTunes-LoggedIn-Data"];
        }
      }
      else
      {
        v13 = _FALogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v12;
          __int16 v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_1D252C000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't serialize iTunes cookies with error: %@, cookies: %@", buf, 0x16u);
        }
      }
    }
    v14 = [v5 username];
    if (v14) {
      [a1 setValue:v14 forHTTPHeaderField:@"X-iTunes-AppleId"];
    }
    v15 = (void *)MEMORY[0x1E4F4DE90];
    v16 = [MEMORY[0x1E4F4DDC8] currentProcess];
    v17 = [v15 userAgentForProcessInfo:v16];
    [a1 setValue:v17 forHTTPHeaderField:@"X-iTunes-User-Agent"];
  }
}

@end