@interface CEMDeviceListRestrictionsCommand_StatusBooleanDictionaryANYrestrictionname
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithValue:(id)a3;
+ (id)buildWithValue:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)statusValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusValue:(id)a3;
@end

@implementation CEMDeviceListRestrictionsCommand_StatusBooleanDictionaryANYrestrictionname

+ (NSSet)allowedStatusKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"value";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithValue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusValue:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithValue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusValue:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceListRestrictionsCommand_StatusBooleanDictionaryANYrestrictionname allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v20[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v18 = 0;
    v15 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"value" isRequired:1 defaultValue:0 error:&v18];
    id v12 = v18;
    statusValue = self->_statusValue;
    self->_statusValue = v15;

    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_9:
  return v14;
}

- (id)serializePayload
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"value" withValue:self->_statusValue isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMDeviceListRestrictionsCommand_StatusBooleanDictionaryANYrestrictionname;
  v4 = [(CEMPayloadBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_statusValue copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSNumber)statusValue
{
  return self->_statusValue;
}

- (void)setStatusValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end