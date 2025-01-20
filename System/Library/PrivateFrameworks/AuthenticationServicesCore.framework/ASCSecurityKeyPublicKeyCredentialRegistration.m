@interface ASCSecurityKeyPublicKeyCredentialRegistration
+ (BOOL)supportsSecureCoding;
- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3;
- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensionOutputsCBOR:(id)a8 attachment:(id)a9;
- (NSArray)transports;
- (NSData)attestationObject;
- (NSData)credentialID;
- (NSData)extensionOutputsCBOR;
- (NSData)rawClientDataJSON;
- (NSString)attachment;
- (NSString)relyingPartyIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionOutputsCBOR:(id)a3;
@end

@implementation ASCSecurityKeyPublicKeyCredentialRegistration

- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensionOutputsCBOR:(id)a8 attachment:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v37.receiver = self;
  v37.super_class = (Class)ASCSecurityKeyPublicKeyCredentialRegistration;
  v22 = [(ASCSecurityKeyPublicKeyCredentialRegistration *)&v37 init];
  if (v22)
  {
    uint64_t v23 = [v18 copy];
    credentialID = v22->_credentialID;
    v22->_credentialID = (NSData *)v23;

    objc_storeStrong((id *)&v22->_rawClientDataJSON, a5);
    uint64_t v25 = [v15 copy];
    relyingPartyIdentifier = v22->_relyingPartyIdentifier;
    v22->_relyingPartyIdentifier = (NSString *)v25;

    uint64_t v27 = [v16 copy];
    attestationObject = v22->_attestationObject;
    v22->_attestationObject = (NSData *)v27;

    uint64_t v29 = [v19 copy];
    transports = v22->_transports;
    v22->_transports = (NSArray *)v29;

    uint64_t v31 = [v20 copy];
    extensionOutputsCBOR = v22->_extensionOutputsCBOR;
    v22->_extensionOutputsCBOR = (NSData *)v31;

    uint64_t v33 = [v21 copy];
    attachment = v22->_attachment;
    v22->_attachment = (NSString *)v33;

    v35 = v22;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_extensionOutputsCBOR forKey:@"extensionOutputsCBOR"];
  [v6 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v6 encodeObject:self->_attestationObject forKey:@"attestationObject"];
  [v6 encodeObject:self->_rawClientDataJSON forKey:@"rawClientDataJSON"];
  [v6 encodeObject:self->_credentialID forKey:@"credentialID"];
  if (+[ASCWebKitSPISupport shouldApplyWorkaroundFor134591531])
  {
    v4 = +[ASCWebKitSPISupport wkTransportsFrom:self->_transports];
  }
  else
  {
    v4 = self->_transports;
  }
  v5 = v4;
  [v6 encodeObject:v4 forKey:@"transports"];
  [v6 encodeObject:self->_attachment forKey:@"attachment"];
}

- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attestationObject"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawClientDataJSON"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  BOOL v8 = +[ASCWebKitSPISupport shouldApplyWorkaroundFor134591531];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  if (v8) {
    v11 = {;
  }
    v12 = [v3 decodeObjectOfClasses:v11 forKey:@"transports"];

    +[ASCWebKitSPISupport asTransportsFrom:v12];
  }
  else {
    v12 = {;
  }
    [v3 decodeObjectOfClasses:v12 forKey:@"transports"];
  v13 = };

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensionOutputsCBOR"];
  id v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attachment"];
  id v16 = [(ASCSecurityKeyPublicKeyCredentialRegistration *)self initWithRelyingPartyIdentifier:v4 attestationObject:v5 rawClientDataJSON:v6 credentialID:v7 transports:v13 extensionOutputsCBOR:v14 attachment:v15];

  return v16;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (void)setExtensionOutputsCBOR:(id)a3
{
}

- (NSString)attachment
{
  return self->_attachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensionOutputsCBOR, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);

  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end