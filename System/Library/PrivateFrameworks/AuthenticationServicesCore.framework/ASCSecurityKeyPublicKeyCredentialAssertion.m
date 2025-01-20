@interface ASCSecurityKeyPublicKeyCredentialAssertion
+ (BOOL)supportsSecureCoding;
- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithCoder:(id)a3;
- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensionOutputsCBOR:(id)a9 attachment:(id)a10 appID:(BOOL)a11;
- (BOOL)appID;
- (NSData)authenticatorData;
- (NSData)credentialID;
- (NSData)extensionOutputsCBOR;
- (NSData)rawClientDataJSON;
- (NSData)signature;
- (NSData)userHandle;
- (NSString)attachment;
- (NSString)relyingPartyIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(BOOL)a3;
@end

@implementation ASCSecurityKeyPublicKeyCredentialAssertion

- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensionOutputsCBOR:(id)a9 attachment:(id)a10 appID:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)ASCSecurityKeyPublicKeyCredentialAssertion;
  v25 = [(ASCSecurityKeyPublicKeyCredentialAssertion *)&v44 init];
  if (v25)
  {
    uint64_t v26 = [v22 copy];
    credentialID = v25->_credentialID;
    v25->_credentialID = (NSData *)v26;

    uint64_t v28 = [v17 copy];
    relyingPartyIdentifier = v25->_relyingPartyIdentifier;
    v25->_relyingPartyIdentifier = (NSString *)v28;

    uint64_t v30 = [v18 copy];
    authenticatorData = v25->_authenticatorData;
    v25->_authenticatorData = (NSData *)v30;

    uint64_t v32 = [v19 copy];
    signature = v25->_signature;
    v25->_signature = (NSData *)v32;

    uint64_t v34 = [v20 copy];
    userHandle = v25->_userHandle;
    v25->_userHandle = (NSData *)v34;

    uint64_t v36 = [v21 copy];
    rawClientDataJSON = v25->_rawClientDataJSON;
    v25->_rawClientDataJSON = (NSData *)v36;

    uint64_t v38 = [v23 copy];
    extensionOutputsCBOR = v25->_extensionOutputsCBOR;
    v25->_extensionOutputsCBOR = (NSData *)v38;

    uint64_t v40 = [v24 copy];
    attachment = v25->_attachment;
    v25->_attachment = (NSString *)v40;

    v25->_appID = a11;
    v42 = v25;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensionOutputsCBOR = self->_extensionOutputsCBOR;
  id v5 = a3;
  [v5 encodeObject:extensionOutputsCBOR forKey:@"extensionOutputsCBOR"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_authenticatorData forKey:@"authenticatorData"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_userHandle forKey:@"userHandle"];
  [v5 encodeObject:self->_rawClientDataJSON forKey:@"rawClientDataJSON"];
  [v5 encodeObject:self->_credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_attachment forKey:@"attachment"];
  [v5 encodeBool:self->_appID forKey:@"appID"];
}

- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"authenticatorData"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userHandle"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawClientDataJSON"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensionOutputsCBOR"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attachment"];
  char v12 = [v3 decodeBoolForKey:@"appID"];

  LOBYTE(v15) = v12;
  v13 = [(ASCSecurityKeyPublicKeyCredentialAssertion *)self initWithRelyingPartyIdentifier:v4 authenticatorData:v5 signature:v6 userHandle:v7 rawClientDataJSON:v8 credentialID:v9 extensionOutputsCBOR:v10 attachment:v11 appID:v15];

  return v13;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)authenticatorData
{
  return self->_authenticatorData;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (NSString)attachment
{
  return self->_attachment;
}

- (BOOL)appID
{
  return self->_appID;
}

- (void)setAppID:(BOOL)a3
{
  self->_appID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensionOutputsCBOR, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end