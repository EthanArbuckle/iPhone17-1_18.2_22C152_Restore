@interface ASPasskeyRegistrationCredential
+ (ASPasskeyRegistrationCredential)credentialWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject;
+ (BOOL)supportsSecureCoding;
+ (NSArray)_defaultTransports;
- (ASPasskeyRegistrationCredential)initWithCoder:(id)a3;
- (ASPasskeyRegistrationCredential)initWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject;
- (ASPasskeyRegistrationCredential)initWithRelyingParty:(id)a3 clientDataHash:(id)a4 credentialID:(id)a5 attestationObject:(id)a6 extensionOutput:(id)a7;
- (ASPasskeyRegistrationCredentialExtensionOutput)extensionOutput;
- (BOOL)_validateWithError:(id *)a3;
- (NSData)attestationObject;
- (NSData)clientDataHash;
- (NSData)credentialID;
- (NSString)relyingParty;
- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)coreExtensions;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExtensionOutput:(id)a3;
@end

@implementation ASPasskeyRegistrationCredential

- (ASPasskeyRegistrationCredential)initWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject
{
  v10 = relyingParty;
  v11 = clientDataHash;
  v12 = credentialID;
  v13 = attestationObject;
  v25.receiver = self;
  v25.super_class = (Class)ASPasskeyRegistrationCredential;
  v14 = [(ASPasskeyRegistrationCredential *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [(NSString *)v10 copy];
    v16 = v14->_relyingParty;
    v14->_relyingParty = (NSString *)v15;

    uint64_t v17 = [(NSData *)v11 copy];
    v18 = v14->_clientDataHash;
    v14->_clientDataHash = (NSData *)v17;

    uint64_t v19 = [(NSData *)v12 copy];
    v20 = v14->_credentialID;
    v14->_credentialID = (NSData *)v19;

    uint64_t v21 = [(NSData *)v13 copy];
    v22 = v14->_attestationObject;
    v14->_attestationObject = (NSData *)v21;

    v23 = v14;
  }

  return v14;
}

- (ASPasskeyRegistrationCredential)initWithRelyingParty:(id)a3 clientDataHash:(id)a4 credentialID:(id)a5 attestationObject:(id)a6 extensionOutput:(id)a7
{
  id v12 = a7;
  v13 = [(ASPasskeyRegistrationCredential *)self initWithRelyingParty:a3 clientDataHash:a4 credentialID:a5 attestationObject:a6];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    extensionOutput = v13->_extensionOutput;
    v13->_extensionOutput = (ASPasskeyRegistrationCredentialExtensionOutput *)v14;

    v16 = v13;
  }

  return v13;
}

+ (ASPasskeyRegistrationCredential)credentialWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject
{
  v10 = attestationObject;
  v11 = credentialID;
  id v12 = clientDataHash;
  v13 = relyingParty;
  uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithRelyingParty:v13 clientDataHash:v12 credentialID:v11 attestationObject:v10];

  return (ASPasskeyRegistrationCredential *)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  relyingParty = self->_relyingParty;
  clientDataHash = self->_clientDataHash;
  credentialID = self->_credentialID;
  attestationObject = self->_attestationObject;

  return (id)[v4 initWithRelyingParty:relyingParty clientDataHash:clientDataHash credentialID:credentialID attestationObject:attestationObject];
}

- (void)encodeWithCoder:(id)a3
{
  relyingParty = self->_relyingParty;
  id v5 = a3;
  [v5 encodeObject:relyingParty forKey:@"relyingParty"];
  [v5 encodeObject:self->_clientDataHash forKey:@"clientDataHash"];
  [v5 encodeObject:self->_credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_attestationObject forKey:@"attestationObject"];
  [v5 encodeObject:self->_extensionOutput forKey:@"extensionOutput"];
}

- (ASPasskeyRegistrationCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingParty"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDataHash"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attestationObject"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionOutput"];

  v10 = [(ASPasskeyRegistrationCredential *)self initWithRelyingParty:v5 clientDataHash:v6 credentialID:v7 attestationObject:v8 extensionOutput:v9];
  return v10;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)extensionOutput
{
  return self->_extensionOutput;
}

- (void)setExtensionOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionOutput, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);

  objc_storeStrong((id *)&self->_relyingParty, 0);
}

+ (NSArray)_defaultTransports
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C10F58);
  uint64_t v2 = sub_21922AFA8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2192339B0;
  unint64_t v7 = v6 + v5;
  v8 = *(void (**)(unint64_t, void, uint64_t))(v3 + 104);
  v8(v7, *MEMORY[0x263F29320], v2);
  v8(v7 + v4, *MEMORY[0x263F29318], v2);
  sub_219205214(v6);
  swift_bridgeObjectRelease();
  v9 = (void *)sub_21922B4D8();
  swift_bridgeObjectRelease();

  return (NSArray *)v9;
}

- (BOOL)_validateWithError:(id *)a3
{
  uint64_t v3 = self;
  sub_2192054A0();

  return 1;
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)coreExtensions
{
  uint64_t v2 = self;
  uint64_t v3 = [(ASPasskeyRegistrationCredential *)v2 extensionOutput];
  if (v3)
  {
    uint64_t v4 = (ASPasskeyRegistrationCredential *)v3;
    id v5 = objc_retain(*(id *)((char *)&v3->super.isa
                           + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions));

    uint64_t v2 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *)v5;
}

@end