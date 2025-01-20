@interface CEMSecurityTimeLimitsDeclaration_Allowance
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithEnabled:(id)a3 withRangeType:(id)a4;
+ (id)buildWithEnabled:(id)a3 withRangeType:(id)a4 withStart:(id)a5 withEnd:(id)a6 withSecondsPerDay:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadEnabled;
- (NSNumber)payloadRangeType;
- (NSNumber)payloadSecondsPerDay;
- (NSString)payloadEnd;
- (NSString)payloadStart;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadEnabled:(id)a3;
- (void)setPayloadEnd:(id)a3;
- (void)setPayloadRangeType:(id)a3;
- (void)setPayloadSecondsPerDay:(id)a3;
- (void)setPayloadStart:(id)a3;
@end

@implementation CEMSecurityTimeLimitsDeclaration_Allowance

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"enabled";
  v6[1] = @"rangeType";
  v6[2] = @"start";
  v6[3] = @"end";
  v6[4] = @"secondsPerDay";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEnabled:(id)a3 withRangeType:(id)a4 withStart:(id)a5 withEnd:(id)a6 withSecondsPerDay:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setPayloadEnabled:v15];

  [v16 setPayloadRangeType:v14];
  [v16 setPayloadStart:v13];

  [v16 setPayloadEnd:v12];
  [v16 setPayloadSecondsPerDay:v11];

  return v16;
}

+ (id)buildRequiredOnlyWithEnabled:(id)a3 withRangeType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadEnabled:v6];

  [v7 setPayloadRangeType:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMSecurityTimeLimitsDeclaration_Allowance allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"enabled" isRequired:1 defaultValue:0 error:&v29];
  id v14 = v29;
  payloadEnabled = self->_payloadEnabled;
  self->_payloadEnabled = v13;

  if (!v14)
  {
    id v28 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"rangeType" isRequired:1 defaultValue:0 error:&v28];
    id v14 = v28;
    payloadRangeType = self->_payloadRangeType;
    self->_payloadRangeType = v16;

    if (!v14)
    {
      id v27 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"start" isRequired:0 defaultValue:0 error:&v27];
      id v14 = v27;
      payloadStart = self->_payloadStart;
      self->_payloadStart = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"end" isRequired:0 defaultValue:0 error:&v26];
        id v14 = v26;
        payloadEnd = self->_payloadEnd;
        self->_payloadEnd = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"secondsPerDay" isRequired:0 defaultValue:0 error:&v25];
          id v14 = v25;
          payloadSecondsPerDay = self->_payloadSecondsPerDay;
          self->_payloadSecondsPerDay = v22;
        }
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
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"enabled" withValue:self->_payloadEnabled isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"rangeType" withValue:self->_payloadRangeType isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"start" withValue:self->_payloadStart isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"end" withValue:self->_payloadEnd isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"secondsPerDay" withValue:self->_payloadSecondsPerDay isRequired:0 defaultValue:0];
  id v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMSecurityTimeLimitsDeclaration_Allowance;
  v4 = [(CEMPayloadBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadEnabled copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadRangeType copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadStart copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadEnd copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadSecondsPerDay copy];
  id v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (NSNumber)payloadEnabled
{
  return self->_payloadEnabled;
}

- (void)setPayloadEnabled:(id)a3
{
}

- (NSNumber)payloadRangeType
{
  return self->_payloadRangeType;
}

- (void)setPayloadRangeType:(id)a3
{
}

- (NSString)payloadStart
{
  return self->_payloadStart;
}

- (void)setPayloadStart:(id)a3
{
}

- (NSString)payloadEnd
{
  return self->_payloadEnd;
}

- (void)setPayloadEnd:(id)a3
{
}

- (NSNumber)payloadSecondsPerDay
{
  return self->_payloadSecondsPerDay;
}

- (void)setPayloadSecondsPerDay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadSecondsPerDay, 0);
  objc_storeStrong((id *)&self->_payloadEnd, 0);
  objc_storeStrong((id *)&self->_payloadStart, 0);
  objc_storeStrong((id *)&self->_payloadRangeType, 0);

  objc_storeStrong((id *)&self->_payloadEnabled, 0);
}

@end