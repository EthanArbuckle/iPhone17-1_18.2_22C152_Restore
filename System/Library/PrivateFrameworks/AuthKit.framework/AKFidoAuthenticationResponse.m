@interface AKFidoAuthenticationResponse
+ (BOOL)supportsSecureCoding;
- (AKFidoAuthenticationResponse)initWithAuthenticatorData:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientData:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9;
- (AKFidoAuthenticationResponse)initWithAuthenticatorDataString:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientDataString:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9;
- (AKFidoAuthenticationResponse)initWithCoder:(id)a3;
- (NSString)authenticatorData;
- (NSString)challenge;
- (NSString)clientData;
- (NSString)credentialID;
- (NSString)relyingPartyIdentifier;
- (NSString)signature;
- (NSString)userIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKFidoAuthenticationResponse

- (AKFidoAuthenticationResponse)initWithAuthenticatorData:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientData:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [a3 base64EncodedStringWithOptions:0];
  v22 = [v18 base64EncodedStringWithOptions:0];

  v23 = [v16 base64EncodedStringWithOptions:0];

  v24 = [v17 base64EncodedStringWithOptions:0];

  v25 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
  v26 = [(AKFidoAuthenticationResponse *)self initWithAuthenticatorDataString:v21 challengeString:v20 relyingPartyIdentifier:v19 signature:v22 clientDataString:v24 credentialID:v23 userIdentifier:v25];

  return v26;
}

- (AKFidoAuthenticationResponse)initWithAuthenticatorDataString:(id)a3 challengeString:(id)a4 relyingPartyIdentifier:(id)a5 signature:(id)a6 clientDataString:(id)a7 credentialID:(id)a8 userIdentifier:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)AKFidoAuthenticationResponse;
  id v18 = [(AKFidoAuthenticationResponse *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authenticatorData, a3);
    objc_storeStrong((id *)&v19->_signature, a6);
    objc_storeStrong((id *)&v19->_clientData, a7);
    objc_storeStrong((id *)&v19->_credentialID, a8);
    objc_storeStrong((id *)&v19->_userIdentifier, a9);
    objc_storeStrong((id *)&v19->_challenge, a4);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a5);
  }

  return v19;
}

- (AKFidoAuthenticationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authenticatorData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_signature"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientData"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_challenge"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relyingPartyIdentifier"];

  v12 = [(AKFidoAuthenticationResponse *)self initWithAuthenticatorDataString:v5 challengeString:v10 relyingPartyIdentifier:v11 signature:v6 clientDataString:v8 credentialID:v7 userIdentifier:v9];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  authenticatorData = self->_authenticatorData;
  id v5 = a3;
  [v5 encodeObject:authenticatorData forKey:@"_authenticatorData"];
  [v5 encodeObject:self->_signature forKey:@"_signature"];
  [v5 encodeObject:self->_credentialID forKey:@"_credentialName"];
  [v5 encodeObject:self->_clientData forKey:@"_clientData"];
  [v5 encodeObject:self->_userIdentifier forKey:@"_userIdentifier"];
  [v5 encodeObject:self->_challenge forKey:@"_challenge"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"_relyingPartyIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_authenticatorData copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_signature copy];
  v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_credentialID copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  uint64_t v11 = [(NSString *)self->_clientData copy];
  v12 = (void *)v4[1];
  v4[1] = v11;

  uint64_t v13 = [(NSString *)self->_userIdentifier copy];
  v14 = (void *)v4[3];
  v4[3] = v13;

  uint64_t v15 = [(NSString *)self->_challenge copy];
  id v16 = (void *)v4[4];
  v4[4] = v15;

  uint64_t v17 = [(NSString *)self->_relyingPartyIdentifier copy];
  id v18 = (void *)v4[5];
  v4[5] = v17;

  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\n\tAuthenticatorData: %@, \n\tSignature: %@, \n\tCredentialID: %@, \n\tClientData: %@, \n\tUserIdentifier: %@, \n\tChallenge: %@, \n\tRelyingPartyIdentifier: %@, \n}>", v5, self, self->_authenticatorData, self->_signature, self->_credentialID, self->_clientData, self->_userIdentifier, self->_challenge, self->_relyingPartyIdentifier];

  return v6;
}

- (NSString)clientData
{
  return self->_clientData;
}

- (NSString)credentialID
{
  return self->_credentialID;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)authenticatorData
{
  return self->_authenticatorData;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

@end