@interface CEMAccountLDAPDeclaration_LDAPSearchSettingsItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithLDAPSearchSettingSearchBase:(id)a3;
+ (id)buildWithLDAPSearchSettingDescription:(id)a3 withLDAPSearchSettingSearchBase:(id)a4 withLDAPSearchSettingScope:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadLDAPSearchSettingDescription;
- (NSString)payloadLDAPSearchSettingScope;
- (NSString)payloadLDAPSearchSettingSearchBase;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadLDAPSearchSettingDescription:(id)a3;
- (void)setPayloadLDAPSearchSettingScope:(id)a3;
- (void)setPayloadLDAPSearchSettingSearchBase:(id)a3;
@end

@implementation CEMAccountLDAPDeclaration_LDAPSearchSettingsItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"LDAPSearchSettingDescription";
  v6[1] = @"LDAPSearchSettingSearchBase";
  v6[2] = @"LDAPSearchSettingScope";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithLDAPSearchSettingDescription:(id)a3 withLDAPSearchSettingSearchBase:(id)a4 withLDAPSearchSettingScope:(id)a5
{
  v7 = (__CFString *)a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadLDAPSearchSettingDescription:v9];

  [v10 setPayloadLDAPSearchSettingSearchBase:v8];
  if (v7) {
    v11 = v7;
  }
  else {
    v11 = @"LDAPSearchSettingScopeSubtree";
  }
  [v10 setPayloadLDAPSearchSettingScope:v11];

  return v10;
}

+ (id)buildRequiredOnlyWithLDAPSearchSettingSearchBase:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadLDAPSearchSettingSearchBase:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMAccountLDAPDeclaration_LDAPSearchSettingsItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPSearchSettingDescription" isRequired:0 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadLDAPSearchSettingDescription = self->_payloadLDAPSearchSettingDescription;
  self->_payloadLDAPSearchSettingDescription = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPSearchSettingSearchBase" isRequired:1 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadLDAPSearchSettingSearchBase = self->_payloadLDAPSearchSettingSearchBase;
    self->_payloadLDAPSearchSettingSearchBase = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LDAPSearchSettingScope" isRequired:0 defaultValue:@"LDAPSearchSettingScopeSubtree" error:&v21];
      id v14 = v21;
      payloadLDAPSearchSettingScope = self->_payloadLDAPSearchSettingScope;
      self->_payloadLDAPSearchSettingScope = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LDAPSearchSettingDescription" withValue:self->_payloadLDAPSearchSettingDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LDAPSearchSettingSearchBase" withValue:self->_payloadLDAPSearchSettingSearchBase isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LDAPSearchSettingScope" withValue:self->_payloadLDAPSearchSettingScope isRequired:0 defaultValue:@"LDAPSearchSettingScopeSubtree"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMAccountLDAPDeclaration_LDAPSearchSettingsItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadLDAPSearchSettingDescription copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadLDAPSearchSettingSearchBase copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadLDAPSearchSettingScope copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadLDAPSearchSettingDescription
{
  return self->_payloadLDAPSearchSettingDescription;
}

- (void)setPayloadLDAPSearchSettingDescription:(id)a3
{
}

- (NSString)payloadLDAPSearchSettingSearchBase
{
  return self->_payloadLDAPSearchSettingSearchBase;
}

- (void)setPayloadLDAPSearchSettingSearchBase:(id)a3
{
}

- (NSString)payloadLDAPSearchSettingScope
{
  return self->_payloadLDAPSearchSettingScope;
}

- (void)setPayloadLDAPSearchSettingScope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingScope, 0);
  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingSearchBase, 0);

  objc_storeStrong((id *)&self->_payloadLDAPSearchSettingDescription, 0);
}

@end