@interface CEMSystemMigrationDeclaration_CustomBehaviorItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithContext:(id)a3 withPaths:(id)a4;
+ (id)buildWithContext:(id)a3 withPaths:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadPaths;
- (NSString)payloadContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadContext:(id)a3;
- (void)setPayloadPaths:(id)a3;
@end

@implementation CEMSystemMigrationDeclaration_CustomBehaviorItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Context";
  v6[1] = @"Paths";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithContext:(id)a3 withPaths:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadContext:v6];

  [v7 setPayloadPaths:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithContext:(id)a3 withPaths:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadContext:v6];

  [v7 setPayloadPaths:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemMigrationDeclaration_CustomBehaviorItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Context" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadContext = self->_payloadContext;
  self->_payloadContext = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Paths" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadPaths = self->_payloadPaths;
    self->_payloadPaths = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Context" withValue:self->_payloadContext isRequired:1 defaultValue:0];
  payloadPaths = self->_payloadPaths;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__CEMSystemMigrationDeclaration_CustomBehaviorItem_serializePayloadWithAssetProviders___block_invoke;
  v10[3] = &unk_2642C9838;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Paths" withValue:payloadPaths itemSerializer:v10 isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMSystemMigrationDeclaration_CustomBehaviorItem;
  id v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadContext copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadPaths copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadContext
{
  return self->_payloadContext;
}

- (void)setPayloadContext:(id)a3
{
}

- (NSArray)payloadPaths
{
  return self->_payloadPaths;
}

- (void)setPayloadPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPaths, 0);

  objc_storeStrong((id *)&self->_payloadContext, 0);
}

@end