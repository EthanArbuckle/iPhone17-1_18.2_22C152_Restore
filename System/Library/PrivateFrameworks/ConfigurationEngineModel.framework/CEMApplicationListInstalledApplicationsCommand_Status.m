@interface CEMApplicationListInstalledApplicationsCommand_Status
+ (NSSet)allowedReasons;
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithInstalledApplicationList:(id)a3;
+ (id)buildWithInstalledApplicationList:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)statusInstalledApplicationList;
- (id)serializePayload;
- (void)setStatusInstalledApplicationList:(id)a3;
@end

@implementation CEMApplicationListInstalledApplicationsCommand_Status

+ (NSSet)allowedStatusKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"InstalledApplicationList";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)allowedReasons
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"NotSupervised";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithInstalledApplicationList:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusInstalledApplicationList:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithInstalledApplicationList:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setStatusInstalledApplicationList:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationListInstalledApplicationsCommand_Status allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"InstalledApplicationList" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v18];
    id v12 = v18;
    statusInstalledApplicationList = self->_statusInstalledApplicationList;
    self->_statusInstalledApplicationList = v15;

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
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"InstalledApplicationList" withValue:self->_statusInstalledApplicationList itemSerializer:&__block_literal_global_105 isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSArray)statusInstalledApplicationList
{
  return self->_statusInstalledApplicationList;
}

- (void)setStatusInstalledApplicationList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end