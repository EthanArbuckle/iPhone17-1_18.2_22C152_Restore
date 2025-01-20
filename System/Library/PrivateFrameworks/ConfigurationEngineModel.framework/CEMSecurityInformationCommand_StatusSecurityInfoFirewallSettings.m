@interface CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithFirewallEnabled:(id)a3 withBlockAllIncoming:(id)a4 withStealthMode:(id)a5 withApplications:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)statusApplications;
- (NSNumber)statusBlockAllIncoming;
- (NSNumber)statusFirewallEnabled;
- (NSNumber)statusStealthMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusApplications:(id)a3;
- (void)setStatusBlockAllIncoming:(id)a3;
- (void)setStatusFirewallEnabled:(id)a3;
- (void)setStatusStealthMode:(id)a3;
@end

@implementation CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings

+ (NSSet)allowedStatusKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"FirewallEnabled";
  v6[1] = @"BlockAllIncoming";
  v6[2] = @"StealthMode";
  v6[3] = @"Applications";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithFirewallEnabled:(id)a3 withBlockAllIncoming:(id)a4 withStealthMode:(id)a5 withApplications:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setStatusFirewallEnabled:v12];

  [v13 setStatusBlockAllIncoming:v11];
  [v13 setStatusStealthMode:v10];

  [v13 setStatusApplications:v9];

  return v13;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_13;
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v29[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v27 = 0;
    v15 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"FirewallEnabled" isRequired:0 defaultValue:0 error:&v27];
    id v12 = v27;
    statusFirewallEnabled = self->_statusFirewallEnabled;
    self->_statusFirewallEnabled = v15;

    if (!v12)
    {
      id v26 = 0;
      v17 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"BlockAllIncoming" isRequired:0 defaultValue:0 error:&v26];
      id v12 = v26;
      statusBlockAllIncoming = self->_statusBlockAllIncoming;
      self->_statusBlockAllIncoming = v17;

      if (!v12)
      {
        id v25 = 0;
        v19 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"StealthMode" isRequired:0 defaultValue:0 error:&v25];
        id v12 = v25;
        statusStealthMode = self->_statusStealthMode;
        self->_statusStealthMode = v19;

        if (!v12)
        {
          id v24 = 0;
          v21 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Applications" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v24];
          id v12 = v24;
          statusApplications = self->_statusApplications;
          self->_statusApplications = v21;
        }
      }
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_13:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"FirewallEnabled" withValue:self->_statusFirewallEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"BlockAllIncoming" withValue:self->_statusBlockAllIncoming isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"StealthMode" withValue:self->_statusStealthMode isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"Applications" withValue:self->_statusApplications itemSerializer:&__block_literal_global_249 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettings;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_statusFirewallEnabled copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusBlockAllIncoming copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_statusStealthMode copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_statusApplications copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSNumber)statusFirewallEnabled
{
  return self->_statusFirewallEnabled;
}

- (void)setStatusFirewallEnabled:(id)a3
{
}

- (NSNumber)statusBlockAllIncoming
{
  return self->_statusBlockAllIncoming;
}

- (void)setStatusBlockAllIncoming:(id)a3
{
}

- (NSNumber)statusStealthMode
{
  return self->_statusStealthMode;
}

- (void)setStatusStealthMode:(id)a3
{
}

- (NSArray)statusApplications
{
  return self->_statusApplications;
}

- (void)setStatusApplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusApplications, 0);
  objc_storeStrong((id *)&self->_statusStealthMode, 0);
  objc_storeStrong((id *)&self->_statusBlockAllIncoming, 0);

  objc_storeStrong((id *)&self->_statusFirewallEnabled, 0);
}

@end