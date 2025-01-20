@interface CEMPredicateCompositeBudget_TimeBudgetItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithSeconds:(id)a3;
+ (id)buildWithSeconds:(id)a3 withDays:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadDays;
- (NSNumber)payloadSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDays:(id)a3;
- (void)setPayloadSeconds:(id)a3;
@end

@implementation CEMPredicateCompositeBudget_TimeBudgetItem

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Seconds";
  v6[1] = @"Days";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithSeconds:(id)a3 withDays:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadSeconds:v6];

  [v7 setPayloadDays:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithSeconds:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadSeconds:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPredicateCompositeBudget_TimeBudgetItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Seconds" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadSeconds = self->_payloadSeconds;
  self->_payloadSeconds = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Days" validator:&__block_literal_global_229 isRequired:0 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadDays = self->_payloadDays;
    self->_payloadDays = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Seconds" withValue:self->_payloadSeconds isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"Days" withValue:self->_payloadDays itemSerializer:&__block_literal_global_231 isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMPredicateCompositeBudget_TimeBudgetItem;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadSeconds copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadDays copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSNumber)payloadSeconds
{
  return self->_payloadSeconds;
}

- (void)setPayloadSeconds:(id)a3
{
}

- (NSArray)payloadDays
{
  return self->_payloadDays;
}

- (void)setPayloadDays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDays, 0);

  objc_storeStrong((id *)&self->_payloadSeconds, 0);
}

@end