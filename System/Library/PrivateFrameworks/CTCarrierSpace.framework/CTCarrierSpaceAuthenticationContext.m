@interface CTCarrierSpaceAuthenticationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsState;
- (CTCarrierSpaceAuthenticationContext)init;
- (CTCarrierSpaceAuthenticationContext)initWithCoder:(id)a3;
- (NSString)authURL;
- (NSString)carrierName;
- (NSString)clientID;
- (NSString)iccid;
- (NSString)scope;
- (NSString)sourceApplicationAccountIdentifier;
- (NSString)tokenURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthURL:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setClientID:(id)a3;
- (void)setIccid:(id)a3;
- (void)setScope:(id)a3;
- (void)setSourceApplicationAccountIdentifier:(id)a3;
- (void)setSupportsState:(BOOL)a3;
- (void)setTokenURL:(id)a3;
@end

@implementation CTCarrierSpaceAuthenticationContext

- (CTCarrierSpaceAuthenticationContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpaceAuthenticationContext;
  v2 = [(CTCarrierSpaceAuthenticationContext *)&v12 init];
  v3 = v2;
  if (v2)
  {
    clientID = v2->_clientID;
    v2->_clientID = 0;

    authURL = v3->_authURL;
    v3->_authURL = 0;

    tokenURL = v3->_tokenURL;
    v3->_tokenURL = 0;

    carrierName = v3->_carrierName;
    v3->_carrierName = 0;

    iccid = v3->_iccid;
    v3->_iccid = 0;

    scope = v3->_scope;
    v3->_scope = 0;

    v3->_supportsState = 0;
    sourceApplicationAccountIdentifier = v3->_sourceApplicationAccountIdentifier;
    v3->_sourceApplicationAccountIdentifier = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceAuthenticationContext *)self clientID];
  [v3 appendFormat:@" clientID=%@", v4];

  v5 = [(CTCarrierSpaceAuthenticationContext *)self authURL];
  [v3 appendFormat:@" authURL=%@", v5];

  v6 = [(CTCarrierSpaceAuthenticationContext *)self tokenURL];
  [v3 appendFormat:@" tokenURL=%@", v6];

  v7 = [(CTCarrierSpaceAuthenticationContext *)self carrierName];
  [v3 appendFormat:@" carrierName=%@", v7];

  v8 = [(CTCarrierSpaceAuthenticationContext *)self iccid];
  [v3 appendFormat:@" iccid=%@", v8];

  v9 = [(CTCarrierSpaceAuthenticationContext *)self scope];
  [v3 appendFormat:@" scope=%@", v9];

  objc_msgSend(v3, "appendFormat:", @" supportsState=%d", -[CTCarrierSpaceAuthenticationContext supportsState](self, "supportsState"));
  v10 = [(CTCarrierSpaceAuthenticationContext *)self sourceApplicationAccountIdentifier];
  [v3 appendFormat:@" sourceApplicationAccountIdentifier=%@", v10];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrierSpaceAuthenticationContext *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTCarrierSpaceAuthenticationContext *)self clientID];
      v6 = [(CTCarrierSpaceAuthenticationContext *)v4 clientID];
      if ([v5 isEqualToString:v6])
      {
        v7 = [(CTCarrierSpaceAuthenticationContext *)self authURL];
        v8 = [(CTCarrierSpaceAuthenticationContext *)v4 authURL];
        if ([v7 isEqualToString:v8])
        {
          v9 = [(CTCarrierSpaceAuthenticationContext *)self tokenURL];
          v10 = [(CTCarrierSpaceAuthenticationContext *)v4 tokenURL];
          if ([v9 isEqualToString:v10])
          {
            v11 = [(CTCarrierSpaceAuthenticationContext *)self carrierName];
            objc_super v12 = [(CTCarrierSpaceAuthenticationContext *)v4 carrierName];
            if ([v11 isEqualToString:v12])
            {
              v23 = v11;
              v13 = [(CTCarrierSpaceAuthenticationContext *)self iccid];
              v24 = [(CTCarrierSpaceAuthenticationContext *)v4 iccid];
              v25 = v13;
              if (objc_msgSend(v13, "isEqualToString:"))
              {
                v14 = [(CTCarrierSpaceAuthenticationContext *)self scope];
                v21 = [(CTCarrierSpaceAuthenticationContext *)v4 scope];
                v22 = v14;
                if (objc_msgSend(v14, "isEqualToString:"))
                {
                  BOOL v15 = [(CTCarrierSpaceAuthenticationContext *)self supportsState];
                  BOOL v16 = v15 == [(CTCarrierSpaceAuthenticationContext *)v4 supportsState];
                  v11 = v23;
                  if (v16)
                  {
                    v20 = [(CTCarrierSpaceAuthenticationContext *)self sourceApplicationAccountIdentifier];
                    v19 = [(CTCarrierSpaceAuthenticationContext *)v4 sourceApplicationAccountIdentifier];
                    char v17 = [v20 isEqualToString:v19];
                  }
                  else
                  {
                    char v17 = 0;
                  }
                }
                else
                {
                  char v17 = 0;
                  v11 = v23;
                }
              }
              else
              {
                char v17 = 0;
                v11 = v23;
              }
            }
            else
            {
              char v17 = 0;
            }
          }
          else
          {
            char v17 = 0;
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  [v5 encodeObject:clientID forKey:@"client_id"];
  [v5 encodeObject:self->_authURL forKey:@"auth_url"];
  [v5 encodeObject:self->_tokenURL forKey:@"token_url"];
  [v5 encodeObject:self->_carrierName forKey:@"carrier_name"];
  [v5 encodeObject:self->_iccid forKey:@"iccid"];
  [v5 encodeObject:self->_scope forKey:@"scope"];
  [v5 encodeBool:self->_supportsState forKey:@"supports_state"];
  [v5 encodeObject:self->_sourceApplicationAccountIdentifier forKey:@"account_identifier"];
}

- (CTCarrierSpaceAuthenticationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CTCarrierSpaceAuthenticationContext;
  id v5 = [(CTCarrierSpaceAuthenticationContext *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client_id"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auth_url"];
    authURL = v5->_authURL;
    v5->_authURL = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token_url"];
    tokenURL = v5->_tokenURL;
    v5->_tokenURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrier_name"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v12;

    v5->_supportsState = [v4 decodeBoolForKey:@"supports_state"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scope"];
    scope = v5->_scope;
    v5->_scope = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account_identifier"];
    sourceApplicationAccountIdentifier = v5->_sourceApplicationAccountIdentifier;
    v5->_sourceApplicationAccountIdentifier = (NSString *)v18;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)authURL
{
  return self->_authURL;
}

- (void)setAuthURL:(id)a3
{
}

- (NSString)tokenURL
{
  return self->_tokenURL;
}

- (void)setTokenURL:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
}

- (BOOL)supportsState
{
  return self->_supportsState;
}

- (void)setSupportsState:(BOOL)a3
{
  self->_supportsState = a3;
}

- (NSString)sourceApplicationAccountIdentifier
{
  return self->_sourceApplicationAccountIdentifier;
}

- (void)setSourceApplicationAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
  objc_storeStrong((id *)&self->_authURL, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end