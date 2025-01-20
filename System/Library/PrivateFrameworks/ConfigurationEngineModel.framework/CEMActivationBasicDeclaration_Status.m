@interface CEMActivationBasicDeclaration_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithInstalledConfigurations:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)statusInstalledConfigurations;
- (id)serializePayload;
- (void)setStatusInstalledConfigurations:(id)a3;
@end

@implementation CEMActivationBasicDeclaration_Status

+ (NSSet)allowedStatusKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"InstalledConfigurations";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (id)buildWithInstalledConfigurations:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusInstalledConfigurations:v3];

  return v4;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMActivationBasicDeclaration_Status allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"InstalledConfigurations" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v18];
    id v12 = v18;
    statusInstalledConfigurations = self->_statusInstalledConfigurations;
    self->_statusInstalledConfigurations = v15;

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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"InstalledConfigurations" withValue:self->_statusInstalledConfigurations itemSerializer:&__block_literal_global_0 isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSArray)statusInstalledConfigurations
{
  return self->_statusInstalledConfigurations;
}

- (void)setStatusInstalledConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end