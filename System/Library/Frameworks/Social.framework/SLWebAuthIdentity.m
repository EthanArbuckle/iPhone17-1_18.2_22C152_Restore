@interface SLWebAuthIdentity
- (NSArray)grantedDataclasses;
- (NSString)displayName;
- (NSString)idToken;
- (NSString)refreshToken;
- (NSString)token;
- (NSString)username;
- (NSString)youTubeUsername;
- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8;
- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8 grantedDataclasses:(id)a9;
@end

@implementation SLWebAuthIdentity

- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8
{
  return [(SLWebAuthIdentity *)self initWithUsername:a3 token:a4 displayName:a5 refreshToken:a6 youTubeUsername:a7 idToken:a8 grantedDataclasses:0];
}

- (SLWebAuthIdentity)initWithUsername:(id)a3 token:(id)a4 displayName:(id)a5 refreshToken:(id)a6 youTubeUsername:(id)a7 idToken:(id)a8 grantedDataclasses:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SLWebAuthIdentity;
  v18 = [(SLWebAuthIdentity *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_username, a3);
    objc_storeStrong((id *)&v19->_displayName, a5);
    objc_storeStrong((id *)&v19->_token, a4);
    objc_storeStrong((id *)&v19->_refreshToken, a6);
    objc_storeStrong((id *)&v19->_youTubeUsername, a7);
    objc_storeStrong((id *)&v19->_idToken, a8);
    objc_storeStrong((id *)&v19->_grantedDataclasses, a9);
  }

  return v19;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)youTubeUsername
{
  return self->_youTubeUsername;
}

- (NSArray)grantedDataclasses
{
  return self->_grantedDataclasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_youTubeUsername, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end