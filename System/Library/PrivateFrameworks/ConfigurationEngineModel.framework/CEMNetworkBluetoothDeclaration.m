@interface CEMNetworkBluetoothDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withAllowBluetoothModification:(id)a4;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadAllowBluetoothModification;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadAllowBluetoothModification:(id)a3;
@end

@implementation CEMNetworkBluetoothDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.network.bluetooth";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowBluetoothModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"allowBluetoothModification";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withAllowBluetoothModification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.network.bluetooth"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA88];
  }
  [v7 setPayloadAllowBluetoothModification:v10];

  [v7 updateServerHash];

  return v7;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.network.bluetooth"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  id v10 = +[CEMNetworkBluetoothDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v7 withKey:@"allowBluetoothModification" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v17];

  id v14 = v17;
  payloadAllowBluetoothModification = self->_payloadAllowBluetoothModification;
  self->_payloadAllowBluetoothModification = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"allowBluetoothModification" withValue:self->_payloadAllowBluetoothModification isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMNetworkBluetoothDeclaration;
  v4 = [(CEMDeclarationBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadAllowBluetoothModification copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (NSNumber)payloadAllowBluetoothModification
{
  return self->_payloadAllowBluetoothModification;
}

- (void)setPayloadAllowBluetoothModification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end