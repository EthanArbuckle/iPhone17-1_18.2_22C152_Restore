@interface CEMApplicationInstallDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7 withManageData:(id)a8 withVPNUUID:(id)a9 withCellularSliceUUID:(id)a10 withPreventDataBackup:(id)a11 withConfiguration:(id)a12;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMAnyPayload)payloadConfiguration;
- (NSNumber)payloadInstallWhenActivated;
- (NSNumber)payloadManageData;
- (NSNumber)payloadMandatory;
- (NSNumber)payloadPreventDataBackup;
- (NSNumber)payloadRemoveWhenDeactivated;
- (NSString)payloadApplication;
- (NSString)payloadCellularSliceUUID;
- (NSString)payloadContentFilterUUID;
- (NSString)payloadDNSProxyUUID;
- (NSString)payloadVPNUUID;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadApplication:(id)a3;
- (void)setPayloadCellularSliceUUID:(id)a3;
- (void)setPayloadConfiguration:(id)a3;
- (void)setPayloadContentFilterUUID:(id)a3;
- (void)setPayloadDNSProxyUUID:(id)a3;
- (void)setPayloadInstallWhenActivated:(id)a3;
- (void)setPayloadManageData:(id)a3;
- (void)setPayloadMandatory:(id)a3;
- (void)setPayloadPreventDataBackup:(id)a3;
- (void)setPayloadRemoveWhenDeactivated:(id)a3;
- (void)setPayloadVPNUUID:(id)a3;
@end

@implementation CEMApplicationInstallDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.install";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Application";
  v6[1] = @"Mandatory";
  v6[2] = @"InstallWhenActivated";
  v6[3] = @"RemoveWhenDeactivated";
  v6[4] = @"ManageData";
  v6[5] = @"VPNUUID";
  v6[6] = @"CellularSliceUUID";
  v6[7] = @"PreventDataBackup";
  v6[8] = @"Configuration";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:9];
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
  v4 = [(CEMApplicationInstallDeclaration *)self payloadApplication];
  if (v4)
  {
    v5 = +[CEMAssetReference referenceForIdentifier:v4 assetschematype:@"application"];
    [v3 addObject:v5];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

+ (id)buildWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5 withInstallWhenActivated:(id)a6 withRemoveWhenDeactivated:(id)a7 withManageData:(id)a8 withVPNUUID:(id)a9 withCellularSliceUUID:(id)a10 withPreventDataBackup:(id)a11 withConfiguration:(id)a12
{
  id v16 = a3;
  id v35 = a12;
  id v17 = a11;
  id v18 = a10;
  id v34 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = objc_opt_new();
  [v24 setDeclarationType:@"com.apple.configuration.application.install"];
  if (v16)
  {
    [v24 setDeclarationIdentifier:v16];
  }
  else
  {
    v25 = [MEMORY[0x263F08C38] UUID];
    v26 = [v25 UUIDString];
    [v24 setDeclarationIdentifier:v26];

    id v16 = 0;
  }
  [v24 setPayloadApplication:v23];

  [v24 setPayloadMandatory:v22];
  v27 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v28 = v21;
  }
  else {
    id v28 = (id)MEMORY[0x263EFFA88];
  }
  [v24 setPayloadInstallWhenActivated:v28];

  if (v20) {
    id v29 = v20;
  }
  else {
    id v29 = v27;
  }
  [v24 setPayloadRemoveWhenDeactivated:v29];

  if (v19) {
    id v30 = v19;
  }
  else {
    id v30 = v27;
  }
  [v24 setPayloadManageData:v30];

  [v24 setPayloadVPNUUID:v34];
  [v24 setPayloadCellularSliceUUID:v18];

  if (v17) {
    id v31 = v17;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA80];
  }
  [v24 setPayloadPreventDataBackup:v31];

  [v24 setPayloadConfiguration:v35];
  [v24 updateServerHash];

  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withApplication:(id)a4 withMandatory:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.application.install"];
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
  [v10 setPayloadApplication:v9];

  [v10 setPayloadMandatory:v8];
  [v10 updateServerHash];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationInstallDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v41 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Application" isRequired:1 defaultValue:0 error:&v41];
  id v14 = v41;
  payloadApplication = self->_payloadApplication;
  self->_payloadApplication = v13;

  if (!v14)
  {
    id v40 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Mandatory" isRequired:1 defaultValue:0 error:&v40];
    id v14 = v40;
    payloadMandatory = self->_payloadMandatory;
    self->_payloadMandatory = v16;

    if (!v14)
    {
      id v39 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"InstallWhenActivated" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v39];
      id v14 = v39;
      payloadInstallWhenActivated = self->_payloadInstallWhenActivated;
      self->_payloadInstallWhenActivated = v18;

      if (!v14)
      {
        id v38 = 0;
        id v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RemoveWhenDeactivated" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v38];
        id v14 = v38;
        payloadRemoveWhenDeactivated = self->_payloadRemoveWhenDeactivated;
        self->_payloadRemoveWhenDeactivated = v20;

        if (!v14)
        {
          id v37 = 0;
          id v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"ManageData" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v37];
          id v14 = v37;
          payloadManageData = self->_payloadManageData;
          self->_payloadManageData = v22;

          if (!v14)
          {
            id v36 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"VPNUUID" isRequired:0 defaultValue:0 error:&v36];
            id v14 = v36;
            payloadVPNUUID = self->_payloadVPNUUID;
            self->_payloadVPNUUID = v24;

            if (!v14)
            {
              id v35 = 0;
              v26 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CellularSliceUUID" isRequired:0 defaultValue:0 error:&v35];
              id v14 = v35;
              payloadCellularSliceUUID = self->_payloadCellularSliceUUID;
              self->_payloadCellularSliceUUID = v26;

              if (!v14)
              {
                id v34 = 0;
                id v28 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PreventDataBackup" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v34];
                id v14 = v34;
                payloadPreventDataBackup = self->_payloadPreventDataBackup;
                self->_payloadPreventDataBackup = v28;

                if (!v14)
                {
                  id v33 = 0;
                  id v30 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Configuration" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v33];
                  id v14 = v33;
                  payloadConfiguration = self->_payloadConfiguration;
                  self->_payloadConfiguration = v30;
                }
              }
            }
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
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadApplication = self->_payloadApplication;
  if (payloadApplication)
  {
    id v7 = [v4 objectForKeyedSubscript:self->_payloadApplication];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Application", payloadApplication, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"Application", 0, 0, &stru_26C838878);
  }
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"Mandatory" withValue:self->_payloadMandatory isRequired:1 defaultValue:0];
  uint64_t v8 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"InstallWhenActivated" withValue:self->_payloadInstallWhenActivated isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"RemoveWhenDeactivated" withValue:self->_payloadRemoveWhenDeactivated isRequired:0 defaultValue:v8];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"ManageData" withValue:self->_payloadManageData isRequired:0 defaultValue:v8];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"VPNUUID" withValue:self->_payloadVPNUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CellularSliceUUID" withValue:self->_payloadCellularSliceUUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"PreventDataBackup" withValue:self->_payloadPreventDataBackup isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Configuration" withValue:self->_payloadConfiguration dictSerializer:&__block_literal_global_4 isRequired:0 defaultValue:0];
  id v9 = (void *)[v5 copy];

  return v9;
}

uint64_t __71__CEMApplicationInstallDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CEMApplicationInstallDeclaration;
  id v4 = [(CEMDeclarationBase *)&v24 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadApplication copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadMandatory copy];
  uint64_t v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadInstallWhenActivated copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadRemoveWhenDeactivated copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadManageData copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  uint64_t v15 = [(NSString *)self->_payloadVPNUUID copy];
  id v16 = (void *)v4[14];
  v4[14] = v15;

  uint64_t v17 = [(NSString *)self->_payloadCellularSliceUUID copy];
  id v18 = (void *)v4[15];
  v4[15] = v17;

  uint64_t v19 = [(NSNumber *)self->_payloadPreventDataBackup copy];
  id v20 = (void *)v4[18];
  v4[18] = v19;

  uint64_t v21 = [(CEMAnyPayload *)self->_payloadConfiguration copy];
  id v22 = (void *)v4[19];
  v4[19] = v21;

  return v4;
}

- (NSString)payloadApplication
{
  return self->_payloadApplication;
}

- (void)setPayloadApplication:(id)a3
{
}

- (NSNumber)payloadMandatory
{
  return self->_payloadMandatory;
}

- (void)setPayloadMandatory:(id)a3
{
}

- (NSNumber)payloadInstallWhenActivated
{
  return self->_payloadInstallWhenActivated;
}

- (void)setPayloadInstallWhenActivated:(id)a3
{
}

- (NSNumber)payloadRemoveWhenDeactivated
{
  return self->_payloadRemoveWhenDeactivated;
}

- (void)setPayloadRemoveWhenDeactivated:(id)a3
{
}

- (NSNumber)payloadManageData
{
  return self->_payloadManageData;
}

- (void)setPayloadManageData:(id)a3
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

- (NSString)payloadContentFilterUUID
{
  return self->_payloadContentFilterUUID;
}

- (void)setPayloadContentFilterUUID:(id)a3
{
}

- (NSString)payloadDNSProxyUUID
{
  return self->_payloadDNSProxyUUID;
}

- (void)setPayloadDNSProxyUUID:(id)a3
{
}

- (NSNumber)payloadPreventDataBackup
{
  return self->_payloadPreventDataBackup;
}

- (void)setPayloadPreventDataBackup:(id)a3
{
}

- (CEMAnyPayload)payloadConfiguration
{
  return self->_payloadConfiguration;
}

- (void)setPayloadConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadConfiguration, 0);
  objc_storeStrong((id *)&self->_payloadPreventDataBackup, 0);
  objc_storeStrong((id *)&self->_payloadDNSProxyUUID, 0);
  objc_storeStrong((id *)&self->_payloadContentFilterUUID, 0);
  objc_storeStrong((id *)&self->_payloadCellularSliceUUID, 0);
  objc_storeStrong((id *)&self->_payloadVPNUUID, 0);
  objc_storeStrong((id *)&self->_payloadManageData, 0);
  objc_storeStrong((id *)&self->_payloadRemoveWhenDeactivated, 0);
  objc_storeStrong((id *)&self->_payloadInstallWhenActivated, 0);
  objc_storeStrong((id *)&self->_payloadMandatory, 0);

  objc_storeStrong((id *)&self->_payloadApplication, 0);
}

@end