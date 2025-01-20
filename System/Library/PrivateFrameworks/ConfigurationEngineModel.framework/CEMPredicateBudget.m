@interface CEMPredicateBudget
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithMonitor:(id)a3 withTimeBudget:(id)a4;
+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withIdentifiersVersion2:(id)a6 withNotificationTimes:(id)a7 withTimeBudget:(id)a8;
+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withNotificationTimes:(id)a6 withTimeBudget:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadIdentifiers;
- (NSArray)payloadIdentifiersVersion2;
- (NSArray)payloadNotificationTimes;
- (NSArray)payloadTimeBudget;
- (NSString)payloadCalendarIdentifier;
- (NSString)payloadMonitor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadCalendarIdentifier:(id)a3;
- (void)setPayloadIdentifiers:(id)a3;
- (void)setPayloadIdentifiersVersion2:(id)a3;
- (void)setPayloadMonitor:(id)a3;
- (void)setPayloadNotificationTimes:(id)a3;
- (void)setPayloadTimeBudget:(id)a3;
@end

@implementation CEMPredicateBudget

+ (NSString)registeredClassName
{
  return (NSString *)@"Predicates";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.predicate.budget";
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"CalendarIdentifier";
  v6[2] = @"Monitor";
  v6[3] = @"Identifiers";
  v6[4] = @"IdentifiersVersion2";
  v6[5] = @"NotificationTimes";
  v6[6] = @"TimeBudget";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withIdentifiersVersion2:(id)a6 withNotificationTimes:(id)a7 withTimeBudget:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = (__CFString *)a3;
  v19 = objc_opt_new();
  [v19 setPayloadType:@"com.apple.predicate.budget"];
  if (v18) {
    v20 = v18;
  }
  else {
    v20 = @"gregorian";
  }
  [v19 setPayloadCalendarIdentifier:v20];

  [v19 setPayloadMonitor:v17];
  [v19 setPayloadIdentifiers:v16];

  [v19 setPayloadIdentifiersVersion2:v15];
  [v19 setPayloadNotificationTimes:v14];

  [v19 setPayloadTimeBudget:v13];

  return v19;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withMonitor:(id)a4 withIdentifiers:(id)a5 withNotificationTimes:(id)a6 withTimeBudget:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (__CFString *)a3;
  id v16 = objc_opt_new();
  [v16 setPayloadType:@"com.apple.predicate.budget"];
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = @"gregorian";
  }
  [v16 setPayloadCalendarIdentifier:v17];

  [v16 setPayloadMonitor:v14];
  [v16 setPayloadIdentifiers:v13];

  [v16 setPayloadNotificationTimes:v12];
  [v16 setPayloadTimeBudget:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithMonitor:(id)a3 withTimeBudget:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadType:@"com.apple.predicate.budget"];
  [v7 setPayloadMonitor:v6];

  [v7 setPayloadTimeBudget:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMPredicateBudget allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v35 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Type" isRequired:1 defaultValue:0 error:&v35];
  id v14 = v35;
  payloadType = self->super._payloadType;
  self->super._payloadType = v13;

  if (!v14)
  {
    id v34 = 0;
    id v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CalendarIdentifier" isRequired:0 defaultValue:@"gregorian" error:&v34];
    id v14 = v34;
    payloadCalendarIdentifier = self->_payloadCalendarIdentifier;
    self->_payloadCalendarIdentifier = v16;

    if (!v14)
    {
      id v33 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Monitor" isRequired:1 defaultValue:0 error:&v33];
      id v14 = v33;
      payloadMonitor = self->_payloadMonitor;
      self->_payloadMonitor = v18;

      if (!v14)
      {
        id v32 = 0;
        v20 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"Identifiers" validator:&__block_literal_global_31 isRequired:0 defaultValue:0 error:&v32];
        id v14 = v32;
        payloadIdentifiers = self->_payloadIdentifiers;
        self->_payloadIdentifiers = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"IdentifiersVersion2" validator:&__block_literal_global_88_0 isRequired:0 defaultValue:0 error:&v31];
          id v14 = v31;
          payloadIdentifiersVersion2 = self->_payloadIdentifiersVersion2;
          self->_payloadIdentifiersVersion2 = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"NotificationTimes" validator:&__block_literal_global_90 isRequired:0 defaultValue:0 error:&v30];
            id v14 = v30;
            payloadNotificationTimes = self->_payloadNotificationTimes;
            self->_payloadNotificationTimes = v24;

            if (!v14)
            {
              id v29 = 0;
              v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"TimeBudget" classType:objc_opt_class() nested:0 isRequired:1 defaultValue:0 error:&v29];
              id v14 = v29;
              payloadTimeBudget = self->_payloadTimeBudget;
              self->_payloadTimeBudget = v26;
            }
          }
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __40__CEMPredicateBudget_loadPayload_error___block_invoke_3(uint64_t a1, void *a2)
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v5 withKey:@"Monitor" withValue:self->_payloadMonitor isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"Identifiers" withValue:self->_payloadIdentifiers itemSerializer:&__block_literal_global_96 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"IdentifiersVersion2" withValue:self->_payloadIdentifiersVersion2 itemSerializer:&__block_literal_global_98 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"NotificationTimes" withValue:self->_payloadNotificationTimes itemSerializer:&__block_literal_global_100 isRequired:0 defaultValue:0];
  payloadTimeBudget = self->_payloadTimeBudget;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_4;
  v10[3] = &unk_2642C9510;
  id v11 = v4;
  id v7 = v4;
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v5 withKey:@"TimeBudget" withValue:payloadTimeBudget itemSerializer:v10 isRequired:1 defaultValue:0];
  v8 = (void *)[v5 copy];

  return v8;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __57__CEMPredicateBudget_serializePayloadWithAssetProviders___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 serializePayloadWithAssetProviders:*(void *)(a1 + 32)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMPredicateBudget;
  id v4 = [(CEMPredicateBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCalendarIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadMonitor copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSArray *)self->_payloadIdentifiers copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSArray *)self->_payloadIdentifiersVersion2 copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSArray *)self->_payloadNotificationTimes copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadTimeBudget copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  return v4;
}

- (NSString)payloadCalendarIdentifier
{
  return self->_payloadCalendarIdentifier;
}

- (void)setPayloadCalendarIdentifier:(id)a3
{
}

- (NSString)payloadMonitor
{
  return self->_payloadMonitor;
}

- (void)setPayloadMonitor:(id)a3
{
}

- (NSArray)payloadIdentifiers
{
  return self->_payloadIdentifiers;
}

- (void)setPayloadIdentifiers:(id)a3
{
}

- (NSArray)payloadIdentifiersVersion2
{
  return self->_payloadIdentifiersVersion2;
}

- (void)setPayloadIdentifiersVersion2:(id)a3
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
  objc_storeStrong((id *)&self->_payloadIdentifiersVersion2, 0);
  objc_storeStrong((id *)&self->_payloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_payloadMonitor, 0);

  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

uint64_t __55__CEMPredicateBudget_TimeBudgetItem_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __72__CEMPredicateBudget_TimeBudgetItem_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

@end