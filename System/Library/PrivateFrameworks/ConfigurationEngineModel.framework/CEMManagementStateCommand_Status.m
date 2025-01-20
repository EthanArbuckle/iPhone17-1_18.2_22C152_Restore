@interface CEMManagementStateCommand_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithCommands:(id)a3 withDeclarations:(id)a4;
+ (id)buildWithCommands:(id)a3 withDeclarations:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)statusCommands;
- (NSArray)statusDeclarations;
- (id)serializePayload;
- (void)setStatusCommands:(id)a3;
- (void)setStatusDeclarations:(id)a3;
@end

@implementation CEMManagementStateCommand_Status

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Commands";
  v6[1] = @"Declarations";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (id)buildWithCommands:(id)a3 withDeclarations:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusCommands:v6];

  [v7 setStatusDeclarations:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithCommands:(id)a3 withDeclarations:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusCommands:v6];

  [v7 setStatusDeclarations:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMManagementStateCommand_Status allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Commands" validator:&__block_literal_global_17 isRequired:1 defaultValue:0 error:&v21];
    id v12 = v21;
    statusCommands = self->_statusCommands;
    self->_statusCommands = v15;

    if (!v12)
    {
      id v20 = 0;
      v17 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Declarations" validator:&__block_literal_global_83 isRequired:1 defaultValue:0 error:&v20];
      id v12 = v20;
      statusDeclarations = self->_statusDeclarations;
      self->_statusDeclarations = v17;
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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"Commands" withValue:self->_statusCommands itemSerializer:&__block_literal_global_86 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"Declarations" withValue:self->_statusDeclarations itemSerializer:&__block_literal_global_88 isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSArray)statusCommands
{
  return self->_statusCommands;
}

- (void)setStatusCommands:(id)a3
{
}

- (NSArray)statusDeclarations
{
  return self->_statusDeclarations;
}

- (void)setStatusDeclarations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDeclarations, 0);

  objc_storeStrong((id *)&self->_statusCommands, 0);
}

@end