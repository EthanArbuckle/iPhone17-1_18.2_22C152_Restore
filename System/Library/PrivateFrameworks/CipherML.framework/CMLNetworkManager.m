@interface CMLNetworkManager
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNetworkManager:(id)a3;
- (BOOL)privacyProxyFailOpen;
- (CMLNetworkManager)initWithCoder:(id)a3;
- (CMLNetworkManager)initWithType:(int64_t)a3;
- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6;
- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6 privacyProxyFailOpen:(BOOL)a7;
- (NSData)authenticationToken;
- (NSURL)endpoint;
- (NSURL)issuer;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setPrivacyProxyFailOpen:(BOOL)a3;
@end

@implementation CMLNetworkManager

- (CMLNetworkManager)initWithType:(int64_t)a3
{
  return [(CMLNetworkManager *)self initWithType:a3 endpoint:0 issuer:0 authenticationToken:0];
}

- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6
{
  return [(CMLNetworkManager *)self initWithType:a3 endpoint:a4 issuer:a5 authenticationToken:a6 privacyProxyFailOpen:0];
}

- (CMLNetworkManager)initWithType:(int64_t)a3 endpoint:(id)a4 issuer:(id)a5 authenticationToken:(id)a6 privacyProxyFailOpen:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CMLNetworkManager;
  v15 = [(CMLNetworkManager *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    uint64_t v17 = [v12 copy];
    endpoint = v16->_endpoint;
    v16->_endpoint = (NSURL *)v17;

    uint64_t v19 = [v13 copy];
    issuer = v16->_issuer;
    v16->_issuer = (NSURL *)v19;

    uint64_t v21 = [v14 copy];
    authenticationToken = v16->_authenticationToken;
    v16->_authenticationToken = (NSData *)v21;

    v16->_privacyProxyFailOpen = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CMLNetworkManager *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CMLNetworkManager *)self isEqualToNetworkManager:v5];

  return v6;
}

- (BOOL)isEqualToNetworkManager:(id)a3
{
  id v4 = a3;
  v5 = [(CMLNetworkManager *)self endpoint];
  BOOL v6 = [v4 endpoint];
  if (v5 == v6)
  {
    int v10 = 0;
  }
  else
  {
    v7 = [(CMLNetworkManager *)self endpoint];
    v8 = [v4 endpoint];
    int v9 = [v7 isEqual:v8];

    int v10 = v9 ^ 1;
  }

  v11 = [(CMLNetworkManager *)self issuer];
  id v12 = [v4 issuer];
  if (v11 == v12)
  {
    int v16 = 0;
  }
  else
  {
    id v13 = [(CMLNetworkManager *)self issuer];
    id v14 = [v4 issuer];
    int v15 = [v13 isEqual:v14];

    int v16 = v15 ^ 1;
  }

  uint64_t v17 = [(CMLNetworkManager *)self authenticationToken];
  v18 = [v4 authenticationToken];
  if (v17 == v18)
  {
    char v21 = 1;
  }
  else
  {
    uint64_t v19 = [(CMLNetworkManager *)self authenticationToken];
    v20 = [v4 authenticationToken];
    char v21 = [v19 isEqual:v20];
  }
  BOOL v22 = [(CMLNetworkManager *)self privacyProxyFailOpen];
  char v23 = [v4 privacyProxyFailOpen];
  int64_t v24 = [(CMLNetworkManager *)self type];
  if (v24 == [v4 type]) {
    int v25 = v10;
  }
  else {
    int v25 = 1;
  }
  if ((v25 | v16)) {
    char v26 = 0;
  }
  else {
    char v26 = v21 & (v22 ^ v23 ^ 1);
  }

  return v26;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[CMLNetworkManager type](self, "type"));
  uint64_t v4 = [v3 hash];
  v5 = [(CMLNetworkManager *)self endpoint];
  uint64_t v6 = [v5 hash];
  v7 = [(CMLNetworkManager *)self issuer];
  uint64_t v8 = v6 ^ [v7 hash];
  int v9 = [(CMLNetworkManager *)self authenticationToken];
  uint64_t v10 = v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(CMLNetworkManager *)self privacyProxyFailOpen] ^ v4;

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMLNetworkManager)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuer"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
  uint64_t v9 = [v4 decodeBoolForKey:@"privacyProxyFailOpen"];

  uint64_t v10 = [(CMLNetworkManager *)self initWithType:v5 endpoint:v6 issuer:v7 authenticationToken:v8 privacyProxyFailOpen:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[CMLNetworkManager type](self, "type"), @"type");
  id v4 = [(CMLNetworkManager *)self endpoint];
  [v7 encodeObject:v4 forKey:@"endpoint"];

  uint64_t v5 = [(CMLNetworkManager *)self issuer];
  [v7 encodeObject:v5 forKey:@"issuer"];

  uint64_t v6 = [(CMLNetworkManager *)self authenticationToken];
  [v7 encodeObject:v6 forKey:@"authenticationToken"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CMLNetworkManager privacyProxyFailOpen](self, "privacyProxyFailOpen"), @"privacyProxyFailOpen");
}

- (int64_t)type
{
  return self->_type;
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (NSURL)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (NSData)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (BOOL)privacyProxyFailOpen
{
  return self->_privacyProxyFailOpen;
}

- (void)setPrivacyProxyFailOpen:(BOOL)a3
{
  self->_privacyProxyFailOpen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end