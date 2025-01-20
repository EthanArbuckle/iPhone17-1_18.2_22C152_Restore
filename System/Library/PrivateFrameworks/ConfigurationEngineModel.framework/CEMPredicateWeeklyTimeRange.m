@interface CEMPredicateWeeklyTimeRange
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithStartDay:(id)a3 withStartTime:(id)a4 withEndDay:(id)a5 withEndTime:(id)a6;
+ (id)buildWithCalendarIdentifier:(id)a3 withStartDay:(id)a4 withStartTime:(id)a5 withEndDay:(id)a6 withEndTime:(id)a7 withNotificationTimes:(id)a8;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSArray)payloadNotificationTimes;
- (NSNumber)payloadEndDay;
- (NSNumber)payloadStartDay;
- (NSString)payloadCalendarIdentifier;
- (NSString)payloadEndTime;
- (NSString)payloadStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadCalendarIdentifier:(id)a3;
- (void)setPayloadEndDay:(id)a3;
- (void)setPayloadEndTime:(id)a3;
- (void)setPayloadNotificationTimes:(id)a3;
- (void)setPayloadStartDay:(id)a3;
- (void)setPayloadStartTime:(id)a3;
@end

@implementation CEMPredicateWeeklyTimeRange

+ (NSString)registeredClassName
{
  return (NSString *)@"Predicates";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.predicate.weeklytimerange";
}

+ (NSSet)allowedPayloadKeys
{
  v6[7] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Type";
  v6[1] = @"CalendarIdentifier";
  v6[2] = @"StartDay";
  v6[3] = @"StartTime";
  v6[4] = @"EndDay";
  v6[5] = @"EndTime";
  v6[6] = @"NotificationTimes";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:7];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCalendarIdentifier:(id)a3 withStartDay:(id)a4 withStartTime:(id)a5 withEndDay:(id)a6 withEndTime:(id)a7 withNotificationTimes:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = (__CFString *)a3;
  v19 = objc_opt_new();
  [v19 setPayloadType:@"com.apple.predicate.weeklytimerange"];
  if (v18) {
    v20 = v18;
  }
  else {
    v20 = @"gregorian";
  }
  [v19 setPayloadCalendarIdentifier:v20];

  [v19 setPayloadStartDay:v17];
  [v19 setPayloadStartTime:v16];

  [v19 setPayloadEndDay:v15];
  [v19 setPayloadEndTime:v14];

  [v19 setPayloadNotificationTimes:v13];

  return v19;
}

+ (id)buildRequiredOnlyWithStartDay:(id)a3 withStartTime:(id)a4 withEndDay:(id)a5 withEndTime:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setPayloadType:@"com.apple.predicate.weeklytimerange"];
  [v13 setPayloadStartDay:v12];

  [v13 setPayloadStartTime:v11];
  [v13 setPayloadEndDay:v10];

  [v13 setPayloadEndTime:v9];

  return v13;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMPredicateWeeklyTimeRange allowedPayloadKeys];
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
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"StartDay" isRequired:1 defaultValue:0 error:&v33];
      id v14 = v33;
      payloadStartDay = self->_payloadStartDay;
      self->_payloadStartDay = v18;

      if (!v14)
      {
        id v32 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"StartTime" isRequired:1 defaultValue:0 error:&v32];
        id v14 = v32;
        payloadStartTime = self->_payloadStartTime;
        self->_payloadStartTime = v20;

        if (!v14)
        {
          id v31 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"EndDay" isRequired:1 defaultValue:0 error:&v31];
          id v14 = v31;
          payloadEndDay = self->_payloadEndDay;
          self->_payloadEndDay = v22;

          if (!v14)
          {
            id v30 = 0;
            v24 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EndTime" isRequired:1 defaultValue:0 error:&v30];
            id v14 = v30;
            payloadEndTime = self->_payloadEndTime;
            self->_payloadEndTime = v24;

            if (!v14)
            {
              id v29 = 0;
              v26 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"NotificationTimes" validator:&__block_literal_global_33 isRequired:0 defaultValue:0 error:&v29];
              id v14 = v29;
              payloadNotificationTimes = self->_payloadNotificationTimes;
              self->_payloadNotificationTimes = v26;
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

uint64_t __49__CEMPredicateWeeklyTimeRange_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Type" withValue:self->super._payloadType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"CalendarIdentifier" withValue:self->_payloadCalendarIdentifier isRequired:0 defaultValue:@"gregorian"];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"StartDay" withValue:self->_payloadStartDay isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"StartTime" withValue:self->_payloadStartTime isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"EndDay" withValue:self->_payloadEndDay isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"EndTime" withValue:self->_payloadEndTime isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v4 withKey:@"NotificationTimes" withValue:self->_payloadNotificationTimes itemSerializer:&__block_literal_global_81 isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

id __66__CEMPredicateWeeklyTimeRange_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CEMPredicateWeeklyTimeRange;
  v4 = [(CEMPredicateBase *)&v20 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->super._payloadType copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadCalendarIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadStartDay copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadStartTime copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadEndDay copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_payloadEndTime copy];
  id v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSArray *)self->_payloadNotificationTimes copy];
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

- (NSNumber)payloadStartDay
{
  return self->_payloadStartDay;
}

- (void)setPayloadStartDay:(id)a3
{
}

- (NSString)payloadStartTime
{
  return self->_payloadStartTime;
}

- (void)setPayloadStartTime:(id)a3
{
}

- (NSNumber)payloadEndDay
{
  return self->_payloadEndDay;
}

- (void)setPayloadEndDay:(id)a3
{
}

- (NSString)payloadEndTime
{
  return self->_payloadEndTime;
}

- (void)setPayloadEndTime:(id)a3
{
}

- (NSArray)payloadNotificationTimes
{
  return self->_payloadNotificationTimes;
}

- (void)setPayloadNotificationTimes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadNotificationTimes, 0);
  objc_storeStrong((id *)&self->_payloadEndTime, 0);
  objc_storeStrong((id *)&self->_payloadEndDay, 0);
  objc_storeStrong((id *)&self->_payloadStartTime, 0);
  objc_storeStrong((id *)&self->_payloadStartDay, 0);

  objc_storeStrong((id *)&self->_payloadCalendarIdentifier, 0);
}

@end