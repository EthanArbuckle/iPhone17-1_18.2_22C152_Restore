@interface FKAuthorizationConsent
- (BOOL)isEqual:(id)a3;
- (FKAuthorizationConsent)initWithConsentId:(id)a3 token:(id)a4 authorizationURI:(id)a5 extensionPayload:(id)a6;
- (NSDictionary)extensionPayload;
- (NSString)authorizationURI;
- (NSString)consentId;
- (NSString)token;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKAuthorizationConsent

- (FKAuthorizationConsent)initWithConsentId:(id)a3 token:(id)a4 authorizationURI:(id)a5 extensionPayload:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKAuthorizationConsent;
  v14 = [(FKAuthorizationConsent *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    consentId = v14->_consentId;
    v14->_consentId = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    token = v14->_token;
    v14->_token = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    authorizationURI = v14->_authorizationURI;
    v14->_authorizationURI = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    extensionPayload = v14->_extensionPayload;
    v14->_extensionPayload = (NSDictionary *)v21;
  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKAuthorizationConsent);
  uint64_t v6 = [(NSString *)self->_consentId copyWithZone:a3];
  consentId = v5->_consentId;
  v5->_consentId = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_token copyWithZone:a3];
  token = v5->_token;
  v5->_token = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_authorizationURI copyWithZone:a3];
  authorizationURI = v5->_authorizationURI;
  v5->_authorizationURI = (NSString *)v10;

  uint64_t v12 = [(NSDictionary *)self->_extensionPayload copyWithZone:a3];
  extensionPayload = v5->_extensionPayload;
  v5->_extensionPayload = (NSDictionary *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_consentId];
  [v3 safelyAddObject:self->_token];
  [v3 safelyAddObject:self->_authorizationURI];
  [v3 safelyAddObject:self->_extensionPayload];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKAuthorizationConsent *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_consentId, v6[1])
      && FKEqualObjects(self->_token, v6[2])
      && FKEqualObjects(self->_authorizationURI, v6[3]))
    {
      char v7 = FKEqualObjects(self->_extensionPayload, v6[4]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)consentId
{
  return self->_consentId;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)authorizationURI
{
  return self->_authorizationURI;
}

- (NSDictionary)extensionPayload
{
  return self->_extensionPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_authorizationURI, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_consentId, 0);
}

@end