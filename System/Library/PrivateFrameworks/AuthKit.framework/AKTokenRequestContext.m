@interface AKTokenRequestContext
- (ACAccount)account;
- (ACAccountCredential)credential;
- (AKToken)token;
- (AKTokenRequestContext)initWithIdentifier:(id)a3 altDSID:(id)a4;
- (NSString)altDSID;
- (NSString)tokenIdentifier;
- (void)setAccount:(id)a3;
- (void)setCredential:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation AKTokenRequestContext

- (AKTokenRequestContext)initWithIdentifier:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKTokenRequestContext;
  v9 = [(AKTokenRequestContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenIdentifier, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ACAccountCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (AKToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
}

@end