@interface CSFAudioRecordDeviceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isRemoteDevice;
- (CSFAudioRecordDeviceInfo)initWithAVVCRecordDeviceInfo:(id)a3;
- (CSFAudioRecordDeviceInfo)initWithCoder:(id)a3;
- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6;
- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6 remoteDeviceUIDString:(id)a7;
- (CSFAudioRecordDeviceInfo)initWithXPCObject:(id)a3;
- (NSString)remoteDeviceProductIdentifier;
- (NSString)remoteDeviceUIDString;
- (NSString)route;
- (NSUUID)remoteDeviceUID;
- (id)description;
- (id)xpcObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSFAudioRecordDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceUIDString, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProductIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteDeviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (NSString)remoteDeviceUIDString
{
  return self->_remoteDeviceUIDString;
}

- (NSString)remoteDeviceProductIdentifier
{
  return self->_remoteDeviceProductIdentifier;
}

- (NSUUID)remoteDeviceUID
{
  return self->_remoteDeviceUID;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSString)route
{
  return self->_route;
}

- (CSFAudioRecordDeviceInfo)initWithAVVCRecordDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 recordRoute];
  uint64_t v6 = [v4 isRemoteDevice];
  v7 = [v4 remoteDeviceUID];
  v8 = [v4 remoteProductIdentifier];
  v9 = [v4 remoteDeviceUIDString];

  v10 = [(CSFAudioRecordDeviceInfo *)self initWithRoute:v5 isRemoteDevice:v6 remoteDeviceUID:v7 remoteDeviceProductIdentifier:v8 remoteDeviceUIDString:v9];
  return v10;
}

- (CSFAudioRecordDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isRemoteDevice"];
  uint64_t v7 = [v6 BOOLValue];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceUID"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceProductIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDeviceUIDString"];

  v11 = [(CSFAudioRecordDeviceInfo *)self initWithRoute:v5 isRemoteDevice:v7 remoteDeviceUID:v8 remoteDeviceProductIdentifier:v9 remoteDeviceUIDString:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  route = self->_route;
  id v6 = a3;
  [v6 encodeObject:route forKey:@"route"];
  v5 = [NSNumber numberWithBool:self->_isRemoteDevice];
  [v6 encodeObject:v5 forKey:@"isRemoteDevice"];

  [v6 encodeObject:self->_remoteDeviceUID forKey:@"remoteDeviceUID"];
  [v6 encodeObject:self->_remoteDeviceProductIdentifier forKey:@"remoteDeviceProductIdentifier"];
  [v6 encodeObject:self->_remoteDeviceUIDString forKey:@"remoteDeviceUIDString"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)CSFAudioRecordDeviceInfo;
  id v4 = [(CSFAudioRecordDeviceInfo *)&v7 description];
  v5 = (void *)[v3 initWithFormat:@"%@ {route = %@, isRemoteDevice = %d, remoteDeviceUID = %@, remoteDeviceProductIdentifier = %@, remoteDeviceUIDString = %@}", v4, self->_route, self->_isRemoteDevice, self->_remoteDeviceUID, self->_remoteDeviceProductIdentifier, self->_remoteDeviceUIDString];

  return v5;
}

- (id)xpcObject
{
  keys[1] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = (char *)kXPCEncodeKeyIsRemoteDevice;
  xpc_object_t values = xpc_BOOL_create(self->_isRemoteDevice);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  route = self->_route;
  if (route) {
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRoute, [(NSString *)route UTF8String]);
  }
  remoteDeviceUID = self->_remoteDeviceUID;
  if (remoteDeviceUID)
  {
    id v6 = (const char *)kXPCEncodeKeyRemoteDeviceUID;
    id v7 = [(NSUUID *)remoteDeviceUID UUIDString];
    xpc_dictionary_set_string(v3, v6, (const char *)[v7 UTF8String]);
  }
  remoteDeviceProductIdentifier = self->_remoteDeviceProductIdentifier;
  if (remoteDeviceProductIdentifier) {
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier, [(NSString *)remoteDeviceProductIdentifier UTF8String]);
  }
  remoteDeviceUIDString = self->_remoteDeviceUIDString;
  if (remoteDeviceUIDString) {
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyRemoteDeviceUIDString, [(NSString *)remoteDeviceUIDString UTF8String]);
  }

  return v3;
}

- (CSFAudioRecordDeviceInfo)initWithXPCObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = xpc_dictionary_get_BOOL(v4, (const char *)kXPCEncodeKeyIsRemoteDevice);
  id v6 = xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRoute);

  if (v6)
  {
    id v6 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRoute));
  }
  id v7 = xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceUID);

  if (v7)
  {
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceUID));
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  }
  v9 = xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier);

  if (v9)
  {
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceProductIdentifier));
  }
  v10 = xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRemoteDeviceUIDString);

  if (v10)
  {
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyRemoteDeviceUIDString));
  }
  v11 = [(CSFAudioRecordDeviceInfo *)self initWithRoute:v6 isRemoteDevice:v5 remoteDeviceUID:v7 remoteDeviceProductIdentifier:v9 remoteDeviceUIDString:v10];

  return v11;
}

- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6 remoteDeviceUIDString:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CSFAudioRecordDeviceInfo;
  v16 = [(CSFAudioRecordDeviceInfo *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    route = v16->_route;
    v16->_route = (NSString *)v17;

    v16->_isRemoteDevice = a4;
    uint64_t v19 = [v13 copy];
    remoteDeviceUID = v16->_remoteDeviceUID;
    v16->_remoteDeviceUID = (NSUUID *)v19;

    uint64_t v21 = [v14 copy];
    remoteDeviceProductIdentifier = v16->_remoteDeviceProductIdentifier;
    v16->_remoteDeviceProductIdentifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    remoteDeviceUIDString = v16->_remoteDeviceUIDString;
    v16->_remoteDeviceUIDString = (NSString *)v23;
  }
  return v16;
}

- (CSFAudioRecordDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 remoteDeviceUID:(id)a5 remoteDeviceProductIdentifier:(id)a6
{
  return [(CSFAudioRecordDeviceInfo *)self initWithRoute:a3 isRemoteDevice:a4 remoteDeviceUID:a5 remoteDeviceProductIdentifier:a6 remoteDeviceUIDString:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end