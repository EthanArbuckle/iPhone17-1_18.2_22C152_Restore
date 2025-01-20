@interface CEMActivationBasicDeclaration_StatusInstalledConfigurationsItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withServerHash:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withServerHash:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)statusIdentifier;
- (NSString)statusServerHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusIdentifier:(id)a3;
- (void)setStatusServerHash:(id)a3;
@end

@implementation CEMActivationBasicDeclaration_StatusInstalledConfigurationsItem

+ (NSSet)allowedStatusKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Identifier";
  v6[1] = @"ServerHash";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithIdentifier:(id)a3 withServerHash:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusIdentifier:v6];

  [v7 setStatusServerHash:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withServerHash:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setStatusIdentifier:v6];

  [v7 setStatusServerHash:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMActivationBasicDeclaration_StatusInstalledConfigurationsItem allowedStatusKeys];
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
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Identifier" isRequired:1 defaultValue:0 error:&v21];
    id v12 = v21;
    statusIdentifier = self->_statusIdentifier;
    self->_statusIdentifier = v15;

    if (!v12)
    {
      id v20 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ServerHash" isRequired:1 defaultValue:0 error:&v20];
      id v12 = v20;
      statusServerHash = self->_statusServerHash;
      self->_statusServerHash = v17;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Identifier" withValue:self->_statusIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ServerHash" withValue:self->_statusServerHash isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMActivationBasicDeclaration_StatusInstalledConfigurationsItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusServerHash copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)statusIdentifier
{
  return self->_statusIdentifier;
}

- (void)setStatusIdentifier:(id)a3
{
}

- (NSString)statusServerHash
{
  return self->_statusServerHash;
}

- (void)setStatusServerHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusServerHash, 0);

  objc_storeStrong((id *)&self->_statusIdentifier, 0);
}

@end