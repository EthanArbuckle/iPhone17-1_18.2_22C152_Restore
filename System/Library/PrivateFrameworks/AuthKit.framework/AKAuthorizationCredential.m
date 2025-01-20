@interface AKAuthorizationCredential
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationCredential)init;
- (AKAuthorizationCredential)initWithCoder:(id)a3;
- (AKAuthorizationCredential)initWithServerResponse:(id)a3;
- (AKUserInformation)userInformation;
- (BOOL)isLikelyRealUser;
- (NSArray)authorizedScopes;
- (NSData)authorizationCode;
- (NSData)identityToken;
- (NSString)description;
- (NSString)state;
- (NSString)transactionID;
- (NSString)userIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationCode:(id)a3;
- (void)setAuthorizedScopes:(id)a3;
- (void)setIdentityToken:(id)a3;
- (void)setIsLikelyRealUser:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setUserInformation:(id)a3;
@end

@implementation AKAuthorizationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationCredential)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationCredential;
  return [(AKAuthorizationCredential *)&v3 init];
}

- (AKAuthorizationCredential)initWithServerResponse:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AKAuthorizationCredential;
  v5 = [(AKAuthorizationCredential *)&v39 init];
  if (v5)
  {
    v6 = _AKLogSiwa();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 serverProvidedData];
      *(_DWORD *)buf = 138412290;
      v41 = v7;
      _os_log_impl(&dword_193494000, v6, OS_LOG_TYPE_DEFAULT, "Parsing server provided Data %@", buf, 0xCu);
    }
    v8 = [v4 serverProvidedData];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"uid"];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v9;

    v11 = [v4 serviceTokens];
    v12 = [v11 objectForKeyedSubscript:@"IDToken"];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 stringValue];
      uint64_t v15 = [v14 dataUsingEncoding:4];
      identityToken = v5->_identityToken;
      v5->_identityToken = (NSData *)v15;
    }
    v17 = [v11 objectForKeyedSubscript:@"authCode"];
    v18 = v17;
    if (v17)
    {
      v19 = [v17 stringValue];
      uint64_t v20 = [v19 dataUsingEncoding:4];
      authorizationCode = v5->_authorizationCode;
      v5->_authorizationCode = (NSData *)v20;
    }
    v22 = [v8 objectForKeyedSubscript:@"apd"];
    uint64_t v23 = [v22 objectForKeyedSubscript:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v23;

    v25 = [v8 objectForKeyedSubscript:@"isLikelyRealUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_isLikelyRealUser = [v25 integerValue] == 1;
    }
    uint64_t v26 = [v8 objectForKeyedSubscript:@"scopes"];
    authorizedScopes = v5->_authorizedScopes;
    v5->_authorizedScopes = (NSArray *)v26;

    uint64_t v28 = [v4 transactionId];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v28;

    v30 = _AKLogSiwa();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[AKAuthorizationCredential initWithServerResponse:](v4, v30);
    }

    v31 = objc_alloc_init(AKUserInformation);
    userInformation = v5->_userInformation;
    v5->_userInformation = v31;

    v33 = [v4 privateEmail];
    [(AKUserInformation *)v5->_userInformation setSelectedEmail:v33];

    objc_opt_class();
    id v34 = [v8 objectForKeyedSubscript:@"webAccessEnabled"];
    if (objc_opt_isKindOfClass()) {
      id v35 = v34;
    }
    else {
      id v35 = 0;
    }

    [(AKUserInformation *)v5->_userInformation setWebAccessEnabled:v35];
    objc_opt_class();
    id v36 = [v8 objectForKeyedSubscript:@"serverExperimentalFeatures"];
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }

    [(AKUserInformation *)v5->_userInformation setServerExperimentalFeatures:v37];
  }

  return v5;
}

- (AKAuthorizationCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AKAuthorizationCredential;
  v5 = [(AKAuthorizationCredential *)&v26 init];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKUserIdentifier"];
  userIdentifier = v5->_userIdentifier;
  v5->_userIdentifier = (NSString *)v6;

  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"AKAuthorizedScopes"];
  authorizedScopes = v5->_authorizedScopes;
  v5->_authorizedScopes = (NSArray *)v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKUserInformation"];
  userInformation = v5->_userInformation;
  v5->_userInformation = (AKUserInformation *)v13;

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKAuthorizationCode"];
  authorizationCode = v5->_authorizationCode;
  v5->_authorizationCode = (NSData *)v15;

  uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AKIdentityToken"];
  identityToken = v5->_identityToken;
  v5->_identityToken = (NSData *)v17;

  uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_state"];
  state = v5->_state;
  v5->_state = (NSString *)v19;

  v5->_isLikelyRealUser = [v4 decodeBoolForKey:@"_isLikelyRealUser"];
  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionID"];
  transactionID = v5->_transactionID;
  v5->_transactionID = (NSString *)v21;

  if (!v5->_userIdentifier)
  {
    v24 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7044);
    [v4 failWithError:v24];

    uint64_t v23 = 0;
  }
  else
  {
LABEL_3:
    uint64_t v23 = v5;
  }

  return v23;
}

- (NSString)description
{
  objc_super v3 = NSString;
  userIdentifier = self->_userIdentifier;
  identityToken = self->_identityToken;
  authorizationCode = self->_authorizationCode;
  v7 = [NSNumber numberWithBool:self->_isLikelyRealUser];
  v8 = [v3 stringWithFormat:@"Authorization Credential:\n UID: %@ \n Identity Token: %@ \n AuthorizationCode: %@ \n User Verification Result: %@ \n User Info: %@ /n Transaction ID: %@", userIdentifier, identityToken, authorizationCode, v7, self->_userInformation, self->_transactionID];

  return (NSString *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentifier = self->_userIdentifier;
  id v5 = a3;
  [v5 encodeObject:userIdentifier forKey:@"AKUserIdentifier"];
  [v5 encodeObject:self->_authorizedScopes forKey:@"AKAuthorizedScopes"];
  [v5 encodeObject:self->_userInformation forKey:@"AKUserInformation"];
  [v5 encodeObject:self->_authorizationCode forKey:@"AKAuthorizationCode"];
  [v5 encodeObject:self->_identityToken forKey:@"AKIdentityToken"];
  [v5 encodeObject:self->_state forKey:@"_state"];
  [v5 encodeBool:self->_isLikelyRealUser forKey:@"_isLikelyRealUser"];
  [v5 encodeObject:self->_transactionID forKey:@"_transactionID"];
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSArray)authorizedScopes
{
  return self->_authorizedScopes;
}

- (void)setAuthorizedScopes:(id)a3
{
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (void)setIdentityToken:(id)a3
{
}

- (NSData)authorizationCode
{
  return self->_authorizationCode;
}

- (void)setAuthorizationCode:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (BOOL)isLikelyRealUser
{
  return self->_isLikelyRealUser;
}

- (void)setIsLikelyRealUser:(BOOL)a3
{
  self->_isLikelyRealUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_authorizationCode, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_authorizedScopes, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

- (void)initWithServerResponse:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a1 transactionId];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_193494000, a2, OS_LOG_TYPE_DEBUG, "AKAuthorizationCredential Successfully created with transaction id:%@", (uint8_t *)&v4, 0xCu);
}

@end