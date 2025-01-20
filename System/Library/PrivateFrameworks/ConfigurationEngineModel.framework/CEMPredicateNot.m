@interface CEMPredicateNot
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithPredicate:(id)a3;
+ (id)buildWithPredicate:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMPredicateBase)payloadPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadPredicate:(id)a3;
@end

@implementation CEMPredicateNot

+ (NSString)registeredClassName
{
  return (NSString *)@"Predicates";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.predicate.not";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"Predicate";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithPredicate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:@"com.apple.predicate.not"];
  [v4 setPayloadPredicate:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithPredicate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:@"com.apple.predicate.not"];
  [v4 setPayloadPredicate:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPredicateNot allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v21 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v21];
  id v14 = v21;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    v16 = [v6 objectForKeyedSubscript:@"Predicate"];
    id v20 = 0;
    v17 = +[CEMPredicateBase predicateForPayload:v16 error:&v20];
    id v14 = v20;
    payloadPredicate = self->_payloadPredicate;
    self->_payloadPredicate = v17;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Type" withValue:self->super._payloadType isRequired:1 defaultValue:0];
  v5 = [(CEMPayloadBase *)self->_payloadPredicate serializePayload];
  [v4 setObject:v5 forKeyedSubscript:@"Predicate"];

  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMPredicateNot;
  v4 = [(CEMPredicateBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMPredicateBase *)self->_payloadPredicate copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (CEMPredicateBase)payloadPredicate
{
  return self->_payloadPredicate;
}

- (void)setPayloadPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end