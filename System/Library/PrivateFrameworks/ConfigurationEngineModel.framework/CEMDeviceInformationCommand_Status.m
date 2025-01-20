@interface CEMDeviceInformationCommand_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithQueryResponses:(id)a3;
+ (id)buildWithQueryResponses:(id)a3 withErrorResponses:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMDeviceInformationCommand_StatusErrorResponses)statusErrorResponses;
- (CEMDeviceInformationCommand_StatusQueryResponses)statusQueryResponses;
- (id)serializePayload;
- (void)setStatusErrorResponses:(id)a3;
- (void)setStatusQueryResponses:(id)a3;
@end

@implementation CEMDeviceInformationCommand_Status

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"QueryResponses";
  v6[1] = @"ErrorResponses";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (id)buildWithQueryResponses:(id)a3 withErrorResponses:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusQueryResponses:v6];

  [v7 setStatusErrorResponses:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithQueryResponses:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusQueryResponses:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_Status allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"QueryResponses" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v21];
    id v12 = v21;
    statusQueryResponses = self->_statusQueryResponses;
    self->_statusQueryResponses = v15;

    if (!v12)
    {
      id v20 = 0;
      v17 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"ErrorResponses" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v20];
      id v12 = v20;
      statusErrorResponses = self->_statusErrorResponses;
      self->_statusErrorResponses = v17;
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
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"QueryResponses" withValue:self->_statusQueryResponses dictSerializer:&__block_literal_global_277 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"ErrorResponses" withValue:self->_statusErrorResponses dictSerializer:&__block_literal_global_279 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (CEMDeviceInformationCommand_StatusQueryResponses)statusQueryResponses
{
  return self->_statusQueryResponses;
}

- (void)setStatusQueryResponses:(id)a3
{
}

- (CEMDeviceInformationCommand_StatusErrorResponses)statusErrorResponses
{
  return self->_statusErrorResponses;
}

- (void)setStatusErrorResponses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusErrorResponses, 0);

  objc_storeStrong((id *)&self->_statusQueryResponses, 0);
}

@end