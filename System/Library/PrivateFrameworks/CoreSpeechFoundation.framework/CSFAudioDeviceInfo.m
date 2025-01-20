@interface CSFAudioDeviceInfo
+ (BOOL)supportsSecureCoding;
- (CSFAudioDeviceInfo)initWithCoder:(id)a3;
- (CSFAudioDeviceInfo)initWithRecordDeviceInfo:(id)a3 playbackRoute:(id)a4 playbackDeviceTypeList:(id)a5;
- (CSFAudioDeviceInfo)initWithXPCObject:(id)a3;
- (CSFAudioRecordDeviceInfo)recordDeviceInfo;
- (NSArray)playbackDeviceTypeList;
- (NSString)playbackRoute;
- (id)description;
- (id)xpcObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSFAudioDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackDeviceTypeList, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordDeviceInfo, 0);
}

- (NSArray)playbackDeviceTypeList
{
  return self->_playbackDeviceTypeList;
}

- (NSString)playbackRoute
{
  return self->_playbackRoute;
}

- (CSFAudioRecordDeviceInfo)recordDeviceInfo
{
  return self->_recordDeviceInfo;
}

- (CSFAudioDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordDeviceInfo"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackRoute"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackDeviceTypeList"];

  v8 = [(CSFAudioDeviceInfo *)self initWithRecordDeviceInfo:v5 playbackRoute:v6 playbackDeviceTypeList:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  recordDeviceInfo = self->_recordDeviceInfo;
  id v5 = a3;
  [v5 encodeObject:recordDeviceInfo forKey:@"recordDeviceInfo"];
  [v5 encodeObject:self->_playbackRoute forKey:@"playbackRoute"];
  [v5 encodeObject:self->_playbackDeviceTypeList forKey:@"playbackDeviceTypeList"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)CSFAudioDeviceInfo;
  id v4 = [(CSFAudioDeviceInfo *)&v8 description];
  id v5 = [(CSFAudioRecordDeviceInfo *)self->_recordDeviceInfo description];
  v6 = (void *)[v3 initWithFormat:@"%@ {recordDeviceInfo = %@, playbackRoute = %@, playbackDevices = %@", v4, v5, self->_playbackRoute, self->_playbackDeviceTypeList];

  return v6;
}

- (id)xpcObject
{
  keys[2] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = (char *)kXPCEncodeKeyRecordDeviceInfo;
  keys[1] = (char *)kXPCEncodeKeyPlaybackDeviceType;
  values[0] = [(CSFAudioRecordDeviceInfo *)self->_recordDeviceInfo xpcObject];
  values[1] = [(NSArray *)self->_playbackDeviceTypeList _cs_xpcObject];
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  playbackRoute = self->_playbackRoute;
  if (playbackRoute) {
    xpc_dictionary_set_string(v3, (const char *)kXPCEncodeKeyPlaybackRoute, [(NSString *)playbackRoute UTF8String]);
  }
  for (uint64_t i = 1; i != -1; --i)

  return v3;
}

- (CSFAudioDeviceInfo)initWithXPCObject:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_value(v4, (const char *)kXPCEncodeKeyRecordDeviceInfo);
  if (v5) {
    v6 = [[CSFAudioRecordDeviceInfo alloc] initWithXPCObject:v5];
  }
  else {
    v6 = 0;
  }
  string = xpc_dictionary_get_string(v4, (const char *)kXPCEncodeKeyPlaybackRoute);
  if (string)
  {
    objc_super v8 = [NSString stringWithUTF8String:string];
  }
  else
  {
    objc_super v8 = 0;
  }
  v9 = xpc_dictionary_get_array(v4, (const char *)kXPCEncodeKeyPlaybackDeviceType);
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    v11 = objc_msgSend(v10, "_cs_initWithXPCObject:", v9);
  }
  else
  {
    v11 = 0;
  }
  v12 = [(CSFAudioDeviceInfo *)self initWithRecordDeviceInfo:v6 playbackRoute:v8 playbackDeviceTypeList:v11];

  return v12;
}

- (CSFAudioDeviceInfo)initWithRecordDeviceInfo:(id)a3 playbackRoute:(id)a4 playbackDeviceTypeList:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSFAudioDeviceInfo;
  v11 = [(CSFAudioDeviceInfo *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    recordDeviceInfo = v11->_recordDeviceInfo;
    v11->_recordDeviceInfo = (CSFAudioRecordDeviceInfo *)v12;

    uint64_t v14 = [v9 copy];
    playbackRoute = v11->_playbackRoute;
    v11->_playbackRoute = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    playbackDeviceTypeList = v11->_playbackDeviceTypeList;
    v11->_playbackDeviceTypeList = (NSArray *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end