@interface CEMPredicateCompositeBudget
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithMonitors:(id)a3 withTimeBudget:(id)a4;
+ (id)buildWithCalendarIdentifier:(id)a3 withMonitors:(id)a4 withNotificationTimes:(id)a5 withTimeBudget:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMPredicateCompositeBudget_Monitors)payloadMonitors;
- (NSArray)payloadNotificationTimes;
- (NSArray)payloadTimeBudget;
- (NSString)payloadCalendarIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadCalendarIdentifier:(id)a3;
- (void)setPayloadMonitors:(id)a3;
- (void)setPayloadNotificationTimes:(id)a3;
- (void)setPayloadTimeBudget:(id)a3;
@end

@implementation CEMPredicateCompositeBudget

+ (NSString)registeredClassName
{
  return (NSString *)@"Predicates";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.predicate.compositebudget";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"CalendarIdentifier";
  v6[2] = @"Monitors";
  v6[3] = @"NotificationTimes";
  v6[4] = @"TimeBudget";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitors:(id)a4 withNotificationTimes:(id)a5 withTimeBudget:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = (__CFString *)a3;
  v13 = objc_opt_new();
  [v13 setPayloadType:@"com.apple.predicate.compositebudget"];
  if (v12) {
    v14 = v12;
  }
  else {
    v14 = @"gregorian";
  }
  [v13 setPayloadCalendarIdentifier:v14];

  [v13 setPayloadMonitors:v11];
  [v13 setPayloadNotificationTimes:v10];

  [v13 setPayloadTimeBudget:v9];

  return v13;
}

+ (id)buildRequiredOnlyWithMonitors:(id)a3 withTimeBudget:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadType:@"com.apple.predicate.compositebudget"];
  [v7 setPayloadMonitors:v6];

  [v7 setPayloadTimeBudget:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMPredicateCompositeBudget allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalendarIdentifier" isRequired:0 defaultValue:@"gregorian" error:&v28];
    id v14 = v28;
    payloadCalendarIdentifier = self->_payloadCalendarIdentifier;
    self->_payloadCalendarIdentifier = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"Monitors" classType:objc_opt_class() isRequired:1 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadMonitors = self->_payloadMonitors;
      self->_payloadMonitors = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"NotificationTimes" validator:&__block_literal_global_32 isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadNotificationTimes = self->_payloadNotificationTimes;
        self->_payloadNotificationTimes = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"TimeBudget" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadTimeBudget = self->_payloadTimeBudget;
          self->_payloadTimeBudget = v22;
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __49__CEMPredicateCompositeBudget_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Type" withValue:self->super._payloadType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"CalendarIdentifier" withValue:self->_payloadCalendarIdentifier isRequired:0 defaultValue:@"gregorian"];
  payloadMonitors = self->_payloadMonitors;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke;
  v17[3] = &unk_2642C87E8;
  id v7 = v4;
  id v18 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"Monitors" withValue:payloadMonitors dictSerializer:v17 isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"NotificationTimes" withValue:self->_payloadNotificationTimes itemSerializer:&__block_literal_global_78 isRequired:0 defaultValue:0];
  payloadTimeBudget = self->_payloadTimeBudget;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_3;
  v15 = &unk_2642C95B8;
  id v16 = v7;
  id v9 = v7;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"TimeBudget" withValue:payloadTimeBudget itemSerializer:&v12 isRequired:1 defaultValue:0];
  id v10 = objc_msgSend(v5, "copy", v12, v13, v14, v15);

  return v10;
}

uint64_t __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

id __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __66__CEMPredicateCompositeBudget_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMPredicateCompositeBudget;
  id v4 = [(CEMPredicateBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCalendarIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(CEMPredicateCompositeBudget_Monitors *)self->_payloadMonitors copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadNotificationTimes copy];
  uint64_t v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadTimeBudget copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSString)payloadCalendarIdentifier
{
  return self->_payloadCalendarIdentifier;
}

- (void)setPayloadCalendarIdentifier:(id)a3
{
}

- (CEMPredicateCompositeBudget_Monitors)payloadMonitors
{
  return self->_payloadMonitors;
}

- (void)setPayloadMonitors:(id)a3
{
}

- (NSArray)payloadNotificationTimes
{
  return self->_payloadNotificationTimes;
}

- (void)setPayloadNotificationTimes:(id)a3
{
}

- (NSArray)payloadTimeBudget
{
  return self->_payloadTimeBudget;
}

- (void)setPayloadTimeBudget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTimeBudget, 0);
  objc_storeStrong((id *)&self->_payloadNotificationTimes, 0);
  objc_storeStrong((id *)&self->_payloadMonitors, 0);

  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__CEMPredicateCompositeBudget_Monitors_loadPayload_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __75__CEMPredicateCompositeBudget_Monitors_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __64__CEMPredicateCompositeBudget_TimeBudgetItem_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __81__CEMPredicateCompositeBudget_TimeBudgetItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end