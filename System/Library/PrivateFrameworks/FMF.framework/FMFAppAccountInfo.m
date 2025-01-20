@interface FMFAppAccountInfo
- (NSString)appAuthToken;
- (NSString)appServerHost;
- (NSString)dsid;
- (NSString)legacyDsid;
- (NSString)legacyUsername;
- (NSString)username;
- (id)description;
- (int64_t)appAuthTokenStatus;
- (void)setAppAuthToken:(id)a3;
- (void)setAppAuthTokenStatus:(int64_t)a3;
- (void)setAppServerHost:(id)a3;
- (void)setDsid:(id)a3;
- (void)setLegacyDsid:(id)a3;
- (void)setLegacyUsername:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation FMFAppAccountInfo

- (id)description
{
  v3 = NSString;
  v4 = [(FMFAppAccountInfo *)self dsid];
  v5 = [(FMFAppAccountInfo *)self username];
  v6 = [(FMFAppAccountInfo *)self appAuthToken];
  if (v6) {
    v7 = @"(not-nil)";
  }
  else {
    v7 = @"(nil)";
  }
  int64_t v8 = [(FMFAppAccountInfo *)self appAuthTokenStatus];
  v9 = [(FMFAppAccountInfo *)self appServerHost];
  v10 = [(FMFAppAccountInfo *)self legacyDsid];
  v11 = [(FMFAppAccountInfo *)self legacyUsername];
  v12 = [v3 stringWithFormat:@"FMFAppAccountInfo(0x%lx) %@,%@,%@,%ld,%@,%@,%@", self, v4, v5, v7, v8, v9, v10, v11];

  return v12;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)appServerHost
{
  return self->_appServerHost;
}

- (void)setAppServerHost:(id)a3
{
}

- (NSString)appAuthToken
{
  return self->_appAuthToken;
}

- (void)setAppAuthToken:(id)a3
{
}

- (int64_t)appAuthTokenStatus
{
  return self->_appAuthTokenStatus;
}

- (void)setAppAuthTokenStatus:(int64_t)a3
{
  self->_appAuthTokenStatus = a3;
}

- (NSString)legacyDsid
{
  return self->_legacyDsid;
}

- (void)setLegacyDsid:(id)a3
{
}

- (NSString)legacyUsername
{
  return self->_legacyUsername;
}

- (void)setLegacyUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyUsername, 0);
  objc_storeStrong((id *)&self->_legacyDsid, 0);
  objc_storeStrong((id *)&self->_appAuthToken, 0);
  objc_storeStrong((id *)&self->_appServerHost, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end