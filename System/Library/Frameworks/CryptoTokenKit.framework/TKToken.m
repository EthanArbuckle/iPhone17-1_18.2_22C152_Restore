@interface TKToken
- (TKToken)initWithTokenDriver:(TKTokenDriver *)tokenDriver instanceID:(TKTokenInstanceID)instanceID;
- (TKTokenConfiguration)configuration;
- (TKTokenDriver)tokenDriver;
- (TKTokenID)tokenID;
- (TKTokenKeychainContents)keychainContents;
- (id)delegate;
- (id)description;
- (void)setDelegate:(id)delegate;
- (void)setKeychainContents:(id)a3;
- (void)terminate;
@end

@implementation TKToken

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TKToken *)self tokenID];
  v7 = [v6 stringRepresentation];
  v8 = [v3 stringWithFormat:@"<%@ %@ %p>", v5, v7, self];

  return v8;
}

- (TKToken)initWithTokenDriver:(TKTokenDriver *)tokenDriver instanceID:(TKTokenInstanceID)instanceID
{
  v7 = tokenDriver;
  v8 = instanceID;
  v16.receiver = self;
  v16.super_class = (Class)TKToken;
  v9 = [(TKToken *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tokenDriver, tokenDriver);
    if ([(TKToken *)v10 conformsToProtocol:&unk_1F1A01B08]) {
      objc_storeWeak((id *)&v10->_delegate, v10);
    }
    v11 = [TKTokenID alloc];
    v12 = [(TKTokenDriver *)v7 classID];
    uint64_t v13 = [(TKTokenID *)v11 initWithClassID:v12 instanceID:v8];
    tokenID = v10->_tokenID;
    v10->_tokenID = (TKTokenID *)v13;
  }
  return v10;
}

- (TKTokenConfiguration)configuration
{
  v2 = self;
  objc_sync_enter(v2);
  configuration = v2->_configuration;
  if (!configuration)
  {
    v4 = [TKTokenConfiguration alloc];
    tokenID = v2->_tokenID;
    v6 = [(TKTokenDriver *)v2->_tokenDriver context];
    v7 = [v6 configurationConnection];
    uint64_t v8 = [(TKTokenConfiguration *)v4 initWithTokenID:tokenID configurationConnection:v7];
    v9 = v2->_configuration;
    v2->_configuration = (TKTokenConfiguration *)v8;

    configuration = v2->_configuration;
  }
  v10 = configuration;
  objc_sync_exit(v2);

  return v10;
}

- (void)terminate
{
  v3 = [(TKToken *)self tokenDriver];
  v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(TKToken *)self tokenDriver];
    v6 = [v8 delegate];
    v7 = [(TKToken *)self tokenDriver];
    [v6 tokenDriver:v7 terminateToken:self];
  }
}

- (TKTokenDriver)tokenDriver
{
  return (TKTokenDriver *)objc_getProperty(self, a2, 16, 1);
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (TKTokenKeychainContents)keychainContents
{
  return (TKTokenKeychainContents *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeychainContents:(id)a3
{
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_keychainContents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tokenDriver, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end