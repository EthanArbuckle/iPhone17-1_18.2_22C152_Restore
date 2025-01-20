@interface AKAppleIDPasskeyCredential
+ (BOOL)supportsSecureCoding;
- (AKAppleIDPasskeyCredential)initWithCoder:(id)a3;
- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationData:(id)a4 clientData:(id)a5 credentialID:(id)a6 originalChallenge:(id)a7 userID:(id)a8 credentialName:(id)a9;
- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationDataString:(id)a4 clientDataString:(id)a5 credentialIDString:(id)a6 userIDString:(id)a7 originalChallengeString:(id)a8 credentialName:(id)a9;
- (NSString)attestationDataString;
- (NSString)clientDataString;
- (NSString)credentialIDString;
- (NSString)credentialName;
- (NSString)originalChallengeString;
- (NSString)relyingPartyIdentifier;
- (NSString)userIDString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestationDataString:(id)a3;
- (void)setClientDataString:(id)a3;
- (void)setCredentialIDString:(id)a3;
- (void)setCredentialName:(id)a3;
- (void)setOriginalChallengeString:(id)a3;
- (void)setRelyingPartyIdentifier:(id)a3;
- (void)setUserIDString:(id)a3;
@end

@implementation AKAppleIDPasskeyCredential

- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationDataString:(id)a4 clientDataString:(id)a5 credentialIDString:(id)a6 userIDString:(id)a7 originalChallengeString:(id)a8 credentialName:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)AKAppleIDPasskeyCredential;
  v18 = [(AKAppleIDPasskeyCredential *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_relyingPartyIdentifier, a3);
    objc_storeStrong((id *)&v19->_attestationDataString, a4);
    objc_storeStrong((id *)&v19->_clientDataString, a5);
    objc_storeStrong((id *)&v19->_credentialIDString, a6);
    objc_storeStrong((id *)&v19->_userIDString, a7);
    objc_storeStrong((id *)&v19->_originalChallengeString, a8);
    objc_storeStrong((id *)&v19->_credentialName, a9);
  }

  return v19;
}

- (AKAppleIDPasskeyCredential)initWithRelyingPartyIdentifier:(id)a3 attestationData:(id)a4 clientData:(id)a5 credentialID:(id)a6 originalChallenge:(id)a7 userID:(id)a8 credentialName:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = [a4 base64EncodedStringWithOptions:0];
  id v22 = [v19 base64EncodedStringWithOptions:0];

  id v23 = [v18 base64EncodedStringWithOptions:0];

  id v24 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
  id v25 = [(AKAppleIDPasskeyCredential *)self initWithRelyingPartyIdentifier:v20 attestationDataString:v21 clientDataString:v22 credentialIDString:v23 userIDString:v24 originalChallengeString:v17 credentialName:v15];

  return v25;
}

- (AKAppleIDPasskeyCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relyingPartyIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attestationDataString"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientDataString"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialIDString"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIDString"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalChallengeString"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialName"];

  v12 = [(AKAppleIDPasskeyCredential *)self initWithRelyingPartyIdentifier:v5 attestationDataString:v6 clientDataString:v7 credentialIDString:v8 userIDString:v9 originalChallengeString:v10 credentialName:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  id v5 = a3;
  [v5 encodeObject:relyingPartyIdentifier forKey:@"_relyingPartyIdentifier"];
  [v5 encodeObject:self->_attestationDataString forKey:@"_attestationDataString"];
  [v5 encodeObject:self->_clientDataString forKey:@"_clientDataString"];
  [v5 encodeObject:self->_credentialIDString forKey:@"_credentialIDString"];
  [v5 encodeObject:self->_userIDString forKey:@"_userIDString"];
  [v5 encodeObject:self->_originalChallengeString forKey:@"_originalChallengeString"];
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

  uint64_t v7 = [(NSString *)self->_attestationDataString copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_clientDataString copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_credentialIDString copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSString *)self->_userIDString copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSString *)self->_originalChallengeString copy];
  id v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [(NSString *)self->_credentialName copy];
  id v18 = (void *)v4[7];
  v4[7] = v17;

  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\n\trelyingPartyIdentifier: %@, \n\tattestationDataString: %@, \n\tclientDataString: %@, \n\tcredentialIDString: %@, \n\tuserIDString: %@, \n\toriginalChallengeString: %@, \n\tcredentialName: %@, \n}>", v5, self, self->_relyingPartyIdentifier, self->_attestationDataString, self->_clientDataString, self->_credentialIDString, self->_userIDString, self->_originalChallengeString, self->_credentialIDString];

  return v6;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
}

- (NSString)attestationDataString
{
  return self->_attestationDataString;
}

- (void)setAttestationDataString:(id)a3
{
}

- (NSString)clientDataString
{
  return self->_clientDataString;
}

- (void)setClientDataString:(id)a3
{
}

- (NSString)credentialIDString
{
  return self->_credentialIDString;
}

- (void)setCredentialIDString:(id)a3
{
}

- (NSString)userIDString
{
  return self->_userIDString;
}

- (void)setUserIDString:(id)a3
{
}

- (NSString)originalChallengeString
{
  return self->_originalChallengeString;
}

- (void)setOriginalChallengeString:(id)a3
{
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void)setCredentialName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_originalChallengeString, 0);
  objc_storeStrong((id *)&self->_userIDString, 0);
  objc_storeStrong((id *)&self->_credentialIDString, 0);
  objc_storeStrong((id *)&self->_clientDataString, 0);
  objc_storeStrong((id *)&self->_attestationDataString, 0);

  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end