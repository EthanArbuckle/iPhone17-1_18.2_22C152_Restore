@interface CEMDeviceInformationCommand_StatusErrorResponsesItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithCode:(id)a3;
+ (id)buildWithCode:(id)a3 withErrorChain:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)statusErrorChain;
- (NSString)statusCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusCode:(id)a3;
- (void)setStatusErrorChain:(id)a3;
@end

@implementation CEMDeviceInformationCommand_StatusErrorResponsesItem

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Code";
  v6[1] = @"ErrorChain";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCode:(id)a3 withErrorChain:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusCode:v6];

  [v7 setStatusErrorChain:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusCode:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_StatusErrorResponsesItem allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Code" isRequired:1 defaultValue:0 error:&v21];
    id v12 = v21;
    statusCode = self->_statusCode;
    self->_statusCode = v15;

    if (!v12)
    {
      id v20 = 0;
      v17 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ErrorChain" validator:&__block_literal_global_827 isRequired:0 defaultValue:0 error:&v20];
      id v12 = v20;
      statusErrorChain = self->_statusErrorChain;
      self->_statusErrorChain = v17;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Code" withValue:self->_statusCode isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"ErrorChain" withValue:self->_statusErrorChain itemSerializer:&__block_literal_global_829 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMDeviceInformationCommand_StatusErrorResponsesItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusCode copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_statusErrorChain copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSArray)statusErrorChain
{
  return self->_statusErrorChain;
}

- (void)setStatusErrorChain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusErrorChain, 0);

  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end