@interface CEMPredicateAll
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithPredicates:(id)a3;
+ (id)buildWithPredicates:(id)a3;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadPredicates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadPredicates:(id)a3;
@end

@implementation CEMPredicateAll

+ (NSString)registeredClassName
{
  return (NSString *)@"Predicates";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.predicate.all";
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"Predicates";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:@"com.apple.predicate.all"];
  [v4 setPayloadPredicates:v3];

  return v4;
}

+ (id)buildRequiredOnlyWithPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadType:@"com.apple.predicate.all"];
  [v4 setPayloadPredicates:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPredicateAll allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v38 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v38];
  id v14 = v38;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    v17 = (void *)MEMORY[0x263EFF980];
    v18 = [v6 objectForKeyedSubscript:@"Predicates"];
    v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v20 = [v6 objectForKeyedSubscript:@"Predicates"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v31 = a4;
      v32 = v9;
      id v14 = 0;
      uint64_t v23 = *(void *)v35;
LABEL_6:
      uint64_t v24 = 0;
      v25 = v14;
      while (1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * v24);
        id v33 = v25;
        v27 = +[CEMPredicateBase predicateForPayload:error:](CEMPredicateBase, "predicateForPayload:error:", v26, &v33, v31);
        id v14 = v33;

        if (!v27) {
          break;
        }
        [v19 addObject:v27];

        ++v24;
        v25 = v14;
        if (v22 == v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v22) {
            goto LABEL_6;
          }
          break;
        }
      }

      v9 = v32;
      if (v14)
      {

        a4 = v31;
        if (v31) {
          goto LABEL_3;
        }
LABEL_14:
        BOOL v16 = 0;
        goto LABEL_17;
      }
    }
    else
    {
    }
    v28 = (NSArray *)[v19 copy];
    payloadPredicates = self->_payloadPredicates;
    self->_payloadPredicates = v28;

    id v14 = 0;
    BOOL v16 = 1;
    goto LABEL_17;
  }
  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  id v14 = v14;
  BOOL v16 = 0;
  *a4 = v14;
LABEL_17:

  return v16;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Type" withValue:self->super._payloadType isRequired:1 defaultValue:0];
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_payloadPredicates, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_payloadPredicates;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "serializePayload", (void)v15);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  [v4 setObject:v12 forKeyedSubscript:@"Predicates"];

  v13 = (void *)[v4 copy];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMPredicateAll;
  v4 = [(CEMPredicateBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSArray *)self->_payloadPredicates copy];
  uint64_t v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSArray)payloadPredicates
{
  return self->_payloadPredicates;
}

- (void)setPayloadPredicates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end