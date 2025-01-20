@interface CEMDeviceInformationCommand_StatusQueryResponsesAutoSetupAdminAccountsItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithGUID:(id)a3 withShortName:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)statusGUID;
- (NSString)statusShortName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusGUID:(id)a3;
- (void)setStatusShortName:(id)a3;
@end

@implementation CEMDeviceInformationCommand_StatusQueryResponsesAutoSetupAdminAccountsItem

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"GUID";
  v6[1] = @"shortName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithGUID:(id)a3 withShortName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusGUID:v6];

  [v7 setStatusShortName:v5];

  return v7;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_StatusQueryResponsesAutoSetupAdminAccountsItem allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v23[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v21 = 0;
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"GUID" isRequired:0 defaultValue:0 error:&v21];
    id v12 = v21;
    statusGUID = self->_statusGUID;
    self->_statusGUID = v15;

    if (!v12)
    {
      id v20 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"shortName" isRequired:0 defaultValue:0 error:&v20];
      id v12 = v20;
      statusShortName = self->_statusShortName;
      self->_statusShortName = v17;
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_11:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"GUID" withValue:self->_statusGUID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"shortName" withValue:self->_statusShortName isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponsesAutoSetupAdminAccountsItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusGUID copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusShortName copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)statusGUID
{
  return self->_statusGUID;
}

- (void)setStatusGUID:(id)a3
{
}

- (NSString)statusShortName
{
  return self->_statusShortName;
}

- (void)setStatusShortName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusShortName, 0);

  objc_storeStrong((id *)&self->_statusGUID, 0);
}

@end