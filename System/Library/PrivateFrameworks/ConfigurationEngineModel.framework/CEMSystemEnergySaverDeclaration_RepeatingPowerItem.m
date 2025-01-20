@interface CEMSystemEnergySaverDeclaration_RepeatingPowerItem
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithEventtype:(id)a3;
+ (id)buildWithEventtype:(id)a3 withWeekdays:(id)a4 withTime:(id)a5;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadTime;
- (NSNumber)payloadWeekdays;
- (NSString)payloadEventtype;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadEventtype:(id)a3;
- (void)setPayloadTime:(id)a3;
- (void)setPayloadWeekdays:(id)a3;
@end

@implementation CEMSystemEnergySaverDeclaration_RepeatingPowerItem

+ (NSSet)allowedPayloadKeys
{
  v6[3] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"eventtype";
  v6[1] = @"weekdays";
  v6[2] = @"time";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:3];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithEventtype:(id)a3 withWeekdays:(id)a4 withTime:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setPayloadEventtype:v9];

  [v10 setPayloadWeekdays:v8];
  [v10 setPayloadTime:v7];

  return v10;
}

+ (id)buildRequiredOnlyWithEventtype:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadEventtype:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = [v6 allKeys];
  id v9 = [v7 setWithArray:v8];

  v10 = +[CEMSystemEnergySaverDeclaration_RepeatingPowerItem allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v23 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"eventtype" isRequired:1 defaultValue:0 error:&v23];
  id v14 = v23;
  payloadEventtype = self->_payloadEventtype;
  self->_payloadEventtype = v13;

  if (!v14)
  {
    id v22 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"weekdays" isRequired:0 defaultValue:0 error:&v22];
    id v14 = v22;
    payloadWeekdays = self->_payloadWeekdays;
    self->_payloadWeekdays = v16;

    if (!v14)
    {
      id v21 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"time" isRequired:0 defaultValue:0 error:&v21];
      id v14 = v21;
      payloadTime = self->_payloadTime;
      self->_payloadTime = v18;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"eventtype" withValue:self->_payloadEventtype isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"weekdays" withValue:self->_payloadWeekdays isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"time" withValue:self->_payloadTime isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEMSystemEnergySaverDeclaration_RepeatingPowerItem;
  v4 = [(CEMPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadEventtype copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadWeekdays copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadTime copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)payloadEventtype
{
  return self->_payloadEventtype;
}

- (void)setPayloadEventtype:(id)a3
{
}

- (NSNumber)payloadWeekdays
{
  return self->_payloadWeekdays;
}

- (void)setPayloadWeekdays:(id)a3
{
}

- (NSNumber)payloadTime
{
  return self->_payloadTime;
}

- (void)setPayloadTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadTime, 0);
  objc_storeStrong((id *)&self->_payloadWeekdays, 0);

  objc_storeStrong((id *)&self->_payloadEventtype, 0);
}

@end