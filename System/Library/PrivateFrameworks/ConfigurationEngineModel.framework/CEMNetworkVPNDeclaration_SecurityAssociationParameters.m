@interface CEMNetworkVPNDeclaration_SecurityAssociationParameters
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithEncryptionAlgorithm:(id)a3 withIntegrityAlgorithm:(id)a4 withDiffieHellmanGroup:(id)a5 withLifeTimeInMinutes:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadDiffieHellmanGroup;
- (NSNumber)payloadLifeTimeInMinutes;
- (NSString)payloadEncryptionAlgorithm;
- (NSString)payloadIntegrityAlgorithm;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDiffieHellmanGroup:(id)a3;
- (void)setPayloadEncryptionAlgorithm:(id)a3;
- (void)setPayloadIntegrityAlgorithm:(id)a3;
- (void)setPayloadLifeTimeInMinutes:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_SecurityAssociationParameters

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"EncryptionAlgorithm";
  v6[1] = @"IntegrityAlgorithm";
  v6[2] = @"DiffieHellmanGroup";
  v6[3] = @"LifeTimeInMinutes";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEncryptionAlgorithm:(id)a3 withIntegrityAlgorithm:(id)a4 withDiffieHellmanGroup:(id)a5 withLifeTimeInMinutes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a3;
  v13 = objc_opt_new();
  v14 = v13;
  if (v12) {
    v15 = v12;
  }
  else {
    v15 = @"AES-256";
  }
  [v13 setPayloadEncryptionAlgorithm:v15];

  if (v11) {
    v16 = v11;
  }
  else {
    v16 = @"SHA2-256";
  }
  [v14 setPayloadIntegrityAlgorithm:v16];

  if (v10) {
    v17 = v10;
  }
  else {
    v17 = &unk_26C894898;
  }
  [v14 setPayloadDiffieHellmanGroup:v17];

  if (v9) {
    v18 = v9;
  }
  else {
    v18 = &unk_26C8948B0;
  }
  [v14 setPayloadLifeTimeInMinutes:v18];

  return v14;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMNetworkVPNDeclaration_SecurityAssociationParameters allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EncryptionAlgorithm" isRequired:0 defaultValue:@"AES-256" error:&v26];
  id v14 = v26;
  payloadEncryptionAlgorithm = self->_payloadEncryptionAlgorithm;
  self->_payloadEncryptionAlgorithm = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IntegrityAlgorithm" isRequired:0 defaultValue:@"SHA2-256" error:&v25];
    id v14 = v25;
    payloadIntegrityAlgorithm = self->_payloadIntegrityAlgorithm;
    self->_payloadIntegrityAlgorithm = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"DiffieHellmanGroup" isRequired:0 defaultValue:&unk_26C894898 error:&v24];
      id v14 = v24;
      payloadDiffieHellmanGroup = self->_payloadDiffieHellmanGroup;
      self->_payloadDiffieHellmanGroup = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"LifeTimeInMinutes" isRequired:0 defaultValue:&unk_26C8948B0 error:&v23];
        id v14 = v23;
        payloadLifeTimeInMinutes = self->_payloadLifeTimeInMinutes;
        self->_payloadLifeTimeInMinutes = v20;
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"EncryptionAlgorithm" withValue:self->_payloadEncryptionAlgorithm isRequired:0 defaultValue:@"AES-256"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"IntegrityAlgorithm" withValue:self->_payloadIntegrityAlgorithm isRequired:0 defaultValue:@"SHA2-256"];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"DiffieHellmanGroup" withValue:self->_payloadDiffieHellmanGroup isRequired:0 defaultValue:&unk_26C894898];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"LifeTimeInMinutes" withValue:self->_payloadLifeTimeInMinutes isRequired:0 defaultValue:&unk_26C8948B0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMNetworkVPNDeclaration_SecurityAssociationParameters;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEncryptionAlgorithm copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadIntegrityAlgorithm copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadDiffieHellmanGroup copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadLifeTimeInMinutes copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadEncryptionAlgorithm
{
  return self->_payloadEncryptionAlgorithm;
}

- (void)setPayloadEncryptionAlgorithm:(id)a3
{
}

- (NSString)payloadIntegrityAlgorithm
{
  return self->_payloadIntegrityAlgorithm;
}

- (void)setPayloadIntegrityAlgorithm:(id)a3
{
}

- (NSNumber)payloadDiffieHellmanGroup
{
  return self->_payloadDiffieHellmanGroup;
}

- (void)setPayloadDiffieHellmanGroup:(id)a3
{
}

- (NSNumber)payloadLifeTimeInMinutes
{
  return self->_payloadLifeTimeInMinutes;
}

- (void)setPayloadLifeTimeInMinutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLifeTimeInMinutes, 0);
  objc_storeStrong((id *)&self->_payloadDiffieHellmanGroup, 0);
  objc_storeStrong((id *)&self->_payloadIntegrityAlgorithm, 0);

  objc_storeStrong((id *)&self->_payloadEncryptionAlgorithm, 0);
}

@end