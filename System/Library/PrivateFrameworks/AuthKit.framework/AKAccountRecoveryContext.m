@interface AKAccountRecoveryContext
+ (AKAccountRecoveryContext)recoveryContextWithAuthContext:(id)a3;
+ (AKAccountRecoveryContext)recoveryContextWithServerInfo:(id)a3;
+ (BOOL)supportsSecureCoding;
- (AKAccountRecoveryContext)initWithCoder:(id)a3;
- (AKAppleIDAuthenticationContext)authContext;
- (BOOL)isValid;
- (BOOL)mandatesRecoveryKey;
- (BOOL)supportsMasterKeyRecovery;
- (NSString)decodedRecoveryIdentityTokenString;
- (NSString)decodedRecoveryPETString;
- (NSString)encodedRecoveryIdentityToken;
- (NSString)encodedRecoveryPET;
- (NSURL)recoveryContinuationURL;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setEncodedRecoveryIdentityToken:(id)a3;
- (void)setEncodedRecoveryPET:(id)a3;
- (void)setMandatesRecoveryKey:(BOOL)a3;
- (void)setRecoveryContinuationURL:(id)a3;
- (void)setSupportsMasterKeyRecovery:(BOOL)a3;
@end

@implementation AKAccountRecoveryContext

+ (AKAccountRecoveryContext)recoveryContextWithServerInfo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Building recovery context with info: %@", (uint8_t *)&v20, 0xCu);
  }

  v6 = objc_alloc_init(AKAppleIDAuthenticationContext);
  v7 = [v4 objectForKeyedSubscript:@"X-Apple-Alternate-Id"];
  [(AKAppleIDAuthenticationContext *)v6 setAltDSID:v7];

  v8 = [v4 objectForKeyedSubscript:@"X-Apple-DSID"];
  [(AKAppleIDAuthenticationContext *)v6 setDSID:v8];

  v9 = [v4 objectForKeyedSubscript:@"AKUsername"];
  [(AKAppleIDAuthenticationContext *)v6 setUsername:v9];

  id v10 = objc_alloc_init((Class)a1);
  [v10 setAuthContext:v6];
  v11 = [v4 objectForKeyedSubscript:@"X-Apple-AK-Action"];
  objc_msgSend(v10, "setSupportsMasterKeyRecovery:", objc_msgSend(v11, "isEqualToString:", @"mk-validation"));

  v12 = [v4 objectForKeyedSubscript:@"X-Apple-Recovery-Identity-Token"];
  [v10 setEncodedRecoveryIdentityToken:v12];

  v13 = [v4 objectForKeyedSubscript:@"X-Apple-Recovery-PE-Token"];
  [v10 setEncodedRecoveryPET:v13];

  objc_opt_class();
  id v14 = [v4 objectForKeyedSubscript:@"RKMandate"];
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  objc_msgSend(v10, "setMandatesRecoveryKey:", objc_msgSend(v15, "isEqualToString:", @"true"));
  v16 = (void *)MEMORY[0x1E4F1CB10];
  v17 = [v4 objectForKeyedSubscript:@"AKRecoveryURLKey"];
  v18 = [v16 URLWithString:v17];
  [v10 setRecoveryContinuationURL:v18];

  return (AKAccountRecoveryContext *)v10;
}

+ (AKAccountRecoveryContext)recoveryContextWithAuthContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_193494000, v5, OS_LOG_TYPE_DEFAULT, "Building recovery context with authContext: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = objc_alloc_init((Class)a1);
  [v6 setAuthContext:v4];

  return (AKAccountRecoveryContext *)v6;
}

- (AKAccountRecoveryContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AKAccountRecoveryContext;
  v5 = [(AKAccountRecoveryContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_encodedRecoveryIdentityToken"];
    encodedRecoveryIdentityToken = v5->_encodedRecoveryIdentityToken;
    v5->_encodedRecoveryIdentityToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_encodedRecoveryPET"];
    encodedRecoveryPET = v5->_encodedRecoveryPET;
    v5->_encodedRecoveryPET = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authContext"];
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recoveryContinuationURL"];
    recoveryContinuationURL = v5->_recoveryContinuationURL;
    v5->_recoveryContinuationURL = (NSURL *)v12;

    v5->_supportsMasterKeyRecovery = [v4 decodeBoolForKey:@"_supportsMasterKeyRecovery"];
    v5->_mandatesRecoveryKey = [v4 decodeBoolForKey:@"_mandatesRecoveryKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encodedRecoveryIdentityToken = self->_encodedRecoveryIdentityToken;
  id v5 = a3;
  [v5 encodeObject:encodedRecoveryIdentityToken forKey:@"_encodedRecoveryIdentityToken"];
  [v5 encodeObject:self->_encodedRecoveryPET forKey:@"_encodedRecoveryPET"];
  [v5 encodeObject:self->_authContext forKey:@"_authContext"];
  [v5 encodeObject:self->_recoveryContinuationURL forKey:@"_recoveryContinuationURL"];
  [v5 encodeBool:self->_supportsMasterKeyRecovery forKey:@"_supportsMasterKeyRecovery"];
  [v5 encodeBool:self->_mandatesRecoveryKey forKey:@"_mandatesRecoveryKey"];
}

- (NSString)decodedRecoveryIdentityTokenString
{
  v2 = [(AKAccountRecoveryContext *)self encodedRecoveryIdentityToken];
  v3 = +[AKToken tokenWithBase64String:v2];
  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)decodedRecoveryPETString
{
  v2 = [(AKAccountRecoveryContext *)self encodedRecoveryPET];
  v3 = +[AKToken tokenWithBase64String:v2];
  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (BOOL)isValid
{
  v3 = [(AKAccountRecoveryContext *)self decodedRecoveryIdentityTokenString];

  id v4 = [(AKAccountRecoveryContext *)self decodedRecoveryPETString];

  id v5 = [(AKAccountRecoveryContext *)self authContext];
  uint64_t v6 = [v5 username];

  v7 = [(AKAccountRecoveryContext *)self recoveryContinuationURL];

  uint64_t v8 = [(AKAccountRecoveryContext *)self authContext];
  id v9 = [v8 altDSID];

  uint64_t v10 = [(AKAccountRecoveryContext *)self authContext];
  v11 = [v10 DSID];
  if (v3) {
    BOOL v12 = v4 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v17 = !v12 && v6 != 0 && v7 != 0 && v9 != 0 && v11 != 0;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsMasterKeyRecovery
{
  return self->_supportsMasterKeyRecovery;
}

- (void)setSupportsMasterKeyRecovery:(BOOL)a3
{
  self->_supportsMasterKeyRecovery = a3;
}

- (BOOL)mandatesRecoveryKey
{
  return self->_mandatesRecoveryKey;
}

- (void)setMandatesRecoveryKey:(BOOL)a3
{
  self->_mandatesRecoveryKey = a3;
}

- (NSString)encodedRecoveryIdentityToken
{
  return self->_encodedRecoveryIdentityToken;
}

- (void)setEncodedRecoveryIdentityToken:(id)a3
{
}

- (NSString)encodedRecoveryPET
{
  return self->_encodedRecoveryPET;
}

- (void)setEncodedRecoveryPET:(id)a3
{
}

- (NSURL)recoveryContinuationURL
{
  return self->_recoveryContinuationURL;
}

- (void)setRecoveryContinuationURL:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_recoveryContinuationURL, 0);
  objc_storeStrong((id *)&self->_encodedRecoveryPET, 0);

  objc_storeStrong((id *)&self->_encodedRecoveryIdentityToken, 0);
}

@end