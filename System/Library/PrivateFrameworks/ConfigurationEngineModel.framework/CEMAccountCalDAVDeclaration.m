@interface CEMAccountCalDAVDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCalDAVHostName:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withCalDAVAccountDescription:(id)a4 withCalDAVHostName:(id)a5 withCalDAVPrincipalURL:(id)a6 withCalDAVUseSSL:(id)a7 withCalDAVPort:(id)a8 withCalDAVCredentials:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadCalDAVPort;
- (NSNumber)payloadCalDAVUseSSL;
- (NSString)payloadCalDAVAccountDescription;
- (NSString)payloadCalDAVCredentials;
- (NSString)payloadCalDAVHostName;
- (NSString)payloadCalDAVPrincipalURL;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCalDAVAccountDescription:(id)a3;
- (void)setPayloadCalDAVCredentials:(id)a3;
- (void)setPayloadCalDAVHostName:(id)a3;
- (void)setPayloadCalDAVPort:(id)a3;
- (void)setPayloadCalDAVPrincipalURL:(id)a3;
- (void)setPayloadCalDAVUseSSL:(id)a3;
@end

@implementation CEMAccountCalDAVDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.account.caldav";
}

+ (id)profileType
{
  return @"com.apple.caldav.account";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CalDAVAccountDescription";
  v6[1] = @"CalDAVHostName";
  v6[2] = @"CalDAVPrincipalURL";
  v6[3] = @"CalDAVUseSSL";
  v6[4] = @"CalDAVPort";
  v6[5] = @"CalDAVCredentials";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  v4 = [(CEMAccountCalDAVDeclaration *)self payloadCalDAVCredentials];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"credential"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withCalDAVAccountDescription:(id)a4 withCalDAVHostName:(id)a5 withCalDAVPrincipalURL:(id)a6 withCalDAVUseSSL:(id)a7 withCalDAVPort:(id)a8 withCalDAVCredentials:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.account.caldav"];
  if (v14)
  {
    [v21 setDeclarationIdentifier:v14];
  }
  else
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v22 UUIDString];
    [v21 setDeclarationIdentifier:v23];
  }
  [v21 setPayloadCalDAVAccountDescription:v20];

  [v21 setPayloadCalDAVHostName:v19];
  [v21 setPayloadCalDAVPrincipalURL:v18];

  if (v17) {
    id v24 = v17;
  }
  else {
    id v24 = (id)MEMORY[0x263EFFA88];
  }
  [v21 setPayloadCalDAVUseSSL:v24];

  if (v16) {
    v25 = v16;
  }
  else {
    v25 = &unk_26C894700;
  }
  [v21 setPayloadCalDAVPort:v25];

  [v21 setPayloadCalDAVCredentials:v15];
  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withCalDAVHostName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.account.caldav"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadCalDAVHostName:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountCalDAVDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalDAVAccountDescription" isRequired:0 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadCalDAVAccountDescription = self->_payloadCalDAVAccountDescription;
  self->_payloadCalDAVAccountDescription = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalDAVHostName" isRequired:1 defaultValue:0 error:&v31];
    id v14 = v31;
    payloadCalDAVHostName = self->_payloadCalDAVHostName;
    self->_payloadCalDAVHostName = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalDAVPrincipalURL" isRequired:0 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadCalDAVPrincipalURL = self->_payloadCalDAVPrincipalURL;
      self->_payloadCalDAVPrincipalURL = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"CalDAVUseSSL" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v29];
        id v14 = v29;
        payloadCalDAVUseSSL = self->_payloadCalDAVUseSSL;
        self->_payloadCalDAVUseSSL = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CalDAVPort" isRequired:0 defaultValue:&unk_26C894700 error:&v28];
          id v14 = v28;
          payloadCalDAVPort = self->_payloadCalDAVPort;
          self->_payloadCalDAVPort = v22;

          if (!v14)
          {
            id v27 = 0;
            id v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalDAVCredentials" isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadCalDAVCredentials = self->_payloadCalDAVCredentials;
            self->_payloadCalDAVCredentials = v24;
          }
        }
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
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CalDAVAccountDescription" withValue:self->_payloadCalDAVAccountDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CalDAVHostName" withValue:self->_payloadCalDAVHostName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CalDAVPrincipalURL" withValue:self->_payloadCalDAVPrincipalURL isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"CalDAVUseSSL" withValue:self->_payloadCalDAVUseSSL isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"CalDAVPort" withValue:self->_payloadCalDAVPort isRequired:0 defaultValue:&unk_26C894700];
  payloadCalDAVCredentials = self->_payloadCalDAVCredentials;
  if (payloadCalDAVCredentials)
  {
    v7 = [v4 objectForKeyedSubscript:self->_payloadCalDAVCredentials];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"CalDAVCredentials", payloadCalDAVCredentials, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"CalDAVCredentials", 0, 0, &stru_26C838878);
  }
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMAccountCalDAVDeclaration;
  id v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadCalDAVAccountDescription copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCalDAVHostName copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSString *)self->_payloadCalDAVPrincipalURL copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadCalDAVUseSSL copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadCalDAVPort copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadCalDAVCredentials copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadCalDAVAccountDescription
{
  return self->_payloadCalDAVAccountDescription;
}

- (void)setPayloadCalDAVAccountDescription:(id)a3
{
}

- (NSString)payloadCalDAVHostName
{
  return self->_payloadCalDAVHostName;
}

- (void)setPayloadCalDAVHostName:(id)a3
{
}

- (NSString)payloadCalDAVPrincipalURL
{
  return self->_payloadCalDAVPrincipalURL;
}

- (void)setPayloadCalDAVPrincipalURL:(id)a3
{
}

- (NSNumber)payloadCalDAVUseSSL
{
  return self->_payloadCalDAVUseSSL;
}

- (void)setPayloadCalDAVUseSSL:(id)a3
{
}

- (NSNumber)payloadCalDAVPort
{
  return self->_payloadCalDAVPort;
}

- (void)setPayloadCalDAVPort:(id)a3
{
}

- (NSString)payloadCalDAVCredentials
{
  return self->_payloadCalDAVCredentials;
}

- (void)setPayloadCalDAVCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCalDAVCredentials, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVPort, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVUseSSL, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVPrincipalURL, 0);
  objc_storeStrong((id *)&self->_payloadCalDAVHostName, 0);

  objc_storeStrong((id *)&self->_payloadCalDAVAccountDescription, 0);
}

@end