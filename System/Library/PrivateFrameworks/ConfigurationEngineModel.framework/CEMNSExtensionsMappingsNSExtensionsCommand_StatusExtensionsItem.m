@interface CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5;
+ (id)buildWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)statusDisplayName;
- (NSString)statusExtensionPoint;
- (NSString)statusIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusDisplayName:(id)a3;
- (void)setStatusExtensionPoint:(id)a3;
- (void)setStatusIdentifier:(id)a3;
@end

@implementation CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem

+ (NSSet)allowedStatusKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"ExtensionPoint";
  v6[2] = @"DisplayName";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusIdentifier:v9];

  [v10 setStatusExtensionPoint:v8];
  [v10 setStatusDisplayName:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withExtensionPoint:(id)a4 withDisplayName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setStatusIdentifier:v9];

  [v10 setStatusExtensionPoint:v8];
  [v10 setStatusDisplayName:v7];

  return v10;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v26[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v24 = 0;
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v24];
    id v12 = v24;
    statusIdentifier = self->_statusIdentifier;
    self->_statusIdentifier = v15;

    if (!v12)
    {
      id v23 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ExtensionPoint" isRequired:1 defaultValue:0 error:&v23];
      id v12 = v23;
      statusExtensionPoint = self->_statusExtensionPoint;
      self->_statusExtensionPoint = v17;

      if (!v12)
      {
        id v22 = 0;
        v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DisplayName" isRequired:1 defaultValue:0 error:&v22];
        id v12 = v22;
        statusDisplayName = self->_statusDisplayName;
        self->_statusDisplayName = v19;
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

LABEL_12:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Identifier" withValue:self->_statusIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ExtensionPoint" withValue:self->_statusExtensionPoint isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"DisplayName" withValue:self->_statusDisplayName isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMNSExtensionsMappingsNSExtensionsCommand_StatusExtensionsItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusExtensionPoint copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusDisplayName copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDisplayName, 0);
  objc_storeStrong((id *)&self->_statusExtensionPoint, 0);

  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end