@interface CEMNetworkVPNAppToAppLayerMappingDeclaration_AppLayerVPNMappingItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7;
+ (id)buildWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadCellularSliceUUID;
- (NSString)payloadDesignatedRequirement;
- (NSString)payloadIdentifier;
- (NSString)payloadSigningIdentifier;
- (NSString)payloadVPNUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadCellularSliceUUID:(id)a3;
- (void)setPayloadDesignatedRequirement:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadSigningIdentifier:(id)a3;
- (void)setPayloadVPNUUID:(id)a3;
@end

@implementation CEMNetworkVPNAppToAppLayerMappingDeclaration_AppLayerVPNMappingItem

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"VPNUUID";
  v6[2] = @"CellularSliceUUID";
  v6[3] = @"DesignatedRequirement";
  v6[4] = @"SigningIdentifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadIdentifier:v15];

  [v16 setPayloadVPNUUID:v14];
  [v16 setPayloadCellularSliceUUID:v13];

  [v16 setPayloadDesignatedRequirement:v12];
  [v16 setPayloadSigningIdentifier:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withVPNUUID:(id)a4 withCellularSliceUUID:(id)a5 withDesignatedRequirement:(id)a6 withSigningIdentifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadIdentifier:v15];

  [v16 setPayloadVPNUUID:v14];
  [v16 setPayloadCellularSliceUUID:v13];

  [v16 setPayloadDesignatedRequirement:v12];
  [v16 setPayloadSigningIdentifier:v11];

  return v16;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNAppToAppLayerMappingDeclaration_AppLayerVPNMappingItem allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"VPNUUID" isRequired:1 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadVPNUUID = self->_payloadVPNUUID;
    self->_payloadVPNUUID = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CellularSliceUUID" isRequired:1 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadCellularSliceUUID = self->_payloadCellularSliceUUID;
      self->_payloadCellularSliceUUID = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DesignatedRequirement" isRequired:1 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadDesignatedRequirement = self->_payloadDesignatedRequirement;
        self->_payloadDesignatedRequirement = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SigningIdentifier" isRequired:1 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadSigningIdentifier = self->_payloadSigningIdentifier;
          self->_payloadSigningIdentifier = v22;
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
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier)
  {
    v7 = [v4 objectForKeyedSubscript:self->_payloadIdentifier];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Identifier", payloadIdentifier, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Identifier", 0, 0, &stru_26C838878);
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"VPNUUID" withValue:self->_payloadVPNUUID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CellularSliceUUID" withValue:self->_payloadCellularSliceUUID isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"DesignatedRequirement" withValue:self->_payloadDesignatedRequirement isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"SigningIdentifier" withValue:self->_payloadSigningIdentifier isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMNetworkVPNAppToAppLayerMappingDeclaration_AppLayerVPNMappingItem;
  id v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadVPNUUID copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadCellularSliceUUID copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadDesignatedRequirement copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_payloadSigningIdentifier copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
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

- (NSString)payloadDesignatedRequirement
{
  return self->_payloadDesignatedRequirement;
}

- (void)setPayloadDesignatedRequirement:(id)a3
{
}

- (NSString)payloadSigningIdentifier
{
  return self->_payloadSigningIdentifier;
}

- (void)setPayloadSigningIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSigningIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadDesignatedRequirement, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);

  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
}

@end