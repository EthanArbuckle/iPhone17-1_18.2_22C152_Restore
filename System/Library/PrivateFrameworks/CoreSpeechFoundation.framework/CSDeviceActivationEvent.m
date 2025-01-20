@interface CSDeviceActivationEvent
+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)mediaserverdLaunchedEvent:(unint64_t)a3;
+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4;
+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5;
+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5;
- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6;
- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7;
- (CSDeviceActivationEvent)initWithXPCObject:(id)a3;
- (NSDictionary)activationInfo;
- (NSString)UUID;
- (NSString)deviceId;
- (NSString)localizedDescription;
- (float)vadScore;
- (id)_activationTypeString;
- (id)xpcObject;
- (unint64_t)hosttime;
- (unint64_t)type;
@end

@implementation CSDeviceActivationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationInfo, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (float)vadScore
{
  return self->_vadScore;
}

- (unint64_t)hosttime
{
  return self->_hosttime;
}

- (NSDictionary)activationInfo
{
  return self->_activationInfo;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (id)_activationTypeString
{
  unint64_t v2 = self->_type - 1;
  if (v2 > 7) {
    return @"Unknown";
  }
  else {
    return off_1E6200668[v2];
  }
}

- (NSString)localizedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"[%@]", self->_UUID];
  v4 = [(CSDeviceActivationEvent *)self _activationTypeString];
  [v3 appendFormat:@"[%@]", v4];

  [v3 appendFormat:@"[%@]", self->_deviceId];
  objc_msgSend(v3, "appendFormat:", @"[%llu]", self->_hosttime);
  objc_msgSend(v3, "appendFormat:", @"[%f]", self->_vadScore);
  [v3 appendFormat:@"[%@]", self->_activationInfo];
  return (NSString *)v3;
}

- (id)xpcObject
{
  keys[4] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "uuid";
  keys[1] = "type";
  keys[2] = "vadScore";
  keys[3] = "hosttime";
  values[0] = xpc_string_create([(NSString *)self->_UUID UTF8String]);
  values[1] = xpc_uint64_create(self->_type);
  values[2] = xpc_double_create(self->_vadScore);
  values[3] = xpc_uint64_create(self->_hosttime);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  deviceId = self->_deviceId;
  if (deviceId) {
    xpc_dictionary_set_string(v3, "deviceId", [(NSString *)deviceId UTF8String]);
  }
  activationInfo = self->_activationInfo;
  if (activationInfo)
  {
    v6 = [(NSDictionary *)activationInfo _cs_xpcObject];
    xpc_dictionary_set_value(v3, "activationInfo", v6);
  }
  for (uint64_t i = 3; i != -1; --i)

  return v3;
}

- (CSDeviceActivationEvent)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDeviceActivationEvent;
  v5 = [(CSDeviceActivationEvent *)&v21 init];
  if (v5)
  {
    v6 = xpc_dictionary_get_value(v4, "uuid");

    if (v6)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "uuid"));
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v7;
    }
    else
    {
      UUID = [MEMORY[0x1E4F29128] UUID];
      uint64_t v9 = [UUID UUIDString];
      v10 = v5->_UUID;
      v5->_UUID = (NSString *)v9;
    }
    v5->_type = xpc_dictionary_get_uint64(v4, "type");
    v11 = xpc_dictionary_get_value(v4, "deviceId");

    if (v11)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "deviceId"));
      deviceId = v5->_deviceId;
      v5->_deviceId = (NSString *)v12;
    }
    v14 = xpc_dictionary_get_value(v4, "activationInfo");

    if (v14)
    {
      v15 = xpc_dictionary_get_dictionary(v4, "activationInfo");
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v17 = objc_msgSend(v16, "_cs_initWithXPCObject:", v15);
      activationInfo = v5->_activationInfo;
      v5->_activationInfo = (NSDictionary *)v17;
    }
    float v19 = xpc_dictionary_get_double(v4, "vadScore");
    v5->_vadScore = v19;
    v5->_hosttime = xpc_dictionary_get_uint64(v4, "hosttime");
  }

  return v5;
}

- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6
{
  return [(CSDeviceActivationEvent *)self initWithType:a3 deviceId:a4 activationInfo:a5 vadScore:a6 hosttime:0.0];
}

- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSDeviceActivationEvent;
  v15 = [(CSDeviceActivationEvent *)&v20 init];
  if (v15)
  {
    id v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    UUID = v15->_UUID;
    v15->_UUID = (NSString *)v17;

    v15->_type = a3;
    objc_storeStrong((id *)&v15->_deviceId, a4);
    objc_storeStrong((id *)&v15->_activationInfo, a5);
    v15->_hosttime = a7;
    v15->_vadScore = a6;
  }

  return v15;
}

+ (id)mediaserverdLaunchedEvent:(unint64_t)a3
{
  xpc_object_t v3 = [[CSDeviceActivationEvent alloc] initWithType:7 deviceId:0 activationInfo:0 hosttime:a3];
  return v3;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[CSDeviceActivationEvent alloc] initWithType:8 deviceId:v8 activationInfo:v7 hosttime:a5];

  return v9;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[CSDeviceActivationEvent alloc] initWithType:8 deviceId:v5 activationInfo:0 hosttime:a4];

  return v6;
}

+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[CSDeviceActivationEvent alloc] initWithType:6 deviceId:v8 activationInfo:v7 vadScore:a5 hosttime:0.0];

  return v9;
}

+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[CSDeviceActivationEvent alloc] initWithType:1 deviceId:0 activationInfo:v5 vadScore:a4 hosttime:0.0];

  return v6;
}

+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [CSDeviceActivationEvent alloc];
  *(float *)&double v9 = a4;
  v10 = [(CSDeviceActivationEvent *)v8 initWithType:3 deviceId:v7 activationInfo:0 vadScore:a5 hosttime:v9];

  return v10;
}

+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = [[CSDeviceActivationEvent alloc] initWithType:2 deviceId:v8 activationInfo:v7 vadScore:a5 hosttime:0.0];

  return v9;
}

@end