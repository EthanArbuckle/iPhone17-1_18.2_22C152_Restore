@interface CEMSecurityFirewallDeclaration_ApplicationsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithApplication:(id)a3 withAllowed:(id)a4 withBundleID:(id)a5;
+ (id)buildWithApplication:(id)a3 withAllowed:(id)a4 withBundleID:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadAllowed;
- (NSString)payloadApplication;
- (NSString)payloadBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadAllowed:(id)a3;
- (void)setPayloadApplication:(id)a3;
- (void)setPayloadBundleID:(id)a3;
@end

@implementation CEMSecurityFirewallDeclaration_ApplicationsItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Application";
  v6[1] = @"Allowed";
  v6[2] = @"BundleID";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithApplication:(id)a3 withAllowed:(id)a4 withBundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadApplication:v9];

  [v10 setPayloadAllowed:v8];
  [v10 setPayloadBundleID:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithApplication:(id)a3 withAllowed:(id)a4 withBundleID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadApplication:v9];

  [v10 setPayloadAllowed:v8];
  [v10 setPayloadBundleID:v7];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityFirewallDeclaration_ApplicationsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Application" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadApplication = self->_payloadApplication;
  self->_payloadApplication = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Allowed" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadAllowed = self->_payloadAllowed;
    self->_payloadAllowed = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleID" isRequired:1 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadBundleID = self->_payloadBundleID;
      self->_payloadBundleID = v18;
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v5 withKey:@"Allowed" withValue:self->_payloadAllowed isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"BundleID" withValue:self->_payloadBundleID isRequired:1 defaultValue:0];
  id v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSecurityFirewallDeclaration_ApplicationsItem;
  id v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadApplication copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadAllowed copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadBundleID copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadApplication
{
  return self->_payloadApplication;
}

- (void)setPayloadApplication:(id)a3
{
}

- (NSNumber)payloadAllowed
{
  return self->_payloadAllowed;
}

- (void)setPayloadAllowed:(id)a3
{
}

- (NSString)payloadBundleID
{
  return self->_payloadBundleID;
}

- (void)setPayloadBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadBundleID, 0);
  objc_storeStrong((id *)&self->_payloadAllowed, 0);

  objc_storeStrong((id *)&self->_payloadApplication, 0);
}

@end