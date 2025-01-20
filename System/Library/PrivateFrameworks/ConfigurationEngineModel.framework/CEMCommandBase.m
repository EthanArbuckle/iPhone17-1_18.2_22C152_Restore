@interface CEMCommandBase
+ (id)commandForData:(id)a3 error:(id *)a4;
+ (id)commandForPayload:(id)a3 error:(id *)a4;
- (BOOL)loadCommandFromDictionary:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (CEMAnyPayload)commandPayload;
- (NSNumber)commandRequiresNetworkTether;
- (NSString)commandDescription;
- (NSString)commandIdentifier;
- (NSString)commandType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (id)serializeAsDataWithError:(id *)a3;
- (int)executionLevel;
- (void)setCommandDescription:(id)a3;
- (void)setCommandIdentifier:(id)a3;
- (void)setCommandPayload:(id)a3;
- (void)setCommandRequiresNetworkTether:(id)a3;
- (void)setCommandType:(id)a3;
@end

@implementation CEMCommandBase

+ (id)commandForPayload:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"Type"];
  v7 = (void *)v6;
  v8 = @"(nil)";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  if (+[CEMRegisteredTypeResolver registeredClassWithIdentifier:v9])
  {
    id v10 = (id)objc_opt_new();
    id v17 = 0;
    [v10 loadCommandFromDictionary:v5 error:&v17];
    id v11 = v17;
    v12 = v11;
    if (!v11)
    {
      id v10 = v10;
      v15 = v10;
      goto LABEL_12;
    }
    if (!a4)
    {
      v15 = 0;
      goto LABEL_12;
    }
    id v13 = v11;
    v12 = v13;
LABEL_9:
    v15 = 0;
    *a4 = v13;
LABEL_12:

    goto LABEL_13;
  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v12 = [NSString stringWithFormat:@"Could not match command type: %@", v9];
    v19[0] = v12;
    id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v13 = [v14 errorWithDomain:@"error" code:1 userInfo:v10];
    goto LABEL_9;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)commandForData:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:a4];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = +[CEMCommandBase commandForPayload:v5 error:a4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)executionLevel
{
  return 2;
}

- (BOOL)loadCommandFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v27 = 0;
  v7 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v27];
  id v8 = v27;
  commandType = self->_commandType;
  self->_commandType = v7;

  if (v8) {
    goto LABEL_5;
  }
  id v26 = 0;
  id v10 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v26];
  id v8 = v26;
  commandIdentifier = self->_commandIdentifier;
  self->_commandIdentifier = v10;

  if (v8) {
    goto LABEL_5;
  }
  id v25 = 0;
  v12 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Description" isRequired:0 defaultValue:0 error:&v25];
  id v8 = v25;
  commandDescription = self->_commandDescription;
  self->_commandDescription = v12;

  if (v8
    || (id v24 = 0,
        [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"RequiresNetworkTether" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v24], v14 = (NSNumber *)objc_claimAutoreleasedReturnValue(), id v8 = v24, commandRequiresNetworkTether = self->_commandRequiresNetworkTether, self->_commandRequiresNetworkTether = v14, commandRequiresNetworkTether, v8))
  {
LABEL_5:
    BOOL v16 = 0;
    if (a4)
    {
LABEL_6:
      id v8 = v8;
      *a4 = v8;
    }
  }
  else
  {
    uint64_t v18 = [v6 objectForKeyedSubscript:@"Payload"];
    v19 = (void *)v18;
    v20 = (void *)MEMORY[0x263EFFA78];
    if (v18) {
      v20 = (void *)v18;
    }
    id v21 = v20;

    id v23 = 0;
    [(CEMPayloadBase *)self loadPayload:v21 error:&v23];

    id v22 = v23;
    id v8 = v22;
    BOOL v16 = v22 == 0;
    if (a4 && v22) {
      goto LABEL_6;
    }
  }

  return v16;
}

- (id)serialize
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Type" withValue:self->_commandType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Identifier" withValue:self->_commandIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Description" withValue:self->_commandDescription isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"RequiresNetworkTether" withValue:self->_commandRequiresNetworkTether isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  v4 = [(CEMPayloadBase *)self serializePayloadWithAssetProviders:0];
  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"Payload"];
  }
  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)serializeAsDataWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x263F08AC0];
  id v5 = [(CEMCommandBase *)self serialize];
  id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMCommandBase;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_commandType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_commandIdentifier copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_commandDescription copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_commandRequiresNetworkTether copy];
  v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(CEMAnyPayload *)self->_commandPayload copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (void)setCommandType:(id)a3
{
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (void)setCommandIdentifier:(id)a3
{
}

- (NSString)commandDescription
{
  return self->_commandDescription;
}

- (void)setCommandDescription:(id)a3
{
}

- (NSNumber)commandRequiresNetworkTether
{
  return self->_commandRequiresNetworkTether;
}

- (void)setCommandRequiresNetworkTether:(id)a3
{
}

- (CEMAnyPayload)commandPayload
{
  return self->_commandPayload;
}

- (void)setCommandPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPayload, 0);
  objc_storeStrong((id *)&self->_commandRequiresNetworkTether, 0);
  objc_storeStrong((id *)&self->_commandDescription, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);

  objc_storeStrong((id *)&self->_commandType, 0);
}

@end