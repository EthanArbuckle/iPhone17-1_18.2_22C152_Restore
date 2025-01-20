@interface ASCPlatformPublicKeyCredentialRegistration
+ (BOOL)supportsSecureCoding;
- (ASCPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3;
- (ASCPlatformPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensions:(id)a8 attachment:(id)a9 isExternal:(BOOL)a10;
- (BOOL)isExternal;
- (NSArray)transports;
- (NSData)attestationObject;
- (NSData)credentialID;
- (NSData)rawClientDataJSON;
- (NSString)attachment;
- (NSString)relyingPartyIdentifier;
- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)extensions;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setRawClientDataJSON:(id)a3;
- (void)setTransports:(id)a3;
@end

@implementation ASCPlatformPublicKeyCredentialRegistration

- (ASCPlatformPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensions:(id)a8 attachment:(id)a9 isExternal:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)ASCPlatformPublicKeyCredentialRegistration;
  v23 = [(ASCPlatformPublicKeyCredentialRegistration *)&v38 init];
  if (v23)
  {
    uint64_t v24 = [v19 copy];
    credentialID = v23->_credentialID;
    v23->_credentialID = (NSData *)v24;

    uint64_t v26 = [v16 copy];
    relyingPartyIdentifier = v23->_relyingPartyIdentifier;
    v23->_relyingPartyIdentifier = (NSString *)v26;

    uint64_t v28 = [v17 copy];
    attestationObject = v23->_attestationObject;
    v23->_attestationObject = (NSData *)v28;

    uint64_t v30 = [v18 copy];
    rawClientDataJSON = v23->_rawClientDataJSON;
    v23->_rawClientDataJSON = (NSData *)v30;

    uint64_t v32 = [v20 copy];
    transports = v23->_transports;
    v23->_transports = (NSArray *)v32;

    objc_storeStrong((id *)&v23->_extensions, a8);
    uint64_t v34 = [v22 copy];
    attachment = v23->_attachment;
    v23->_attachment = (NSString *)v34;

    v23->_isExternal = a10;
    v36 = v23;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_extensions forKey:@"extensions"];
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
  [v6 encodeBool:self->_isExternal forKey:@"isExternal"];
}

- (ASCPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3
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

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensions"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attachment"];
  LOBYTE(v18) = [v3 decodeBoolForKey:@"isExternal"];
  id v16 = [(ASCPlatformPublicKeyCredentialRegistration *)self initWithRelyingPartyIdentifier:v4 attestationObject:v5 rawClientDataJSON:v6 credentialID:v7 transports:v13 extensions:v14 attachment:v15 isExternal:v18];

  return v16;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (void)setRawClientDataJSON:(id)a3
{
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)extensions
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
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);

  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end