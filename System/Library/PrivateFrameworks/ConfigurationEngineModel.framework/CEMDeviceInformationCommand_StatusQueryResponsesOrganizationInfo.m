@interface CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithOrganizationName:(id)a3;
+ (id)buildWithOrganizationName:(id)a3 withOrganizationAddress:(id)a4 withOrganizationPhone:(id)a5 withOrganizationEmail:(id)a6 withOrganizationMagic:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)statusOrganizationAddress;
- (NSString)statusOrganizationEmail;
- (NSString)statusOrganizationMagic;
- (NSString)statusOrganizationName;
- (NSString)statusOrganizationPhone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusOrganizationAddress:(id)a3;
- (void)setStatusOrganizationEmail:(id)a3;
- (void)setStatusOrganizationMagic:(id)a3;
- (void)setStatusOrganizationName:(id)a3;
- (void)setStatusOrganizationPhone:(id)a3;
@end

@implementation CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo

+ (NSSet)allowedStatusKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"OrganizationName";
  v6[1] = @"OrganizationAddress";
  v6[2] = @"OrganizationPhone";
  v6[3] = @"OrganizationEmail";
  v6[4] = @"OrganizationMagic";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithOrganizationName:(id)a3 withOrganizationAddress:(id)a4 withOrganizationPhone:(id)a5 withOrganizationEmail:(id)a6 withOrganizationMagic:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setStatusOrganizationName:v15];

  [v16 setStatusOrganizationAddress:v14];
  [v16 setStatusOrganizationPhone:v13];

  [v16 setStatusOrganizationEmail:v12];
  [v16 setStatusOrganizationMagic:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithOrganizationName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusOrganizationName:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_14;
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v32[0] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v30 = 0;
    id v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationName" isRequired:1 defaultValue:0 error:&v30];
    id v12 = v30;
    statusOrganizationName = self->_statusOrganizationName;
    self->_statusOrganizationName = v15;

    if (!v12)
    {
      id v29 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationAddress" isRequired:0 defaultValue:0 error:&v29];
      id v12 = v29;
      statusOrganizationAddress = self->_statusOrganizationAddress;
      self->_statusOrganizationAddress = v17;

      if (!v12)
      {
        id v28 = 0;
        v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationPhone" isRequired:0 defaultValue:0 error:&v28];
        id v12 = v28;
        statusOrganizationPhone = self->_statusOrganizationPhone;
        self->_statusOrganizationPhone = v19;

        if (!v12)
        {
          id v27 = 0;
          v21 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationEmail" isRequired:0 defaultValue:0 error:&v27];
          id v12 = v27;
          statusOrganizationEmail = self->_statusOrganizationEmail;
          self->_statusOrganizationEmail = v21;

          if (!v12)
          {
            id v26 = 0;
            v23 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OrganizationMagic" isRequired:0 defaultValue:0 error:&v26];
            id v12 = v26;
            statusOrganizationMagic = self->_statusOrganizationMagic;
            self->_statusOrganizationMagic = v23;
          }
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

LABEL_14:
  return v14;
}

- (id)serializePayload
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OrganizationName" withValue:self->_statusOrganizationName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OrganizationAddress" withValue:self->_statusOrganizationAddress isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OrganizationPhone" withValue:self->_statusOrganizationPhone isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OrganizationEmail" withValue:self->_statusOrganizationEmail isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OrganizationMagic" withValue:self->_statusOrganizationMagic isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusOrganizationName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusOrganizationAddress copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusOrganizationPhone copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusOrganizationEmail copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusOrganizationMagic copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)statusOrganizationName
{
  return self->_statusOrganizationName;
}

- (void)setStatusOrganizationName:(id)a3
{
}

- (NSString)statusOrganizationAddress
{
  return self->_statusOrganizationAddress;
}

- (void)setStatusOrganizationAddress:(id)a3
{
}

- (NSString)statusOrganizationPhone
{
  return self->_statusOrganizationPhone;
}

- (void)setStatusOrganizationPhone:(id)a3
{
}

- (NSString)statusOrganizationEmail
{
  return self->_statusOrganizationEmail;
}

- (void)setStatusOrganizationEmail:(id)a3
{
}

- (NSString)statusOrganizationMagic
{
  return self->_statusOrganizationMagic;
}

- (void)setStatusOrganizationMagic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusOrganizationMagic, 0);
  objc_storeStrong((id *)&self->_statusOrganizationEmail, 0);
  objc_storeStrong((id *)&self->_statusOrganizationPhone, 0);
  objc_storeStrong((id *)&self->_statusOrganizationAddress, 0);

  objc_storeStrong((id *)&self->_statusOrganizationName, 0);
}

@end