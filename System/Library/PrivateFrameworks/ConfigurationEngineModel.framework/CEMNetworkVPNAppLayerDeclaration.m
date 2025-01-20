@interface CEMNetworkVPNAppLayerDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withSafariDomains:(id)a6 withOnDemandMatchAppEnabled:(id)a7 withSMBDomains:(id)a8 withProviderType:(id)a9;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSArray)payloadSMBDomains;
- (NSArray)payloadSafariDomains;
- (NSNumber)payloadOnDemandMatchAppEnabled;
- (NSString)payloadCellularSliceUUID;
- (NSString)payloadProviderType;
- (NSString)payloadVPNUUID;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadCellularSliceUUID:(id)a3;
- (void)setPayloadOnDemandMatchAppEnabled:(id)a3;
- (void)setPayloadProviderType:(id)a3;
- (void)setPayloadSMBDomains:(id)a3;
- (void)setPayloadSafariDomains:(id)a3;
- (void)setPayloadVPNUUID:(id)a3;
@end

@implementation CEMNetworkVPNAppLayerDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.vpn.applayer";
}

+ (id)profileType
{
  return @"com.apple.vpn.managed.applayer";
}

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"VPNUUID";
  v6[1] = @"CellularSliceUUID";
  v6[2] = @"SafariDomains";
  v6[3] = @"OnDemandMatchAppEnabled";
  v6[4] = @"SMBDomains";
  v6[5] = @"ProviderType";
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
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withSafariDomains:(id)a6 withOnDemandMatchAppEnabled:(id)a7 withSMBDomains:(id)a8 withProviderType:(id)a9
{
  id v14 = a3;
  v15 = (__CFString *)a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = objc_opt_new();
  [v21 setDeclarationType:@"com.apple.configuration.network.vpn.applayer"];
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
  [v21 setPayloadVPNUUID:v20];

  [v21 setPayloadCellularSliceUUID:v19];
  [v21 setPayloadSafariDomains:v18];

  [v21 setPayloadOnDemandMatchAppEnabled:v17];
  [v21 setPayloadSMBDomains:v16];

  if (v15) {
    v24 = v15;
  }
  else {
    v24 = @"app-proxy";
  }
  [v21 setPayloadProviderType:v24];

  [v21 updateServerHash];

  return v21;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.network.vpn.applayer"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadVPNUUID:v9];

  [v10 setPayloadCellularSliceUUID:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNAppLayerDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v32 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"VPNUUID" isRequired:1 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadVPNUUID = self->_payloadVPNUUID;
  self->_payloadVPNUUID = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CellularSliceUUID" isRequired:1 defaultValue:0 error:&v31];
    id v14 = v31;
    payloadCellularSliceUUID = self->_payloadCellularSliceUUID;
    self->_payloadCellularSliceUUID = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SafariDomains" validator:&__block_literal_global_24 isRequired:0 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadSafariDomains = self->_payloadSafariDomains;
      self->_payloadSafariDomains = v18;

      if (!v14)
      {
        id v29 = 0;
        id v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"OnDemandMatchAppEnabled" isRequired:0 defaultValue:0 error:&v29];
        id v14 = v29;
        payloadOnDemandMatchAppEnabled = self->_payloadOnDemandMatchAppEnabled;
        self->_payloadOnDemandMatchAppEnabled = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"SMBDomains" validator:&__block_literal_global_38 isRequired:0 defaultValue:0 error:&v28];
          id v14 = v28;
          payloadSMBDomains = self->_payloadSMBDomains;
          self->_payloadSMBDomains = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProviderType" isRequired:0 defaultValue:@"app-proxy" error:&v27];
            id v14 = v27;
            payloadProviderType = self->_payloadProviderType;
            self->_payloadProviderType = v24;
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

uint64_t __54__CEMNetworkVPNAppLayerDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CEMNetworkVPNAppLayerDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"VPNUUID" withValue:self->_payloadVPNUUID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CellularSliceUUID" withValue:self->_payloadCellularSliceUUID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SafariDomains" withValue:self->_payloadSafariDomains itemSerializer:&__block_literal_global_42 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"OnDemandMatchAppEnabled" withValue:self->_payloadOnDemandMatchAppEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"SMBDomains" withValue:self->_payloadSMBDomains itemSerializer:&__block_literal_global_44 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"ProviderType" withValue:self->_payloadProviderType isRequired:0 defaultValue:@"app-proxy"];
  v5 = (void *)[v4 copy];

  return v5;
}

id __71__CEMNetworkVPNAppLayerDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __71__CEMNetworkVPNAppLayerDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMNetworkVPNAppLayerDeclaration;
  v4 = [(CEMDeclarationBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadVPNUUID copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCellularSliceUUID copy];
  id v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadSafariDomains copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadOnDemandMatchAppEnabled copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadSMBDomains copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadProviderType copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  return v4;
}

- (NSString)payloadVPNUUID
{
  return self->_payloadVPNUUID;
}

- (void)setPayloadVPNUUID:(id)a3
{
}

- (NSString)payloadCellularSliceUUID
{
  return self->_payloadCellularSliceUUID;
}

- (void)setPayloadCellularSliceUUID:(id)a3
{
}

- (NSArray)payloadSafariDomains
{
  return self->_payloadSafariDomains;
}

- (void)setPayloadSafariDomains:(id)a3
{
}

- (NSNumber)payloadOnDemandMatchAppEnabled
{
  return self->_payloadOnDemandMatchAppEnabled;
}

- (void)setPayloadOnDemandMatchAppEnabled:(id)a3
{
}

- (NSArray)payloadSMBDomains
{
  return self->_payloadSMBDomains;
}

- (void)setPayloadSMBDomains:(id)a3
{
}

- (NSString)payloadProviderType
{
  return self->_payloadProviderType;
}

- (void)setPayloadProviderType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadProviderType, 0);
  objc_storeStrong((id *)&self->_payloadSMBDomains, 0);
  objc_storeStrong((id *)&self->_payloadOnDemandMatchAppEnabled, 0);
  objc_storeStrong((id *)&self->_payloadSafariDomains, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);

  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
}

@end