@interface CPSAppSignInResponse
+ (BOOL)supportsSecureCoding;
- (AKAuthorization)appleIDAuthorization;
- (AKAuthorization)authorization;
- (ASAuthorizationCredential)credential;
- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion;
- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration;
- (CASPasswordCredential)passwordCredential;
- (CPSAppSignInResponse)initWithAppleIDAuthorization:(id)a3;
- (CPSAppSignInResponse)initWithCoder:(id)a3;
- (CPSAppSignInResponse)initWithPasswordCredential:(id)a3;
- (CPSAppSignInResponse)initWithPlatformKeyCredentialAssertion:(id)a3;
- (CPSAppSignInResponse)initWithPlatformKeyCredentialRegistration:(id)a3;
- (CPSAppSignInResponse)initWithWebCallbackURL:(id)a3;
- (NSURL)webCallbackURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSAppSignInResponse

- (CPSAppSignInResponse)initWithAppleIDAuthorization:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = [(CPSAppSignInResponse *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_appleIDAuthorization, a3);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"appleIDAuthorization != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSAppSignInResponse initWithAppleIDAuthorization:]();
    }
    [v10 UTF8String];
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPasswordCredential:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = [(CPSAppSignInResponse *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_passwordCredential, a3);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"passwordCredential != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSAppSignInResponse initWithPasswordCredential:]();
    }
    [v10 UTF8String];
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithWebCallbackURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = [(CPSAppSignInResponse *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_webCallbackURL, a3);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"webCallbackURL != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSAppSignInResponse initWithWebCallbackURL:]();
    }
    [v10 UTF8String];
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPlatformKeyCredentialAssertion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = [(CPSAppSignInResponse *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_platformKeyCredentialAssertion, a3);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"platformKeyCredentialAssertion != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSAppSignInResponse initWithPlatformKeyCredentialAssertion:]();
    }
    [v10 UTF8String];
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (CPSAppSignInResponse)initWithPlatformKeyCredentialRegistration:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v11.receiver = self;
    v11.super_class = (Class)CPSAppSignInResponse;
    v7 = [(CPSAppSignInResponse *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_platformKeyCredentialRegistration, a3);
    }

    return v8;
  }
  else
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"platformKeyCredentialRegistration != ((void *)0)"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[CPSAppSignInResponse initWithPlatformKeyCredentialRegistration:]();
    }
    [v10 UTF8String];
    result = (CPSAppSignInResponse *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_appleIDAuthorization withName:@"appleIDAuthorization" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_passwordCredential withName:@"passwordCredential" skipIfNil:1];
  if (self->_webCallbackURL)
  {
    v6 = CUPrintNSObjectMasked();
    [v3 appendString:v6 withName:@"webCallbackURL"];
  }
  id v7 = (id)[v3 appendObject:self->_platformKeyCredentialAssertion withName:@"platformKeyCredentialAssertion" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_platformKeyCredentialRegistration withName:@"platformKeyCredentialRegistration" skipIfNil:1];
  v9 = [v3 build];

  return v9;
}

- (AKAuthorization)authorization
{
  return self->_appleIDAuthorization;
}

- (ASAuthorizationCredential)credential
{
  if (self->_passwordCredential)
  {
    id ASPasswordCredentialClass = getASPasswordCredentialClass();
    id v4 = [(CASPasswordCredential *)self->_passwordCredential user];
    id v5 = [(CASPasswordCredential *)self->_passwordCredential password];
    v6 = [ASPasswordCredentialClass credentialWithUser:v4 password:v5];
  }
  else
  {
    v6 = 0;
  }
  return (ASAuthorizationCredential *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSAppSignInResponse)initWithCoder:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"appleIDAuthorization"];

  if (v6)
  {
    self = [(CPSAppSignInResponse *)self initWithAppleIDAuthorization:v6];
    id v7 = self;
  }
  else
  {
    id v8 = self;
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"passwordCredential"];

    if (v9)
    {
      self = [(CPSAppSignInResponse *)self initWithPasswordCredential:v9];
      id v7 = self;
    }
    else
    {
      v10 = self;
      objc_super v11 = [v4 decodeObjectOfClass:v10 forKey:@"webCallbackURL"];

      if (v11)
      {
        self = [(CPSAppSignInResponse *)self initWithWebCallbackURL:v11];
        id v7 = self;
      }
      else
      {
        v12 = self;
        v13 = [v4 decodeObjectOfClass:v12 forKey:@"platformKeyCredentialAssertion"];

        if (v13)
        {
          self = [(CPSAppSignInResponse *)self initWithPlatformKeyCredentialAssertion:v13];
          id v7 = self;
        }
        else
        {
          v14 = self;
          v15 = [v4 decodeObjectOfClass:v14 forKey:@"platformKeyCredentialRegistration"];

          if (v15)
          {
            self = [(CPSAppSignInResponse *)self initWithPlatformKeyCredentialRegistration:v15];
            id v7 = self;
          }
          else
          {
            v16 = (void *)MEMORY[0x263F087E8];
            uint64_t v17 = *MEMORY[0x263F07F70];
            uint64_t v21 = *MEMORY[0x263F08338];
            v22[0] = @"Failed to decode CPSAppSignInResponse: missing credential values";
            v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
            v19 = [v16 errorWithDomain:v17 code:4865 userInfo:v18];
            [v4 failWithError:v19];

            id v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  appleIDAuthorization = self->_appleIDAuthorization;
  id v5 = a3;
  [v5 encodeObject:appleIDAuthorization forKey:@"appleIDAuthorization"];
  [v5 encodeObject:self->_passwordCredential forKey:@"passwordCredential"];
  [v5 encodeObject:self->_webCallbackURL forKey:@"webCallbackURL"];
  [v5 encodeObject:self->_platformKeyCredentialAssertion forKey:@"platformKeyCredentialAssertion"];
  [v5 encodeObject:self->_platformKeyCredentialRegistration forKey:@"platformKeyCredentialRegistration"];
}

- (NSURL)webCallbackURL
{
  return self->_webCallbackURL;
}

- (ASCPlatformPublicKeyCredentialAssertion)platformKeyCredentialAssertion
{
  return self->_platformKeyCredentialAssertion;
}

- (ASCPlatformPublicKeyCredentialRegistration)platformKeyCredentialRegistration
{
  return self->_platformKeyCredentialRegistration;
}

- (AKAuthorization)appleIDAuthorization
{
  return self->_appleIDAuthorization;
}

- (CASPasswordCredential)passwordCredential
{
  return self->_passwordCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordCredential, 0);
  objc_storeStrong((id *)&self->_appleIDAuthorization, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialRegistration, 0);
  objc_storeStrong((id *)&self->_platformKeyCredentialAssertion, 0);
  objc_storeStrong((id *)&self->_webCallbackURL, 0);
}

- (void)initWithAppleIDAuthorization:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPasswordCredential:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithWebCallbackURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPlatformKeyCredentialAssertion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPlatformKeyCredentialRegistration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_24A684000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end