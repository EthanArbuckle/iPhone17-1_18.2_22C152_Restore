@interface CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettingsApplicationsItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithAllowed:(id)a3 withBundleID:(id)a4 withName:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)statusAllowed;
- (NSString)statusBundleID;
- (NSString)statusName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusAllowed:(id)a3;
- (void)setStatusBundleID:(id)a3;
- (void)setStatusName:(id)a3;
@end

@implementation CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettingsApplicationsItem

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Allowed";
  v6[1] = @"BundleID";
  v6[2] = @"Name";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithAllowed:(id)a3 withBundleID:(id)a4 withName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusAllowed:v9];

  [v10 setStatusBundleID:v8];
  [v10 setStatusName:v7];

  return v10;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettingsApplicationsItem allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v26[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v24 = 0;
    v15 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Allowed" isRequired:0 defaultValue:0 error:&v24];
    id v12 = v24;
    statusAllowed = self->_statusAllowed;
    self->_statusAllowed = v15;

    if (!v12)
    {
      id v23 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleID" isRequired:0 defaultValue:0 error:&v23];
      id v12 = v23;
      statusBundleID = self->_statusBundleID;
      self->_statusBundleID = v17;

      if (!v12)
      {
        id v22 = 0;
        v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:0 defaultValue:0 error:&v22];
        id v12 = v22;
        statusName = self->_statusName;
        self->_statusName = v19;
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

LABEL_12:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"Allowed" withValue:self->_statusAllowed isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BundleID" withValue:self->_statusBundleID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Name" withValue:self->_statusName isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSecurityInformationCommand_StatusSecurityInfoFirewallSettingsApplicationsItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_statusAllowed copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusBundleID copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSNumber)statusAllowed
{
  return self->_statusAllowed;
}

- (void)setStatusAllowed:(id)a3
{
}

- (NSString)statusBundleID
{
  return self->_statusBundleID;
}

- (void)setStatusBundleID:(id)a3
{
}

- (NSString)statusName
{
  return self->_statusName;
}

- (void)setStatusName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusName, 0);
  objc_storeStrong((id *)&self->_statusBundleID, 0);

  objc_storeStrong((id *)&self->_statusAllowed, 0);
}

@end