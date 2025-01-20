@interface CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithRestrictedBool:(id)a3 withRestrictedValue:(id)a4 withIntersection:(id)a5 withUnion:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMDeviceListRestrictionsCommand_StatusBooleanDictionary)statusRestrictedBool;
- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusIntersection;
- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusUnion;
- (CEMDeviceListRestrictionsCommand_StatusValueDictionary)statusRestrictedValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusIntersection:(id)a3;
- (void)setStatusRestrictedBool:(id)a3;
- (void)setStatusRestrictedValue:(id)a3;
- (void)setStatusUnion:(id)a3;
@end

@implementation CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary

+ (NSSet)allowedStatusKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"restrictedBool";
  v6[1] = @"restrictedValue";
  v6[2] = @"intersection";
  v6[3] = @"union";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithRestrictedBool:(id)a3 withRestrictedValue:(id)a4 withIntersection:(id)a5 withUnion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setStatusRestrictedBool:v12];

  [v13 setStatusRestrictedValue:v11];
  [v13 setStatusIntersection:v10];

  [v13 setStatusUnion:v9];

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

  id v10 = +[CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"restrictedBool" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v27];
    id v12 = v27;
    statusRestrictedBool = self->_statusRestrictedBool;
    self->_statusRestrictedBool = v15;

    if (!v12)
    {
      id v26 = 0;
      v17 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"restrictedValue" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v26];
      id v12 = v26;
      statusRestrictedValue = self->_statusRestrictedValue;
      self->_statusRestrictedValue = v17;

      if (!v12)
      {
        id v25 = 0;
        v19 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"intersection" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v25];
        id v12 = v25;
        statusIntersection = self->_statusIntersection;
        self->_statusIntersection = v19;

        if (!v12)
        {
          id v24 = 0;
          v21 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"union" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v24];
          id v12 = v24;
          statusUnion = self->_statusUnion;
          self->_statusUnion = v21;
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
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"restrictedBool" withValue:self->_statusRestrictedBool dictSerializer:&__block_literal_global_138 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"restrictedValue" withValue:self->_statusRestrictedValue dictSerializer:&__block_literal_global_140 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"intersection" withValue:self->_statusIntersection dictSerializer:&__block_literal_global_142 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"union" withValue:self->_statusUnion dictSerializer:&__block_literal_global_144 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMDeviceListRestrictionsCommand_StatusRestrictionsDictionary;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(CEMDeviceListRestrictionsCommand_StatusBooleanDictionary *)self->_statusRestrictedBool copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMDeviceListRestrictionsCommand_StatusValueDictionary *)self->_statusRestrictedValue copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *)self->_statusIntersection copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary *)self->_statusUnion copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (CEMDeviceListRestrictionsCommand_StatusBooleanDictionary)statusRestrictedBool
{
  return self->_statusRestrictedBool;
}

- (void)setStatusRestrictedBool:(id)a3
{
}

- (CEMDeviceListRestrictionsCommand_StatusValueDictionary)statusRestrictedValue
{
  return self->_statusRestrictedValue;
}

- (void)setStatusRestrictedValue:(id)a3
{
}

- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusIntersection
{
  return self->_statusIntersection;
}

- (void)setStatusIntersection:(id)a3
{
}

- (CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary)statusUnion
{
  return self->_statusUnion;
}

- (void)setStatusUnion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUnion, 0);
  objc_storeStrong((id *)&self->_statusIntersection, 0);
  objc_storeStrong((id *)&self->_statusRestrictedValue, 0);

  objc_storeStrong((id *)&self->_statusRestrictedBool, 0);
}

@end