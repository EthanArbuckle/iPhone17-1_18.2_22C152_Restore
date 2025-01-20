@interface AKAuthorization
+ (BOOL)supportsSecureCoding;
- (AKAuthorization)initWithCoder:(id)a3;
- (AKCredential)credential;
- (AKCredentialRequestProtocol)authorizedRequest;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizedRequest:(id)a3;
- (void)setCredential:(id)a3;
@end

@implementation AKAuthorization

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKAuthorization *)self authorizedRequest];
  [v4 encodeObject:v5 forKey:@"_authorizedRequest"];

  id v6 = [(AKAuthorization *)self credential];
  [v4 encodeObject:v6 forKey:@"_credential"];
}

- (AKAuthorization)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AKAuthorization;
  v5 = [(AKAuthorization *)&v24 init];
  if (v5)
  {
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v23, "setWithObjects:", v22, v21, v20, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_authorizedRequest"];
    authorizedRequest = v5->_authorizedRequest;
    v5->_authorizedRequest = (AKCredentialRequestProtocol *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v14 forKey:@"_credential"];
    credential = v5->_credential;
    v5->_credential = (AKCredential *)v17;
  }
  return v5;
}

- (void)setAuthorizedRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 _sanitizedCopy];

    id v4 = (id)v5;
  }
  authorizedRequest = self->_authorizedRequest;
  self->_authorizedRequest = (AKCredentialRequestProtocol *)v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p {\nAuthorized request: %@\nCredential: %@\n}", v5, self, self->_authorizedRequest, self->_credential];

  return v6;
}

- (AKCredentialRequestProtocol)authorizedRequest
{
  return self->_authorizedRequest;
}

- (AKCredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);

  objc_storeStrong((id *)&self->_authorizedRequest, 0);
}

@end