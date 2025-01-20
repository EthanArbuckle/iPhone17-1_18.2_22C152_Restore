@interface CEMApplicationLoginItemsDeclaration_LoginItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithPath:(id)a3;
+ (id)buildWithPath:(id)a3 withHide:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadHide;
- (NSString)payloadPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadHide:(id)a3;
- (void)setPayloadPath:(id)a3;
@end

@implementation CEMApplicationLoginItemsDeclaration_LoginItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Path";
  v6[1] = @"Hide";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithPath:(id)a3 withHide:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadPath:v6];

  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = (id)MEMORY[0x263EFFA80];
  }
  [v7 setPayloadHide:v8];

  return v7;
}

+ (id)buildRequiredOnlyWithPath:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadPath:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationLoginItemsDeclaration_LoginItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Path" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadPath = self->_payloadPath;
  self->_payloadPath = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Hide" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v19];
    id v14 = v19;
    payloadHide = self->_payloadHide;
    self->_payloadHide = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Path" withValue:self->_payloadPath isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"Hide" withValue:self->_payloadHide isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMApplicationLoginItemsDeclaration_LoginItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadPath copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadHide copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadPath
{
  return self->_payloadPath;
}

- (void)setPayloadPath:(id)a3
{
}

- (NSNumber)payloadHide
{
  return self->_payloadHide;
}

- (void)setPayloadHide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadHide, 0);

  objc_storeStrong((id *)&self->_payloadPath, 0);
}

@end