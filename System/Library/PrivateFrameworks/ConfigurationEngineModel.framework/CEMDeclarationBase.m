@interface CEMDeclarationBase
+ (NSString)declarationClass;
+ (id)declarationForData:(id)a3 error:(id *)a4;
+ (id)declarationForPayload:(id)a3 error:(id *)a4;
- (BOOL)loadDeclarationFromDictionary:(id)a3 error:(id *)a4;
- (CEMAnyPayload)declarationPayload;
- (NSNumber)declarationRequiresNetworkTether;
- (NSString)declarationActivationScope;
- (NSString)declarationDescription;
- (NSString)declarationIdentifier;
- (NSString)declarationServerHash;
- (NSString)declarationType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (id)serializeAsDataWithError:(id *)a3;
- (void)setDeclarationActivationScope:(id)a3;
- (void)setDeclarationDescription:(id)a3;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setDeclarationPayload:(id)a3;
- (void)setDeclarationRequiresNetworkTether:(id)a3;
- (void)setDeclarationServerHash:(id)a3;
- (void)setDeclarationType:(id)a3;
- (void)updateServerHash;
@end

@implementation CEMDeclarationBase

+ (NSString)declarationClass
{
  return 0;
}

+ (id)declarationForPayload:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"Type"];
  v7 = (void *)v6;
  v8 = @"(nil)";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:v9])
  {
    id v10 = (id)objc_opt_new();
    id v17 = 0;
    [v10 loadDeclarationFromDictionary:v5 error:&v17];
    id v11 = v17;
    v12 = v11;
    if (!v11)
    {
      id v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    id v13 = v11;
    v12 = v13;
LABEL_9:
    v15 = 0;
    *a4 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v12 = [NSString stringWithFormat:@"Could not match declaration type: %@", v9];
    v19[0] = v12;
    id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v13 = [v14 errorWithDomain:@"error" code:1 userInfo:v10];
    goto LABEL_9;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)declarationForData:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:a4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = +[CEMDeclarationBase declarationForPayload:v5 error:a4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)loadDeclarationFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v33 = 0;
  v7 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v33];
  id v8 = v33;
  declarationType = self->_declarationType;
  self->_declarationType = v7;

  if (v8) {
    goto LABEL_7;
  }
  id v32 = 0;
  id v10 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v32];
  id v8 = v32;
  declarationIdentifier = self->_declarationIdentifier;
  self->_declarationIdentifier = v10;

  if (v8) {
    goto LABEL_7;
  }
  id v31 = 0;
  v12 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Description" isRequired:0 defaultValue:0 error:&v31];
  id v8 = v31;
  declarationDescription = self->_declarationDescription;
  self->_declarationDescription = v12;

  if (v8) {
    goto LABEL_7;
  }
  id v30 = 0;
  v14 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerHash" isRequired:1 defaultValue:0 error:&v30];
  id v8 = v30;
  declarationServerHash = self->_declarationServerHash;
  self->_declarationServerHash = v14;

  if (v8) {
    goto LABEL_7;
  }
  id v29 = 0;
  v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RequiresNetworkTether" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v29];
  id v8 = v29;
  declarationRequiresNetworkTether = self->_declarationRequiresNetworkTether;
  self->_declarationRequiresNetworkTether = v16;

  if (v8
    || (id v28 = 0,
        [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ActivationScope" isRequired:0 defaultValue:0 error:&v28], uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue(), v8 = v28, declarationActivationScope = self->_declarationActivationScope, self->_declarationActivationScope = v18, declarationActivationScope, v8))
  {
LABEL_7:
    BOOL v20 = 0;
    if (a4)
    {
LABEL_8:
      id v8 = v8;
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v22 = [v6 objectForKeyedSubscript:@"Payload"];
    v23 = (void *)v22;
    v24 = (void *)MEMORY[0x263EFFA78];
    if (v22) {
      v24 = (void *)v22;
    }
    id v25 = v24;

    id v27 = 0;
    [(CEMPayloadBase *)self loadPayload:v25 error:&v27];

    id v26 = v27;
    id v8 = v26;
    BOOL v20 = v26 == 0;
    if (a4 && v26) {
      goto LABEL_8;
    }
  }

  return v20;
}

- (id)serialize
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Type" withValue:self->_declarationType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Identifier" withValue:self->_declarationIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Description" withValue:self->_declarationDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ServerHash" withValue:self->_declarationServerHash isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"RequiresNetworkTether" withValue:self->_declarationRequiresNetworkTether isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ActivationScope" withValue:self->_declarationActivationScope isRequired:0 defaultValue:0];
  v4 = [(CEMPayloadBase *)self serializePayloadWithAssetProviders:0];
  [v3 setObject:v4 forKeyedSubscript:@"Payload"];

  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)serializeAsDataWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x263F08AC0];
  id v5 = [(CEMDeclarationBase *)self serialize];
  id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];

  return v6;
}

- (void)updateServerHash
{
  v3 = (void *)MEMORY[0x263F08AC0];
  v4 = [(CEMPayloadBase *)self serializePayload];
  id v7 = [v3 dataWithPropertyList:v4 format:100 options:0 error:0];

  if (v7)
  {
    id v5 = [v7 CEMSHA1HexString];
  }
  else
  {
    id v5 = &stru_26C838878;
  }
  objc_storeStrong((id *)&self->_declarationServerHash, v5);
  id v6 = v7;
  if (v7)
  {

    id v6 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMDeclarationBase;
  v4 = [(CEMPayloadBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_declarationType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_declarationIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_declarationDescription copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_declarationServerHash copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_declarationRequiresNetworkTether copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_declarationActivationScope copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(CEMAnyPayload *)self->_declarationPayload copy];
  uint64_t v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)declarationType
{
  return self->_declarationType;
}

- (void)setDeclarationType:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (NSString)declarationDescription
{
  return self->_declarationDescription;
}

- (void)setDeclarationDescription:(id)a3
{
}

- (NSString)declarationServerHash
{
  return self->_declarationServerHash;
}

- (void)setDeclarationServerHash:(id)a3
{
}

- (NSNumber)declarationRequiresNetworkTether
{
  return self->_declarationRequiresNetworkTether;
}

- (void)setDeclarationRequiresNetworkTether:(id)a3
{
}

- (NSString)declarationActivationScope
{
  return self->_declarationActivationScope;
}

- (void)setDeclarationActivationScope:(id)a3
{
}

- (CEMAnyPayload)declarationPayload
{
  return self->_declarationPayload;
}

- (void)setDeclarationPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationPayload, 0);
  objc_storeStrong((id *)&self->_declarationActivationScope, 0);
  objc_storeStrong((id *)&self->_declarationRequiresNetworkTether, 0);
  objc_storeStrong((id *)&self->_declarationServerHash, 0);
  objc_storeStrong((id *)&self->_declarationDescription, 0);
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);

  objc_storeStrong((id *)&self->_declarationType, 0);
}

@end