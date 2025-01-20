@interface ASCPlatformPublicKeyCredentialAssertion
+ (BOOL)supportsSecureCoding;
- (ASCPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3;
- (ASCPlatformPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensions:(id)a9 attachment:(id)a10 isExternal:(BOOL)a11;
- (BOOL)isExternal;
- (NSData)authenticatorData;
- (NSData)credentialID;
- (NSData)rawClientDataJSON;
- (NSData)signature;
- (NSData)userHandle;
- (NSString)attachment;
- (NSString)relyingPartyIdentifier;
- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)extensions;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setRawClientDataJSON:(id)a3;
@end

@implementation ASCPlatformPublicKeyCredentialAssertion

- (ASCPlatformPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensions:(id)a9 attachment:(id)a10 isExternal:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  v42.receiver = self;
  v42.super_class = (Class)ASCPlatformPublicKeyCredentialAssertion;
  v25 = [(ASCPlatformPublicKeyCredentialAssertion *)&v42 init];
  if (v25)
  {
    uint64_t v26 = [v22 copy];
    credentialID = v25->_credentialID;
    v25->_credentialID = (NSData *)v26;

    uint64_t v28 = [v21 copy];
    rawClientDataJSON = v25->_rawClientDataJSON;
    v25->_rawClientDataJSON = (NSData *)v28;

    uint64_t v30 = [v17 copy];
    relyingPartyIdentifier = v25->_relyingPartyIdentifier;
    v25->_relyingPartyIdentifier = (NSString *)v30;

    uint64_t v32 = [v18 copy];
    authenticatorData = v25->_authenticatorData;
    v25->_authenticatorData = (NSData *)v32;

    uint64_t v34 = [v19 copy];
    signature = v25->_signature;
    v25->_signature = (NSData *)v34;

    uint64_t v36 = [v20 copy];
    userHandle = v25->_userHandle;
    v25->_userHandle = (NSData *)v36;

    objc_storeStrong((id *)&v25->_extensions, a9);
    uint64_t v38 = [v24 copy];
    attachment = v25->_attachment;
    v25->_attachment = (NSString *)v38;

    v25->_isExternal = a11;
    v40 = v25;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensions = self->_extensions;
  id v5 = a3;
  [v5 encodeObject:extensions forKey:@"extensions"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_authenticatorData forKey:@"authenticatorData"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_userHandle forKey:@"userHandle"];
  [v5 encodeObject:self->_rawClientDataJSON forKey:@"rawClientDataJSON"];
  [v5 encodeObject:self->_credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_attachment forKey:@"attachment"];
  [v5 encodeBool:self->_isExternal forKey:@"isExternal"];
}

- (ASCPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"authenticatorData"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userHandle"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawClientDataJSON"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensions"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attachment"];
  char v12 = [v3 decodeBoolForKey:@"isExternal"];

  LOBYTE(v15) = v12;
  v13 = [(ASCPlatformPublicKeyCredentialAssertion *)self initWithRelyingPartyIdentifier:v4 authenticatorData:v5 signature:v6 userHandle:v7 rawClientDataJSON:v8 credentialID:v9 extensions:v10 attachment:v11 isExternal:v15];

  return v13;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (void)setRawClientDataJSON:(id)a3
{
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

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (NSString)attachment
{
  return self->_attachment;
}

- (BOOL)isExternal
{
  return self->_isExternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);

  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end