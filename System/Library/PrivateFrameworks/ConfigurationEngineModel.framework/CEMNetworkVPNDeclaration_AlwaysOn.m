@interface CEMNetworkVPNDeclaration_AlwaysOn
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithTunnelConfigurations:(id)a3;
+ (id)buildWithTunnelConfigurations:(id)a3 withUIToggleEnabled:(id)a4 withServiceExceptions:(id)a5 withAllowCaptiveWebSheet:(id)a6 withAllowAllCaptiveNetworkPlugins:(id)a7 withAllowedCaptiveNetworkPlugins:(id)a8;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadAllowedCaptiveNetworkPlugins;
- (NSArray)payloadServiceExceptions;
- (NSArray)payloadTunnelConfigurations;
- (NSNumber)payloadAllowAllCaptiveNetworkPlugins;
- (NSNumber)payloadAllowCaptiveWebSheet;
- (NSNumber)payloadUIToggleEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowAllCaptiveNetworkPlugins:(id)a3;
- (void)setPayloadAllowCaptiveWebSheet:(id)a3;
- (void)setPayloadAllowedCaptiveNetworkPlugins:(id)a3;
- (void)setPayloadServiceExceptions:(id)a3;
- (void)setPayloadTunnelConfigurations:(id)a3;
- (void)setPayloadUIToggleEnabled:(id)a3;
@end

@implementation CEMNetworkVPNDeclaration_AlwaysOn

+ (NSSet)allowedPayloadKeys
{
  v6[6] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"TunnelConfigurations";
  v6[1] = @"UIToggleEnabled";
  v6[2] = @"ServiceExceptions";
  v6[3] = @"AllowCaptiveWebSheet";
  v6[4] = @"AllowAllCaptiveNetworkPlugins";
  v6[5] = @"AllowedCaptiveNetworkPlugins";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:6];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithTunnelConfigurations:(id)a3 withUIToggleEnabled:(id)a4 withServiceExceptions:(id)a5 withAllowCaptiveWebSheet:(id)a6 withAllowAllCaptiveNetworkPlugins:(id)a7 withAllowedCaptiveNetworkPlugins:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_opt_new();
  [v19 setPayloadTunnelConfigurations:v18];

  if (v17) {
    v20 = v17;
  }
  else {
    v20 = &unk_26C894850;
  }
  [v19 setPayloadUIToggleEnabled:v20];

  [v19 setPayloadServiceExceptions:v16];
  if (v15) {
    v21 = v15;
  }
  else {
    v21 = &unk_26C894850;
  }
  [v19 setPayloadAllowCaptiveWebSheet:v21];

  if (v14) {
    v22 = v14;
  }
  else {
    v22 = &unk_26C894850;
  }
  [v19 setPayloadAllowAllCaptiveNetworkPlugins:v22];

  [v19 setPayloadAllowedCaptiveNetworkPlugins:v13];

  return v19;
}

+ (id)buildRequiredOnlyWithTunnelConfigurations:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadTunnelConfigurations:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMNetworkVPNDeclaration_AlwaysOn allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v32 = 0;
  id v13 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"TunnelConfigurations" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v32];
  id v14 = v32;
  payloadTunnelConfigurations = self->_payloadTunnelConfigurations;
  self->_payloadTunnelConfigurations = v13;

  if (!v14)
  {
    id v31 = 0;
    id v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"UIToggleEnabled" isRequired:0 defaultValue:&unk_26C894850 error:&v31];
    id v14 = v31;
    payloadUIToggleEnabled = self->_payloadUIToggleEnabled;
    self->_payloadUIToggleEnabled = v16;

    if (!v14)
    {
      id v30 = 0;
      id v18 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ServiceExceptions" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v30];
      id v14 = v30;
      payloadServiceExceptions = self->_payloadServiceExceptions;
      self->_payloadServiceExceptions = v18;

      if (!v14)
      {
        id v29 = 0;
        v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AllowCaptiveWebSheet" isRequired:0 defaultValue:&unk_26C894850 error:&v29];
        id v14 = v29;
        payloadAllowCaptiveWebSheet = self->_payloadAllowCaptiveWebSheet;
        self->_payloadAllowCaptiveWebSheet = v20;

        if (!v14)
        {
          id v28 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"AllowAllCaptiveNetworkPlugins" isRequired:0 defaultValue:&unk_26C894850 error:&v28];
          id v14 = v28;
          payloadAllowAllCaptiveNetworkPlugins = self->_payloadAllowAllCaptiveNetworkPlugins;
          self->_payloadAllowAllCaptiveNetworkPlugins = v22;

          if (!v14)
          {
            id v27 = 0;
            v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AllowedCaptiveNetworkPlugins" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v27];
            id v14 = v27;
            payloadAllowedCaptiveNetworkPlugins = self->_payloadAllowedCaptiveNetworkPlugins;
            self->_payloadAllowedCaptiveNetworkPlugins = v24;
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
  payloadTunnelConfigurations = self->_payloadTunnelConfigurations;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_2642C91D0;
  id v7 = v4;
  id v19 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"TunnelConfigurations" withValue:payloadTunnelConfigurations itemSerializer:v18 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"UIToggleEnabled" withValue:self->_payloadUIToggleEnabled isRequired:0 defaultValue:&unk_26C894850];
  payloadServiceExceptions = self->_payloadServiceExceptions;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_2;
  v16[3] = &unk_2642C91F8;
  id v9 = v7;
  id v17 = v9;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"ServiceExceptions" withValue:payloadServiceExceptions itemSerializer:v16 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"AllowCaptiveWebSheet" withValue:self->_payloadAllowCaptiveWebSheet isRequired:0 defaultValue:&unk_26C894850];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v5 withKey:@"AllowAllCaptiveNetworkPlugins" withValue:self->_payloadAllowAllCaptiveNetworkPlugins isRequired:0 defaultValue:&unk_26C894850];
  payloadAllowedCaptiveNetworkPlugins = self->_payloadAllowedCaptiveNetworkPlugins;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__CEMNetworkVPNDeclaration_AlwaysOn_serializePayloadWithAssetProviders___block_invoke_3;
  v14[3] = &unk_2642C9220;
  id v15 = v9;
  id v11 = v9;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"AllowedCaptiveNetworkPlugins" withValue:payloadAllowedCaptiveNetworkPlugins itemSerializer:v14 isRequired:0 defaultValue:0];
  v12 = (void *)[v5 copy];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CEMNetworkVPNDeclaration_AlwaysOn;
  id v4 = [(CEMPayloadBase *)&v18 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadTunnelConfigurations copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadUIToggleEnabled copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_payloadServiceExceptions copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadAllowCaptiveWebSheet copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadAllowAllCaptiveNetworkPlugins copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadAllowedCaptiveNetworkPlugins copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  return v4;
}

- (NSArray)payloadTunnelConfigurations
{
  return self->_payloadTunnelConfigurations;
}

- (void)setPayloadTunnelConfigurations:(id)a3
{
}

- (NSNumber)payloadUIToggleEnabled
{
  return self->_payloadUIToggleEnabled;
}

- (void)setPayloadUIToggleEnabled:(id)a3
{
}

- (NSArray)payloadServiceExceptions
{
  return self->_payloadServiceExceptions;
}

- (void)setPayloadServiceExceptions:(id)a3
{
}

- (NSNumber)payloadAllowCaptiveWebSheet
{
  return self->_payloadAllowCaptiveWebSheet;
}

- (void)setPayloadAllowCaptiveWebSheet:(id)a3
{
}

- (NSNumber)payloadAllowAllCaptiveNetworkPlugins
{
  return self->_payloadAllowAllCaptiveNetworkPlugins;
}

- (void)setPayloadAllowAllCaptiveNetworkPlugins:(id)a3
{
}

- (NSArray)payloadAllowedCaptiveNetworkPlugins
{
  return self->_payloadAllowedCaptiveNetworkPlugins;
}

- (void)setPayloadAllowedCaptiveNetworkPlugins:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowedCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_payloadAllowAllCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_payloadAllowCaptiveWebSheet, 0);
  objc_storeStrong((id *)&self->_payloadServiceExceptions, 0);
  objc_storeStrong((id *)&self->_payloadUIToggleEnabled, 0);

  objc_storeStrong((id *)&self->_payloadTunnelConfigurations, 0);
}

@end