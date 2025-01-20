@interface CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withPath:(id)a6 withVersion:(id)a7 withUserElection:(id)a8;
+ (id)buildWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withContainerDisplayName:(id)a6 withContainerIdentifier:(id)a7 withPath:(id)a8 withVersion:(id)a9 withUserElection:(id)a10;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)statusBundleIdentifier;
- (NSString)statusContainerDisplayName;
- (NSString)statusContainerIdentifier;
- (NSString)statusDisplayName;
- (NSString)statusExtensionPoint;
- (NSString)statusPath;
- (NSString)statusUserElection;
- (NSString)statusVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusBundleIdentifier:(id)a3;
- (void)setStatusContainerDisplayName:(id)a3;
- (void)setStatusContainerIdentifier:(id)a3;
- (void)setStatusDisplayName:(id)a3;
- (void)setStatusExtensionPoint:(id)a3;
- (void)setStatusPath:(id)a3;
- (void)setStatusUserElection:(id)a3;
- (void)setStatusVersion:(id)a3;
@end

@implementation CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem

+ (NSSet)allowedStatusKeys
{
  v6[8] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"BundleIdentifier";
  v6[1] = @"ExtensionPoint";
  v6[2] = @"DisplayName";
  v6[3] = @"ContainerDisplayName";
  v6[4] = @"ContainerIdentifier";
  v6[5] = @"Path";
  v6[6] = @"Version";
  v6[7] = @"UserElection";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:8];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withContainerDisplayName:(id)a6 withContainerIdentifier:(id)a7 withPath:(id)a8 withVersion:(id)a9 withUserElection:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setStatusBundleIdentifier:v23];

  [v24 setStatusExtensionPoint:v22];
  [v24 setStatusDisplayName:v21];

  [v24 setStatusContainerDisplayName:v20];
  [v24 setStatusContainerIdentifier:v19];

  [v24 setStatusPath:v18];
  [v24 setStatusVersion:v17];

  [v24 setStatusUserElection:v16];

  return v24;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5 withPath:(id)a6 withVersion:(id)a7 withUserElection:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_opt_new();
  [v19 setStatusBundleIdentifier:v18];

  [v19 setStatusExtensionPoint:v17];
  [v19 setStatusDisplayName:v16];

  [v19 setStatusPath:v15];
  [v19 setStatusVersion:v14];

  [v19 setStatusUserElection:v13];

  return v19;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_17;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v41[0] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v39 = 0;
    id v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v39];
    id v12 = v39;
    statusBundleIdentifier = self->_statusBundleIdentifier;
    self->_statusBundleIdentifier = v15;

    if (!v12)
    {
      id v38 = 0;
      id v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ExtensionPoint" isRequired:1 defaultValue:0 error:&v38];
      id v12 = v38;
      statusExtensionPoint = self->_statusExtensionPoint;
      self->_statusExtensionPoint = v17;

      if (!v12)
      {
        id v37 = 0;
        id v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayName" isRequired:1 defaultValue:0 error:&v37];
        id v12 = v37;
        statusDisplayName = self->_statusDisplayName;
        self->_statusDisplayName = v19;

        if (!v12)
        {
          id v36 = 0;
          id v21 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ContainerDisplayName" isRequired:0 defaultValue:0 error:&v36];
          id v12 = v36;
          statusContainerDisplayName = self->_statusContainerDisplayName;
          self->_statusContainerDisplayName = v21;

          if (!v12)
          {
            id v35 = 0;
            id v23 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ContainerIdentifier" isRequired:0 defaultValue:0 error:&v35];
            id v12 = v35;
            statusContainerIdentifier = self->_statusContainerIdentifier;
            self->_statusContainerIdentifier = v23;

            if (!v12)
            {
              id v34 = 0;
              v25 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Path" isRequired:1 defaultValue:0 error:&v34];
              id v12 = v34;
              statusPath = self->_statusPath;
              self->_statusPath = v25;

              if (!v12)
              {
                id v33 = 0;
                v27 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Version" isRequired:1 defaultValue:0 error:&v33];
                id v12 = v33;
                statusVersion = self->_statusVersion;
                self->_statusVersion = v27;

                if (!v12)
                {
                  id v32 = 0;
                  v29 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserElection" isRequired:1 defaultValue:0 error:&v32];
                  id v12 = v32;
                  statusUserElection = self->_statusUserElection;
                  self->_statusUserElection = v29;
                }
              }
            }
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

LABEL_17:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BundleIdentifier" withValue:self->_statusBundleIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ExtensionPoint" withValue:self->_statusExtensionPoint isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"DisplayName" withValue:self->_statusDisplayName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ContainerDisplayName" withValue:self->_statusContainerDisplayName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ContainerIdentifier" withValue:self->_statusContainerIdentifier isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Path" withValue:self->_statusPath isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Version" withValue:self->_statusVersion isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"UserElection" withValue:self->_statusUserElection isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CEMApplicationListActiveNSExtensionsCommand_StatusExtensionsItem;
  v4 = [(CEMPayloadBase *)&v22 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusBundleIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusExtensionPoint copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusDisplayName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusContainerDisplayName copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusContainerIdentifier copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusPath copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusVersion copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_statusUserElection copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (NSString)statusBundleIdentifier
{
  return self->_statusBundleIdentifier;
}

- (void)setStatusBundleIdentifier:(id)a3
{
}

- (NSString)statusExtensionPoint
{
  return self->_statusExtensionPoint;
}

- (void)setStatusExtensionPoint:(id)a3
{
}

- (NSString)statusDisplayName
{
  return self->_statusDisplayName;
}

- (void)setStatusDisplayName:(id)a3
{
}

- (NSString)statusContainerDisplayName
{
  return self->_statusContainerDisplayName;
}

- (void)setStatusContainerDisplayName:(id)a3
{
}

- (NSString)statusContainerIdentifier
{
  return self->_statusContainerIdentifier;
}

- (void)setStatusContainerIdentifier:(id)a3
{
}

- (NSString)statusPath
{
  return self->_statusPath;
}

- (void)setStatusPath:(id)a3
{
}

- (NSString)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(id)a3
{
}

- (NSString)statusUserElection
{
  return self->_statusUserElection;
}

- (void)setStatusUserElection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUserElection, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusPath, 0);
  objc_storeStrong((id *)&self->_statusContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_statusContainerDisplayName, 0);
  objc_storeStrong((id *)&self->_statusDisplayName, 0);
  objc_storeStrong((id *)&self->_statusExtensionPoint, 0);

  objc_storeStrong((id *)&self->_statusBundleIdentifier, 0);
}

@end