@interface AKFidoRegistrationResponse
+ (BOOL)supportsSecureCoding;
+ (id)_sanitizeCredentialIDString:(id)a3;
- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsData:(id)a4 credentialID:(id)a5 clientData:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9;
- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsDataString:(id)a4 credentialIDString:(id)a5 clientDataString:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9;
- (AKFidoRegistrationResponse)initWithCoder:(id)a3;
- (NSString)attestationsData;
- (NSString)challenge;
- (NSString)clientData;
- (NSString)credentialID;
- (NSString)credentialName;
- (NSString)relyingPartyIdentifier;
- (NSString)userIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKFidoRegistrationResponse

- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsData:(id)a4 credentialID:(id)a5 clientData:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9
{
  id v26 = a3;
  id v15 = a5;
  id v16 = a6;
  id v25 = a7;
  id v24 = a8;
  id v17 = a9;
  if (a4)
  {
    a4 = [a4 base64EncodedStringWithOptions:0];
  }
  v18 = [v15 base64EncodedStringWithOptions:0];
  v19 = +[AKFidoRegistrationResponse _sanitizeCredentialIDString:v18];

  v20 = [v16 base64EncodedStringWithOptions:0];
  v21 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
  v22 = [(AKFidoRegistrationResponse *)self initWithChallengeString:v26 attestationsDataString:a4 credentialIDString:v19 clientDataString:v20 relyingPartyIdentifier:v25 credentialName:v24 userIdentifier:v21];

  return v22;
}

- (AKFidoRegistrationResponse)initWithChallengeString:(id)a3 attestationsDataString:(id)a4 credentialIDString:(id)a5 clientDataString:(id)a6 relyingPartyIdentifier:(id)a7 credentialName:(id)a8 userIdentifier:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)AKFidoRegistrationResponse;
  v18 = [(AKFidoRegistrationResponse *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, a3);
    objc_storeStrong((id *)&v19->_attestationsData, a4);
    objc_storeStrong((id *)&v19->_credentialID, a5);
    objc_storeStrong((id *)&v19->_clientData, a6);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a7);
    objc_storeStrong((id *)&v19->_credentialName, a8);
    objc_storeStrong((id *)&v19->_userIdentifier, a9);
  }

  return v19;
}

- (AKFidoRegistrationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_challenge"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attestationsData"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientData"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relyingPartyIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialName"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIdentifier"];

  v12 = [(AKFidoRegistrationResponse *)self initWithChallengeString:v5 attestationsDataString:v6 credentialIDString:v7 clientDataString:v8 relyingPartyIdentifier:v9 credentialName:v10 userIdentifier:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  challenge = self->_challenge;
  id v5 = a3;
  [v5 encodeObject:challenge forKey:@"_challenge"];
  [v5 encodeObject:self->_attestationsData forKey:@"_attestationsData"];
  [v5 encodeObject:self->_credentialID forKey:@"_credentialID"];
  [v5 encodeObject:self->_clientData forKey:@"_clientData"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"_relyingPartyIdentifier"];
  [v5 encodeObject:self->_credentialName forKey:@"_credentialName"];
  [v5 encodeObject:self->_userIdentifier forKey:@"_userIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_challenge copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_attestationsData copy];
  v8 = (void *)v4[6];
  v4[6] = v7;

  uint64_t v9 = [(NSString *)self->_credentialID copy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  uint64_t v11 = [(NSString *)self->_clientData copy];
  v12 = (void *)v4[1];
  v4[1] = v11;

  uint64_t v13 = [(NSString *)self->_relyingPartyIdentifier copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSString *)self->_credentialName copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_userIdentifier copy];
  v18 = (void *)v4[3];
  v4[3] = v17;

  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\n\tChallenge: %@, \n\tAttestationsData: %@, \n\tCredentialID: %@, \n\tClientData: %@, \n\tRelyingPartyIdentifier: %@, \n\tCredentialName: %@, \n\tUserIdentifier: %@, \n}>", v5, self, self->_challenge, self->_attestationsData, self->_credentialID, self->_clientData, self->_relyingPartyIdentifier, self->_credentialName, self->_userIdentifier];

  return v6;
}

+ (id)_sanitizeCredentialIDString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"=", &stru_1EE40D360, 2, objc_msgSend(v3, "length") - 2, 2);

  return v4;
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

- (NSString)attestationsData
{
  return self->_attestationsData;
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_attestationsData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

@end