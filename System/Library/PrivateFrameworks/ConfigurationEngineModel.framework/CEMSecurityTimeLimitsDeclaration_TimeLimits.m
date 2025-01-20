@interface CEMSecurityTimeLimitsDeclaration_TimeLimits
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithWeekdayAllowance:(id)a3 withWeekdayCurfew:(id)a4 withWeekendAllowance:(id)a5 withWeekendCurfew:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayAllowance;
- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayCurfew;
- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendAllowance;
- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendCurfew;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadWeekdayAllowance:(id)a3;
- (void)setPayloadWeekdayCurfew:(id)a3;
- (void)setPayloadWeekendAllowance:(id)a3;
- (void)setPayloadWeekendCurfew:(id)a3;
@end

@implementation CEMSecurityTimeLimitsDeclaration_TimeLimits

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"weekday-allowance";
  v6[1] = @"weekday-curfew";
  v6[2] = @"weekend-allowance";
  v6[3] = @"weekend-curfew";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithWeekdayAllowance:(id)a3 withWeekdayCurfew:(id)a4 withWeekendAllowance:(id)a5 withWeekendCurfew:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadWeekdayAllowance:v12];

  [v13 setPayloadWeekdayCurfew:v11];
  [v13 setPayloadWeekendAllowance:v10];

  [v13 setPayloadWeekendCurfew:v9];

  return v13;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  id v10 = +[CEMSecurityTimeLimitsDeclaration_TimeLimits allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"weekday-allowance" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadWeekdayAllowance = self->_payloadWeekdayAllowance;
  self->_payloadWeekdayAllowance = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"weekday-curfew" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadWeekdayCurfew = self->_payloadWeekdayCurfew;
    self->_payloadWeekdayCurfew = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"weekend-allowance" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadWeekendAllowance = self->_payloadWeekendAllowance;
      self->_payloadWeekendAllowance = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"weekend-curfew" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadWeekendCurfew = self->_payloadWeekendCurfew;
        self->_payloadWeekendCurfew = v20;
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
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  payloadWeekdayAllowance = self->_payloadWeekdayAllowance;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke;
  v25[3] = &unk_2642C87E8;
  id v7 = v4;
  id v26 = v7;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"weekday-allowance" withValue:payloadWeekdayAllowance dictSerializer:v25 isRequired:0 defaultValue:0];
  payloadWeekdayCurfew = self->_payloadWeekdayCurfew;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_2;
  v23[3] = &unk_2642C87E8;
  id v9 = v7;
  id v24 = v9;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"weekday-curfew" withValue:payloadWeekdayCurfew dictSerializer:v23 isRequired:0 defaultValue:0];
  payloadWeekendAllowance = self->_payloadWeekendAllowance;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_3;
  v21[3] = &unk_2642C87E8;
  id v11 = v9;
  id v22 = v11;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"weekend-allowance" withValue:payloadWeekendAllowance dictSerializer:v21 isRequired:0 defaultValue:0];
  payloadWeekendCurfew = self->_payloadWeekendCurfew;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __82__CEMSecurityTimeLimitsDeclaration_TimeLimits_serializePayloadWithAssetProviders___block_invoke_4;
  v19 = &unk_2642C87E8;
  id v20 = v11;
  id v13 = v11;
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v5 withKey:@"weekend-curfew" withValue:payloadWeekendCurfew dictSerializer:&v16 isRequired:0 defaultValue:0];
  id v14 = objc_msgSend(v5, "copy", v16, v17, v18, v19);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMSecurityTimeLimitsDeclaration_TimeLimits;
  id v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(CEMSecurityTimeLimitsDeclaration_Allowance *)self->_payloadWeekdayAllowance copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMSecurityTimeLimitsDeclaration_Allowance *)self->_payloadWeekdayCurfew copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(CEMSecurityTimeLimitsDeclaration_Allowance *)self->_payloadWeekendAllowance copy];
  id v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(CEMSecurityTimeLimitsDeclaration_Allowance *)self->_payloadWeekendCurfew copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayAllowance
{
  return self->_payloadWeekdayAllowance;
}

- (void)setPayloadWeekdayAllowance:(id)a3
{
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekdayCurfew
{
  return self->_payloadWeekdayCurfew;
}

- (void)setPayloadWeekdayCurfew:(id)a3
{
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendAllowance
{
  return self->_payloadWeekendAllowance;
}

- (void)setPayloadWeekendAllowance:(id)a3
{
}

- (CEMSecurityTimeLimitsDeclaration_Allowance)payloadWeekendCurfew
{
  return self->_payloadWeekendCurfew;
}

- (void)setPayloadWeekendCurfew:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadWeekendCurfew, 0);
  objc_storeStrong((id *)&self->_payloadWeekendAllowance, 0);
  objc_storeStrong((id *)&self->_payloadWeekdayCurfew, 0);

  objc_storeStrong((id *)&self->_payloadWeekdayAllowance, 0);
}

@end