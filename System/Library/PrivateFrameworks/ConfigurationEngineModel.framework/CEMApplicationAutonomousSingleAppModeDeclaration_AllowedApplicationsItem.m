@interface CEMApplicationAutonomousSingleAppModeDeclaration_AllowedApplicationsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withTeamIdentifier:(id)a4;
+ (id)buildWithBundleIdentifier:(id)a3 withTeamIdentifier:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadBundleIdentifier;
- (NSString)payloadTeamIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadBundleIdentifier:(id)a3;
- (void)setPayloadTeamIdentifier:(id)a3;
@end

@implementation CEMApplicationAutonomousSingleAppModeDeclaration_AllowedApplicationsItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"BundleIdentifier";
  v6[1] = @"TeamIdentifier";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withTeamIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadBundleIdentifier:v6];

  [v7 setPayloadTeamIdentifier:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withTeamIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadBundleIdentifier:v6];

  [v7 setPayloadTeamIdentifier:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationAutonomousSingleAppModeDeclaration_AllowedApplicationsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  self->_payloadBundleIdentifier = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"TeamIdentifier" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadTeamIdentifier = self->_payloadTeamIdentifier;
    self->_payloadTeamIdentifier = v16;
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
  payloadBundleIdentifier = self->_payloadBundleIdentifier;
  if (payloadBundleIdentifier)
  {
    v7 = [v4 objectForKeyedSubscript:self->_payloadBundleIdentifier];
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"BundleIdentifier", payloadBundleIdentifier, v7, &stru_26C838878);
  }
  else
  {
    -[CEMPayloadBase serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:](self, "serializeAssetIntoDictionary:withKey:withValue:assetProvider:transformType:isRequired:defaultValue:", v5, @"BundleIdentifier", 0, 0, &stru_26C838878);
  }
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"TeamIdentifier" withValue:self->_payloadTeamIdentifier isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMApplicationAutonomousSingleAppModeDeclaration_AllowedApplicationsItem;
  id v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadBundleIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadTeamIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadBundleIdentifier
{
  return self->_payloadBundleIdentifier;
}

- (void)setPayloadBundleIdentifier:(id)a3
{
}

- (NSString)payloadTeamIdentifier
{
  return self->_payloadTeamIdentifier;
}

- (void)setPayloadTeamIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTeamIdentifier, 0);

  objc_storeStrong((id *)&self->_payloadBundleIdentifier, 0);
}

@end