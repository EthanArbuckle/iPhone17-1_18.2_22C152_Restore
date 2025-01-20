@interface MDMRequestDeviceLockCommand
+ (id)requestType;
+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 PIN:(id)a5;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSString)commandMessage;
- (NSString)commandPIN;
- (NSString)commandPhoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
- (void)setCommandMessage:(id)a3;
- (void)setCommandPIN:(id)a3;
- (void)setCommandPhoneNumber:(id)a3;
@end

@implementation MDMRequestDeviceLockCommand

+ (id)requestType
{
  return @"DeviceLock";
}

+ (unint64_t)requiredAccessRights
{
  return 4;
}

+ (id)requestWithMessage:(id)a3 phoneNumber:(id)a4 PIN:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setCommandMessage:v9];

  [v10 setCommandPhoneNumber:v8];
  [v10 setCommandPIN:v7];

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7 = a3;
  BOOL v8 = 0;
  if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"Message" forKeyPath:@"commandMessage" isRequired:0 defaultValue:0 error:a5])
  {
    BOOL v8 = 0;
    if ([(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PhoneNumber" forKeyPath:@"commandPhoneNumber" isRequired:0 defaultValue:0 error:a5])
    {
      BOOL v8 = [(RMModelPayloadBase *)self loadStringFromDictionary:v7 usingKey:@"PIN" forKeyPath:@"commandPIN" isRequired:0 defaultValue:0 error:a5];
    }
  }

  return v8;
}

- (id)serializeWithType:(signed __int16)a3
{
  v4 = objc_opt_new();
  v5 = [(MDMRequestDeviceLockCommand *)self commandMessage];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"Message" value:v5 isRequired:0 defaultValue:0];

  v6 = [(MDMRequestDeviceLockCommand *)self commandPhoneNumber];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PhoneNumber" value:v6 isRequired:0 defaultValue:0];

  id v7 = [(MDMRequestDeviceLockCommand *)self commandPIN];
  [(RMModelPayloadBase *)self serializeStringIntoDictionary:v4 usingKey:@"PIN" value:v7 isRequired:0 defaultValue:0];

  BOOL v8 = (void *)[v4 copy];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MDMRequestDeviceLockCommand;
  v4 = [(RMModelPayloadBase *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_commandMessage copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_commandPhoneNumber copy];
  BOOL v8 = (void *)v4[7];
  v4[7] = v7;

  uint64_t v9 = [(NSString *)self->_commandPIN copy];
  v10 = (void *)v4[8];
  v4[8] = v9;

  return v4;
}

- (NSString)commandMessage
{
  return self->_commandMessage;
}

- (void)setCommandMessage:(id)a3
{
}

- (NSString)commandPhoneNumber
{
  return self->_commandPhoneNumber;
}

- (void)setCommandPhoneNumber:(id)a3
{
}

- (NSString)commandPIN
{
  return self->_commandPIN;
}

- (void)setCommandPIN:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandPIN, 0);
  objc_storeStrong((id *)&self->_commandPhoneNumber, 0);
  objc_storeStrong((id *)&self->_commandMessage, 0);
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void (**)(id, void *))a4;
  v6 = [(MDMRequestDeviceLockCommand *)self commandMessage];
  uint64_t v7 = [(MDMRequestDeviceLockCommand *)self commandPhoneNumber];
  BOOL v8 = +[MDMFindMyUtilities lockDeviceWithMessage:v6 phoneNumber:v7];

  uint64_t v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v11 = @"MessageResult";
  v12[0] = v8;
  v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v9 addEntriesFromDictionary:v10];

  v5[2](v5, v9);
}

@end