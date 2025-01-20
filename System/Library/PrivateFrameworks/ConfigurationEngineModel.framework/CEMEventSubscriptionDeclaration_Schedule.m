@interface CEMEventSubscriptionDeclaration_Schedule
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithFrequency:(id)a3;
+ (id)buildWithFrequency:(id)a3 withLocalTime:(id)a4 withSpread:(id)a5 withDay:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadDay;
- (NSNumber)payloadSpread;
- (NSString)payloadFrequency;
- (NSString)payloadLocalTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDay:(id)a3;
- (void)setPayloadFrequency:(id)a3;
- (void)setPayloadLocalTime:(id)a3;
- (void)setPayloadSpread:(id)a3;
@end

@implementation CEMEventSubscriptionDeclaration_Schedule

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Frequency";
  v6[1] = @"LocalTime";
  v6[2] = @"Spread";
  v6[3] = @"Day";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithFrequency:(id)a3 withLocalTime:(id)a4 withSpread:(id)a5 withDay:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = (__CFString *)a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadFrequency:v12];

  if (v11) {
    v14 = v11;
  }
  else {
    v14 = @"00:00";
  }
  [v13 setPayloadLocalTime:v14];

  if (v10) {
    v15 = v10;
  }
  else {
    v15 = &unk_26C894808;
  }
  [v13 setPayloadSpread:v15];

  if (v9) {
    v16 = v9;
  }
  else {
    v16 = &unk_26C894820;
  }
  [v13 setPayloadDay:v16];

  return v13;
}

+ (id)buildRequiredOnlyWithFrequency:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadFrequency:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMEventSubscriptionDeclaration_Schedule allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Frequency" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadFrequency = self->_payloadFrequency;
  self->_payloadFrequency = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"LocalTime" isRequired:0 defaultValue:@"00:00" error:&v25];
    id v14 = v25;
    payloadLocalTime = self->_payloadLocalTime;
    self->_payloadLocalTime = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Spread" isRequired:0 defaultValue:&unk_26C894808 error:&v24];
      id v14 = v24;
      payloadSpread = self->_payloadSpread;
      self->_payloadSpread = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Day" isRequired:0 defaultValue:&unk_26C894820 error:&v23];
        id v14 = v23;
        payloadDay = self->_payloadDay;
        self->_payloadDay = v20;
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Frequency" withValue:self->_payloadFrequency isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"LocalTime" withValue:self->_payloadLocalTime isRequired:0 defaultValue:@"00:00"];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Spread" withValue:self->_payloadSpread isRequired:0 defaultValue:&unk_26C894808];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Day" withValue:self->_payloadDay isRequired:0 defaultValue:&unk_26C894820];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMEventSubscriptionDeclaration_Schedule;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadFrequency copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadLocalTime copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadSpread copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadDay copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadFrequency
{
  return self->_payloadFrequency;
}

- (void)setPayloadFrequency:(id)a3
{
}

- (NSString)payloadLocalTime
{
  return self->_payloadLocalTime;
}

- (void)setPayloadLocalTime:(id)a3
{
}

- (NSNumber)payloadSpread
{
  return self->_payloadSpread;
}

- (void)setPayloadSpread:(id)a3
{
}

- (NSNumber)payloadDay
{
  return self->_payloadDay;
}

- (void)setPayloadDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDay, 0);
  objc_storeStrong((id *)&self->_payloadSpread, 0);
  objc_storeStrong((id *)&self->_payloadLocalTime, 0);

  objc_storeStrong((id *)&self->_payloadFrequency, 0);
}

@end