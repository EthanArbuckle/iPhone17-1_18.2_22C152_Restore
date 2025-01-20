@interface CEMClassroomRequestMirroringCommand
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withDestinationName:(id)a4 withDestinationDeviceID:(id)a5 withScanTime:(id)a6 withPassword:(id)a7;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadScanTime;
- (NSString)payloadDestinationDeviceID;
- (NSString)payloadDestinationName;
- (NSString)payloadPassword;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)executionLevel;
- (void)setPayloadDestinationDeviceID:(id)a3;
- (void)setPayloadDestinationName:(id)a3;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadScanTime:(id)a3;
@end

@implementation CEMClassroomRequestMirroringCommand

+ (NSString)registeredClassName
{
  return (NSString *)@"Commands";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.command.classroom.mirroring.request";
}

+ (NSSet)allowedPayloadKeys
{
  v6[4] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"DestinationName";
  v6[1] = @"DestinationDeviceID";
  v6[2] = @"ScanTime";
  v6[3] = @"Password";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)executionLevel
{
  return 0;
}

+ (id)buildWithIdentifier:(id)a3 withDestinationName:(id)a4 withDestinationDeviceID:(id)a5 withScanTime:(id)a6 withPassword:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_opt_new();
  [v16 setCommandType:@"com.apple.command.classroom.mirroring.request"];
  if (v11)
  {
    [v16 setCommandIdentifier:v11];
  }
  else
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];
    [v16 setCommandIdentifier:v18];
  }
  [v16 setPayloadDestinationName:v15];

  [v16 setPayloadDestinationDeviceID:v14];
  [v16 setPayloadScanTime:v13];

  [v16 setPayloadPassword:v12];

  return v16;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCommandType:@"com.apple.command.classroom.mirroring.request"];
  if (v3)
  {
    [v4 setCommandIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setCommandIdentifier:v6];
  }

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMClassroomRequestMirroringCommand allowedPayloadKeys];
  [v9 minusSet:v10];

  id v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super._unknownPayloadKeys;
  self->super.super._unknownPayloadKeys = v11;

  id v26 = 0;
  id v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DestinationName" isRequired:0 defaultValue:0 error:&v26];
  id v14 = v26;
  payloadDestinationName = self->_payloadDestinationName;
  self->_payloadDestinationName = v13;

  if (!v14)
  {
    id v25 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DestinationDeviceID" isRequired:0 defaultValue:0 error:&v25];
    id v14 = v25;
    payloadDestinationDeviceID = self->_payloadDestinationDeviceID;
    self->_payloadDestinationDeviceID = v16;

    if (!v14)
    {
      id v24 = 0;
      v18 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"ScanTime" isRequired:0 defaultValue:0 error:&v24];
      id v14 = v24;
      payloadScanTime = self->_payloadScanTime;
      self->_payloadScanTime = v18;

      if (!v14)
      {
        id v23 = 0;
        v20 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:0 defaultValue:0 error:&v23];
        id v14 = v23;
        payloadPassword = self->_payloadPassword;
        self->_payloadPassword = v20;
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
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DestinationName" withValue:self->_payloadDestinationName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"DestinationDeviceID" withValue:self->_payloadDestinationDeviceID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v4 withKey:@"ScanTime" withValue:self->_payloadScanTime isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v4 withKey:@"Password" withValue:self->_payloadPassword isRequired:0 defaultValue:0];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CEMClassroomRequestMirroringCommand;
  v4 = [(CEMCommandBase *)&v14 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadDestinationName copy];
  id v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(NSString *)self->_payloadDestinationDeviceID copy];
  v8 = (void *)v4[8];
  v4[8] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadScanTime copy];
  v10 = (void *)v4[9];
  v4[9] = v9;

  uint64_t v11 = [(NSString *)self->_payloadPassword copy];
  id v12 = (void *)v4[10];
  v4[10] = v11;

  return v4;
}

- (NSString)payloadDestinationName
{
  return self->_payloadDestinationName;
}

- (void)setPayloadDestinationName:(id)a3
{
}

- (NSString)payloadDestinationDeviceID
{
  return self->_payloadDestinationDeviceID;
}

- (void)setPayloadDestinationDeviceID:(id)a3
{
}

- (NSNumber)payloadScanTime
{
  return self->_payloadScanTime;
}

- (void)setPayloadScanTime:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPassword, 0);
  objc_storeStrong((id *)&self->_payloadScanTime, 0);
  objc_storeStrong((id *)&self->_payloadDestinationDeviceID, 0);

  objc_storeStrong((id *)&self->_payloadDestinationName, 0);
}

@end