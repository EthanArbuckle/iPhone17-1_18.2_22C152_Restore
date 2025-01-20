@interface CEMApplicationControlDeclaration_UpdateSchedule
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithMode:(id)a3;
+ (id)buildWithMode:(id)a3 withDuration:(id)a4 withStartTime:(id)a5 withEndTime:(id)a6;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)payloadDuration;
- (NSString)payloadEndTime;
- (NSString)payloadMode;
- (NSString)payloadStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (void)setPayloadDuration:(id)a3;
- (void)setPayloadEndTime:(id)a3;
- (void)setPayloadMode:(id)a3;
- (void)setPayloadStartTime:(id)a3;
@end

@implementation CEMApplicationControlDeclaration_UpdateSchedule

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"Mode";
  v6[1] = @"Duration";
  v6[2] = @"StartTime";
  v6[3] = @"EndTime";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithMode:(id)a3 withDuration:(id)a4 withStartTime:(id)a5 withEndTime:(id)a6
{
  v9 = (__CFString *)a6;
  v10 = (__CFString *)a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setPayloadMode:v12];

  if (v11) {
    v14 = v11;
  }
  else {
    v14 = &unk_26C894778;
  }
  [v13 setPayloadDuration:v14];

  if (v10) {
    v15 = v10;
  }
  else {
    v15 = @"22:00";
  }
  [v13 setPayloadStartTime:v15];

  if (v9) {
    v16 = v9;
  }
  else {
    v16 = @"04:00";
  }
  [v13 setPayloadEndTime:v16];

  return v13;
}

+ (id)buildRequiredOnlyWithMode:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setPayloadMode:v3];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationControlDeclaration_UpdateSchedule allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v26 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Mode" isRequired:1 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadMode = self->_payloadMode;
  self->_payloadMode = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"Duration" isRequired:0 defaultValue:&unk_26C894778 error:&v25];
    id v14 = v25;
    payloadDuration = self->_payloadDuration;
    self->_payloadDuration = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"StartTime" isRequired:0 defaultValue:@"22:00" error:&v24];
      id v14 = v24;
      payloadStartTime = self->_payloadStartTime;
      self->_payloadStartTime = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EndTime" isRequired:0 defaultValue:@"04:00" error:&v23];
        id v14 = v23;
        payloadEndTime = self->_payloadEndTime;
        self->_payloadEndTime = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Mode" withValue:self->_payloadMode isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"Duration" withValue:self->_payloadDuration isRequired:0 defaultValue:&unk_26C894778];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"StartTime" withValue:self->_payloadStartTime isRequired:0 defaultValue:@"22:00"];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"EndTime" withValue:self->_payloadEndTime isRequired:0 defaultValue:@"04:00"];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMApplicationControlDeclaration_UpdateSchedule;
  v4 = [(CEMPayloadBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadMode copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadDuration copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_payloadStartTime copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_payloadEndTime copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)payloadMode
{
  return self->_payloadMode;
}

- (void)setPayloadMode:(id)a3
{
}

- (NSNumber)payloadDuration
{
  return self->_payloadDuration;
}

- (void)setPayloadDuration:(id)a3
{
}

- (NSString)payloadStartTime
{
  return self->_payloadStartTime;
}

- (void)setPayloadStartTime:(id)a3
{
}

- (NSString)payloadEndTime
{
  return self->_payloadEndTime;
}

- (void)setPayloadEndTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEndTime, 0);
  objc_storeStrong((id *)&self->_payloadStartTime, 0);
  objc_storeStrong((id *)&self->_payloadDuration, 0);

  objc_storeStrong((id *)&self->_payloadMode, 0);
}

@end