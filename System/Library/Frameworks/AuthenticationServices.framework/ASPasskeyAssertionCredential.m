@interface ASPasskeyAssertionCredential
+ (ASPasskeyAssertionCredential)credentialWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID;
+ (BOOL)supportsSecureCoding;
- (ASPasskeyAssertionCredential)initWithCoder:(id)a3;
- (ASPasskeyAssertionCredential)initWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID;
- (ASPasskeyAssertionCredential)initWithUserHandle:(id)a3 relyingParty:(id)a4 signature:(id)a5 clientDataHash:(id)a6 authenticatorData:(id)a7 credentialID:(id)a8 extensionOutput:(id)a9;
- (ASPasskeyAssertionCredentialExtensionOutput)extensionOutput;
- (BOOL)_validateWithError:(id *)a3;
- (NSData)authenticatorData;
- (NSData)clientDataHash;
- (NSData)credentialID;
- (NSData)signature;
- (NSData)userHandle;
- (NSString)relyingParty;
- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)coreExtensions;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionOutput:(id)a3;
@end

@implementation ASPasskeyAssertionCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyAssertionCredential)initWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID
{
  return [(ASPasskeyAssertionCredential *)self initWithUserHandle:userHandle relyingParty:relyingParty signature:signature clientDataHash:clientDataHash authenticatorData:authenticatorData credentialID:credentialID extensionOutput:0];
}

- (ASPasskeyAssertionCredential)initWithUserHandle:(id)a3 relyingParty:(id)a4 signature:(id)a5 clientDataHash:(id)a6 authenticatorData:(id)a7 credentialID:(id)a8 extensionOutput:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)ASPasskeyAssertionCredential;
  v22 = [(ASPasskeyAssertionCredential *)&v39 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    userHandle = v22->_userHandle;
    v22->_userHandle = (NSData *)v23;

    uint64_t v25 = [v16 copy];
    relyingParty = v22->_relyingParty;
    v22->_relyingParty = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    signature = v22->_signature;
    v22->_signature = (NSData *)v27;

    uint64_t v29 = [v18 copy];
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v29;

    uint64_t v31 = [v19 copy];
    authenticatorData = v22->_authenticatorData;
    v22->_authenticatorData = (NSData *)v31;

    uint64_t v33 = [v20 copy];
    credentialID = v22->_credentialID;
    v22->_credentialID = (NSData *)v33;

    uint64_t v35 = [v21 copy];
    extensionOutput = v22->_extensionOutput;
    v22->_extensionOutput = (ASPasskeyAssertionCredentialExtensionOutput *)v35;

    v37 = v22;
  }

  return v22;
}

+ (ASPasskeyAssertionCredential)credentialWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID
{
  v14 = credentialID;
  id v15 = authenticatorData;
  id v16 = clientDataHash;
  id v17 = signature;
  id v18 = relyingParty;
  id v19 = userHandle;
  id v20 = (void *)[objc_alloc((Class)a1) initWithUserHandle:v19 relyingParty:v18 signature:v17 clientDataHash:v16 authenticatorData:v15 credentialID:v14];

  return (ASPasskeyAssertionCredential *)v20;
}

- (ASPasskeyAssertionCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userHandle"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingParty"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticatorData"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionOutput"];

  v12 = [(ASPasskeyAssertionCredential *)self initWithUserHandle:v5 relyingParty:v6 signature:v7 clientDataHash:v8 authenticatorData:v9 credentialID:v10 extensionOutput:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  userHandle = self->_userHandle;
  id v5 = a3;
  [v5 encodeObject:userHandle forKey:@"userHandle"];
  [v5 encodeObject:self->_relyingParty forKey:@"relyingParty"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v5 encodeObject:self->_authenticatorData forKey:@"authenticatorData"];
  [v5 encodeObject:self->_credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_extensionOutput forKey:@"extensionOutput"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithUserHandle:self->_userHandle relyingParty:self->_relyingParty signature:self->_signature clientDataHash:self->_clientDataHash authenticatorData:self->_authenticatorData credentialID:self->_credentialID extensionOutput:self->_extensionOutput];
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSData)authenticatorData
{
  return self->_authenticatorData;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (ASPasskeyAssertionCredentialExtensionOutput)extensionOutput
{
  return self->_extensionOutput;
}

- (void)setExtensionOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionOutput, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);

  objc_storeStrong((id *)&self->_userHandle, 0);
}

- (BOOL)_validateWithError:(id *)a3
{
  v3 = self;
  sub_219202914();

  return 1;
}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)coreExtensions
{
  v2 = self;
  v3 = [(ASPasskeyAssertionCredential *)v2 extensionOutput];
  if (v3)
  {
    id v4 = (ASPasskeyAssertionCredential *)v3;
    id v5 = objc_retain(*(id *)((char *)&v3->super.isa
                           + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions));

    v2 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *)v5;
}

@end