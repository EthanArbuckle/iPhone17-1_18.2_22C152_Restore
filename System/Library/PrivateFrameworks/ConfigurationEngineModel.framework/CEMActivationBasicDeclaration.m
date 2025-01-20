@interface CEMActivationBasicDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
@end

@implementation CEMActivationBasicDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.activation.basic";
}

+ (NSSet)allowedPayloadKeys
{
  v2 = objc_opt_new();

  return (NSSet *)v2;
}

+ (id)buildWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.activation.basic"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.activation.basic"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [a3 allKeys];
  v7 = [v5 setWithArray:v6];

  v8 = +[CEMActivationBasicDeclaration allowedPayloadKeys];
  [v7 minusSet:v8];

  v9 = (NSSet *)[v7 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v9;

  return 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEMActivationBasicDeclaration;
  return [(CEMDeclarationBase *)&v4 copyWithZone:a3];
}

uint64_t __56__CEMActivationBasicDeclaration_Status_serializePayload__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayload];
}

@end