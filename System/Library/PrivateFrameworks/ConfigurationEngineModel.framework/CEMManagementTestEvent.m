@interface CEMManagementTestEvent
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)build;
+ (id)buildRequiredOnly;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
@end

@implementation CEMManagementTestEvent

+ (NSString)registeredClassName
{
  return (NSString *)@"Events";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.event.management.test";
}

+ (NSSet)allowedPayloadKeys
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)build
{
  v2 = objc_opt_new();
  [v2 setPayloadType:@"com.apple.event.management.test"];

  return v2;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();
  [v2 setPayloadType:@"com.apple.event.management.test"];

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = a3;
  v8 = [v7 allKeys];
  v9 = [v6 setWithArray:v8];

  v10 = +[CEMManagementTestEvent allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v17 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v7 withKey:@"Type" isRequired:1 defaultValue:0 error:&v17];

  id v14 = v17;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Type" withValue:self->super._payloadType isRequired:1 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CEMManagementTestEvent;
  v4 = [(CEMEventBase *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

@end