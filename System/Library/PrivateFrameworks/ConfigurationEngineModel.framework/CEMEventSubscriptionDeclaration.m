@interface CEMEventSubscriptionDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEvents:(id)a4;
+ (id)buildWithIdentifier:(id)a3 withEvents:(id)a4 withSchedule:(id)a5;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (CEMEventSubscriptionDeclaration_Schedule)payloadSchedule;
- (NSArray)payloadEvents;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadEvents:(id)a3;
- (void)setPayloadSchedule:(id)a3;
@end

@implementation CEMEventSubscriptionDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.event.subscription";
}

+ (id)profileType
{
  return &stru_26C838878;
}

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Events";
  v6[1] = @"Schedule";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withEvents:(id)a4 withSchedule:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  [v10 setDeclarationType:@"com.apple.configuration.event.subscription"];
  if (v7)
  {
    [v10 setDeclarationIdentifier:v7];
  }
  else
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    [v10 setDeclarationIdentifier:v12];
  }
  [v10 setPayloadEvents:v9];

  [v10 setPayloadSchedule:v8];
  [v10 updateServerHash];

  return v10;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3 withEvents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  [v7 setDeclarationType:@"com.apple.configuration.event.subscription"];
  if (v5)
  {
    [v7 setDeclarationIdentifier:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08C38] UUID];
    id v9 = [v8 UUIDString];
    [v7 setDeclarationIdentifier:v9];
  }
  [v7 setPayloadEvents:v6];

  [v7 updateServerHash];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMEventSubscriptionDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v13 = (void *)MEMORY[0x263EFF980];
  v14 = [v6 objectForKeyedSubscript:@"Events"];
  v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = [v6 objectForKeyedSubscript:@"Events"];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v31 = a4;
    v32 = v9;
    id v19 = 0;
    uint64_t v20 = *(void *)v36;
LABEL_3:
    uint64_t v21 = 0;
    v22 = v19;
    while (1)
    {
      if (*(void *)v36 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * v21);
      id v34 = v22;
      v24 = +[CEMEventBase eventForPayload:v23 error:&v34];
      id v19 = v34;

      if (!v24) {
        break;
      }
      [v15 addObject:v24];

      ++v21;
      v22 = v19;
      if (v18 == v21)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v18) {
          goto LABEL_3;
        }
        break;
      }
    }

    id v9 = v32;
    a4 = v31;
    if (v19) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v25 = (NSArray *)[v15 copy];
  payloadEvents = self->_payloadEvents;
  self->_payloadEvents = v25;

  id v33 = 0;
  v27 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Schedule" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v33];
  id v19 = v33;
  payloadSchedule = self->_payloadSchedule;
  self->_payloadSchedule = v27;

  if (!v19)
  {

    BOOL v29 = 1;
    goto LABEL_17;
  }
LABEL_13:

  if (a4)
  {
    id v19 = v19;
    BOOL v29 = 0;
    *a4 = v19;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_17:

  return v29;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_payloadEvents, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = self->_payloadEvents;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) serializePayload];
        [v6 addObject:v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  [v5 setObject:v13 forKeyedSubscript:@"Events"];

  payloadSchedule = self->_payloadSchedule;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__CEMEventSubscriptionDeclaration_serializePayloadWithAssetProviders___block_invoke;
  v18[3] = &unk_2642C87E8;
  id v19 = v4;
  id v15 = v4;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Schedule" withValue:payloadSchedule dictSerializer:v18 isRequired:0 defaultValue:0];
  v16 = (void *)[v5 copy];

  return v16;
}

uint64_t __70__CEMEventSubscriptionDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMEventSubscriptionDeclaration;
  id v4 = [(CEMDeclarationBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_payloadEvents copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(CEMEventSubscriptionDeclaration_Schedule *)self->_payloadSchedule copy];
  uint64_t v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (NSArray)payloadEvents
{
  return self->_payloadEvents;
}

- (void)setPayloadEvents:(id)a3
{
}

- (CEMEventSubscriptionDeclaration_Schedule)payloadSchedule
{
  return self->_payloadSchedule;
}

- (void)setPayloadSchedule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSchedule, 0);

  objc_storeStrong((id *)&self->_payloadEvents, 0);
}

@end