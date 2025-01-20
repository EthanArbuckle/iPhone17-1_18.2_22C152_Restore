@interface AKAppleIDPasskeyCredentialRequestContext
+ (BOOL)supportsSecureCoding;
- (AKAppleIDPasskeyCredentialRequestContext)initWithCoder:(id)a3;
- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challenge:(id)a4 originalChallenge:(id)a5 userID:(id)a6 credentialName:(id)a7;
- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challengeString:(id)a4 userIDString:(id)a5 credentialName:(id)a6;
- (NSData)challenge;
- (NSData)userID;
- (NSString)credentialName;
- (NSString)originalChallenge;
- (NSString)relyingPartyIdentifier;
- (id)_sanitizeBase64EncodedString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCredentialName:(id)a3;
- (void)setOriginalChallenge:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation AKAppleIDPasskeyCredentialRequestContext

- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challenge:(id)a4 originalChallenge:(id)a5 userID:(id)a6 credentialName:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)AKAppleIDPasskeyCredentialRequestContext;
  v17 = [(AKAppleIDPasskeyCredentialRequestContext *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_relyingPartyIdentifier, a3);
    objc_storeStrong((id *)&v18->_challenge, a4);
    objc_storeStrong((id *)&v18->_originalChallenge, a5);
    objc_storeStrong((id *)&v18->_userID, a6);
    objc_storeStrong((id *)&v18->_credentialName, a7);
  }

  return v18;
}

- (AKAppleIDPasskeyCredentialRequestContext)initWithRelyingPartyIdentifier:(id)a3 challengeString:(id)a4 userIDString:(id)a5 credentialName:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AKAppleIDPasskeyCredentialRequestContext *)self _sanitizeBase64EncodedString:v12];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:4];
  if (!v15)
  {
    id v15 = [v14 dataUsingEncoding:4];
  }
  id v16 = [v10 dataUsingEncoding:4];
  v17 = [(AKAppleIDPasskeyCredentialRequestContext *)self initWithRelyingPartyIdentifier:v13 challenge:v15 originalChallenge:v12 userID:v16 credentialName:v11];

  return v17;
}

- (AKAppleIDPasskeyCredentialRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relyingPartyIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_challenge"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalChallenge"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userID"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialName"];

  id v10 = [(AKAppleIDPasskeyCredentialRequestContext *)self initWithRelyingPartyIdentifier:v5 challenge:v6 originalChallenge:v7 userID:v8 credentialName:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  id v5 = a3;
  [v5 encodeObject:relyingPartyIdentifier forKey:@"_relyingPartyIdentifier"];
  [v5 encodeObject:self->_challenge forKey:@"_challenge"];
  [v5 encodeObject:self->_challenge forKey:@"_originalChallenge"];
  [v5 encodeObject:self->_userID forKey:@"_userID"];
  [v5 encodeObject:self->_credentialName forKey:@"_credentialName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_relyingPartyIdentifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSData *)self->_challenge copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_originalChallenge copy];
  id v10 = (void *)v4[5];
  v4[5] = v9;

  uint64_t v11 = [(NSData *)self->_userID copy];
  id v12 = (void *)v4[3];
  v4[3] = v11;

  uint64_t v13 = [(NSString *)self->_credentialName copy];
  id v14 = (void *)v4[4];
  v4[4] = v13;

  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\n\trelyingPartyIdentifier: %@, \n\tchallenge: %@, \n\toriginalChallenge: %@, \n\tuserID: %@, \n\tcredentialName: %@, \n}>", v5, self, self->_relyingPartyIdentifier, self->_challenge, self->_originalChallenge, self->_userID, self->_credentialName];

  return v6;
}

- (id)_sanitizeBase64EncodedString:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

  if (([v4 length] & 3) != 0)
  {
    do
    {
      uint64_t v5 = [v4 stringByAppendingString:@"="];

      id v4 = v5;
    }
    while (([v5 length] & 3) != 0);
  }
  else
  {
    uint64_t v5 = v4;
  }

  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSData)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void)setCredentialName:(id)a3
{
}

- (NSString)originalChallenge
{
  return self->_originalChallenge;
}

- (void)setOriginalChallenge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChallenge, 0);
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_challenge, 0);

  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end