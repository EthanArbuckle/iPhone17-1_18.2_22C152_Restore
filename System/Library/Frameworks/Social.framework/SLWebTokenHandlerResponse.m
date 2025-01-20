@interface SLWebTokenHandlerResponse
- (NSArray)grantedDataclasses;
- (NSArray)usernames;
- (NSDate)expiryDate;
- (NSString)displayName;
- (NSString)idToken;
- (NSString)refreshToken;
- (NSString)token;
- (SLWebTokenHandlerResponse)initWithTokenResponse:(id)a3 usernames:(id)a4 displayname:(id)a5;
- (void)setToken:(id)a3;
@end

@implementation SLWebTokenHandlerResponse

- (SLWebTokenHandlerResponse)initWithTokenResponse:(id)a3 usernames:(id)a4 displayname:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SLWebTokenHandlerResponse;
  v11 = [(SLWebTokenHandlerResponse *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 token];
    token = v11->_token;
    v11->_token = (NSString *)v12;

    uint64_t v14 = [v8 refreshToken];
    refreshToken = v11->_refreshToken;
    v11->_refreshToken = (NSString *)v14;

    uint64_t v16 = [v8 idToken];
    idToken = v11->_idToken;
    v11->_idToken = (NSString *)v16;

    uint64_t v18 = [v8 expiryDate];
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = (NSDate *)v18;

    uint64_t v20 = [v8 grantedDataclasses];
    grantedDataclasses = v11->_grantedDataclasses;
    v11->_grantedDataclasses = (NSArray *)v20;

    objc_storeStrong((id *)&v11->_displayName, a5);
    objc_storeStrong((id *)&v11->_usernames, a4);
  }

  return v11;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSArray)grantedDataclasses
{
  return self->_grantedDataclasses;
}

- (NSArray)usernames
{
  return self->_usernames;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_usernames, 0);
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end