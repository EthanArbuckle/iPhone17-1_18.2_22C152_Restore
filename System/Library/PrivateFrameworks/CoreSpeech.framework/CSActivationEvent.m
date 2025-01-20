@interface CSActivationEvent
+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)mediaserverdLaunchedEvent:(unint64_t)a3;
+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5;
+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6;
- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7;
- (CSActivationEvent)initWithXPCObject:(id)a3;
- (CSDeviceActivationEvent)deviceActivationEvent;
- (NSDictionary)activationInfo;
- (NSString)UUID;
- (NSString)deviceId;
- (NSString)localizedDescription;
- (float)vadScore;
- (id)xpcObject;
- (unint64_t)hosttime;
- (unint64_t)type;
@end

@implementation CSActivationEvent

- (void).cxx_destruct
{
}

- (CSDeviceActivationEvent)deviceActivationEvent
{
  return self->_deviceActivationEvent;
}

- (NSString)localizedDescription
{
  return (NSString *)[(CSDeviceActivationEvent *)self->_deviceActivationEvent localizedDescription];
}

- (float)vadScore
{
  [(CSDeviceActivationEvent *)self->_deviceActivationEvent vadScore];
  return result;
}

- (unint64_t)hosttime
{
  return (unint64_t)[(CSDeviceActivationEvent *)self->_deviceActivationEvent hosttime];
}

- (NSDictionary)activationInfo
{
  return (NSDictionary *)[(CSDeviceActivationEvent *)self->_deviceActivationEvent activationInfo];
}

- (NSString)deviceId
{
  return (NSString *)[(CSDeviceActivationEvent *)self->_deviceActivationEvent deviceId];
}

- (unint64_t)type
{
  return (unint64_t)[(CSDeviceActivationEvent *)self->_deviceActivationEvent type];
}

- (NSString)UUID
{
  return (NSString *)[(CSDeviceActivationEvent *)self->_deviceActivationEvent UUID];
}

- (id)xpcObject
{
  keys = "deviceActivationEvent";
  xpc_object_t values = [(CSDeviceActivationEvent *)self->_deviceActivationEvent xpcObject];
  xpc_object_t v2 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);

  return v2;
}

- (CSActivationEvent)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSActivationEvent;
  v5 = [(CSActivationEvent *)&v10 init];
  if (!v5) {
    goto LABEL_4;
  }
  xpc_dictionary_get_value(v4, "deviceActivationEvent");
  v6 = (CSActivationEvent *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (CSDeviceActivationEvent *)[objc_alloc((Class)CSDeviceActivationEvent) initWithXPCObject:v6];
    deviceActivationEvent = v5->_deviceActivationEvent;
    v5->_deviceActivationEvent = v7;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6
{
  return [(CSActivationEvent *)self initWithType:a3 deviceId:a4 activationInfo:a5 vadScore:a6 hosttime:0.0];
}

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSActivationEvent;
  v14 = [(CSActivationEvent *)&v20 init];
  if (v14)
  {
    id v15 = objc_alloc((Class)CSDeviceActivationEvent);
    *(float *)&double v16 = a6;
    v17 = (CSDeviceActivationEvent *)[v15 initWithType:a3 deviceId:v12 activationInfo:v13 vadScore:a7 hosttime:v16];
    deviceActivationEvent = v14->_deviceActivationEvent;
    v14->_deviceActivationEvent = v17;
  }
  return v14;
}

+ (id)mediaserverdLaunchedEvent:(unint64_t)a3
{
  v3 = [[CSActivationEvent alloc] initWithType:7 deviceId:0 activationInfo:0 hosttime:a3];
  return v3;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[CSActivationEvent alloc] initWithType:8 deviceId:v8 activationInfo:v7 hosttime:a5];

  return v9;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[CSActivationEvent alloc] initWithType:8 deviceId:v5 activationInfo:0 hosttime:a4];

  return v6;
}

+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[CSActivationEvent alloc] initWithType:6 deviceId:v8 activationInfo:v7 vadScore:a5 hosttime:0.0];

  return v9;
}

+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[CSActivationEvent alloc] initWithType:1 deviceId:0 activationInfo:v5 vadScore:a4 hosttime:0.0];

  return v6;
}

+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [CSActivationEvent alloc];
  *(float *)&double v9 = a4;
  objc_super v10 = [(CSActivationEvent *)v8 initWithType:3 deviceId:v7 activationInfo:0 vadScore:a5 hosttime:v9];

  return v10;
}

+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [[CSActivationEvent alloc] initWithType:2 deviceId:v8 activationInfo:v7 vadScore:a5 hosttime:0.0];

  return v9;
}

@end