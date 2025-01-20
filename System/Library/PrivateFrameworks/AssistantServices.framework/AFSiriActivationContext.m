@interface AFSiriActivationContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSiriActivationContext)init;
- (AFSiriActivationContext)initWithBuilder:(id)a3;
- (AFSiriActivationContext)initWithCoder:(id)a3;
- (AFSiriActivationContext)initWithDictionaryRepresentation:(id)a3;
- (AFSiriActivationContext)initWithTimestamp:(unint64_t)a3 source:(int64_t)a4 event:(int64_t)a5 options:(unint64_t)a6 deviceID:(id)a7 userInfo:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)deviceID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)event;
- (int64_t)source;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriActivationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)event
{
  return self->_event;
}

- (int64_t)source
{
  return self->_source;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  unint64_t source = self->_source;
  if (source > 0xF) {
    v6 = @"(unknown)";
  }
  else {
    v6 = off_1E5924E08[source];
  }
  v7 = v6;
  [v3 setObject:v7 forKey:@"source"];

  unint64_t event = self->_event;
  if (event > 0x17) {
    v9 = @"(unknown)";
  }
  else {
    v9 = off_1E592B890[event];
  }
  v10 = v9;
  [v3 setObject:v10 forKey:@"event"];

  v11 = AFSiriActivationOptionsGetNames(self->_options);
  [v3 setObject:v11 forKey:@"options"];

  deviceID = self->_deviceID;
  if (deviceID) {
    [v3 setObject:deviceID forKey:@"deviceID"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v3 setObject:userInfo forKey:@"userInfo"];
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (AFSiriActivationContext)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v9 = [v7 unsignedLongLongValue];
    v10 = [v5 objectForKey:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = AFSiriActivationSourceGetFromName(v10);
    }
    else {
      uint64_t v11 = 0;
    }

    v12 = [v5 objectForKey:@"event"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = AFSiriActivationEventGetFromName(v12);
    }
    else {
      uint64_t v13 = 0;
    }

    v14 = [v5 objectForKey:@"options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = AFSiriActivationOptionsGetFromNames(v14);
    }
    else {
      uint64_t v15 = 0;
    }

    v16 = [v5 objectForKey:@"deviceID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v5 objectForKey:@"userInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    self = [(AFSiriActivationContext *)self initWithTimestamp:v9 source:v11 event:v13 options:v15 deviceID:v17 userInfo:v19];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  unint64_t timestamp = self->_timestamp;
  id v10 = a3;
  v6 = [v4 numberWithUnsignedLongLong:timestamp];
  [v10 encodeObject:v6 forKey:@"AFSiriActivationContext::timestamp"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_source];
  [v10 encodeObject:v7 forKey:@"AFSiriActivationContext::source"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_event];
  [v10 encodeObject:v8 forKey:@"AFSiriActivationContext::event"];

  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_options];
  [v10 encodeObject:v9 forKey:@"AFSiriActivationContext::options"];

  [v10 encodeObject:self->_deviceID forKey:@"AFSiriActivationContext::deviceID"];
  [v10 encodeObject:self->_userInfo forKey:@"AFSiriActivationContext::userInfo"];
}

- (AFSiriActivationContext)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationContext::timestamp"];
  uint64_t v30 = [v4 unsignedLongLongValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationContext::source"];
  uint64_t v29 = [v5 integerValue];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationContext::event"];
  uint64_t v28 = [v6 integerValue];

  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationContext::options"];
  uint64_t v27 = [v7 unsignedIntegerValue];

  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSiriActivationContext::deviceID"];
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  v26 = (void *)v8;
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  id v19 = [v3 decodeObjectOfClasses:v18 forKey:@"AFSiriActivationContext::userInfo"];

  v20 = [(AFSiriActivationContext *)self initWithTimestamp:v30 source:v29 event:v28 options:v27 deviceID:v26 userInfo:v19];
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSiriActivationContext *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t timestamp = self->_timestamp;
      if (timestamp == [(AFSiriActivationContext *)v5 timestamp]
        && (int64_t source = self->_source, source == [(AFSiriActivationContext *)v5 source])
        && (int64_t event = self->_event, event == [(AFSiriActivationContext *)v5 event])
        && (unint64_t options = self->_options, options == [(AFSiriActivationContext *)v5 options]))
      {
        uint64_t v10 = [(AFSiriActivationContext *)v5 deviceID];
        deviceID = self->_deviceID;
        if (deviceID == v10 || [(NSString *)deviceID isEqual:v10])
        {
          uint64_t v12 = [(AFSiriActivationContext *)v5 userInfo];
          userInfo = self->_userInfo;
          BOOL v14 = userInfo == v12 || [(NSDictionary *)userInfo isEqual:v12];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_source];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_event];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_options];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  NSUInteger v11 = [(NSString *)self->_deviceID hash];
  unint64_t v12 = v10 ^ v11 ^ [(NSDictionary *)self->_userInfo hash];

  return v12;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v17.receiver = self;
  v17.super_class = (Class)AFSiriActivationContext;
  v5 = [(AFSiriActivationContext *)&v17 description];
  unint64_t source = self->_source;
  if (source > 0xF) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_1E5924E08[source];
  }
  unint64_t timestamp = self->_timestamp;
  uint64_t v9 = v7;
  unint64_t event = self->_event;
  if (event > 0x17) {
    NSUInteger v11 = @"(unknown)";
  }
  else {
    NSUInteger v11 = off_1E592B890[event];
  }
  unint64_t v12 = v11;
  uint64_t v13 = AFSiriActivationOptionsGetNames(self->_options);
  BOOL v14 = [v13 componentsJoinedByString:@"|"];
  v15 = (void *)[v4 initWithFormat:@"%@ {timestamp = %llu, unint64_t source = %@, event = %@, options = %@, deviceID = %@, userInfo = %@}", v5, timestamp, v9, v12, v14, self->_deviceID, self->_userInfo];

  return v15;
}

- (NSString)description
{
  return (NSString *)[(AFSiriActivationContext *)self _descriptionWithIndent:0];
}

- (AFSiriActivationContext)initWithTimestamp:(unint64_t)a3 source:(int64_t)a4 event:(int64_t)a5 options:(unint64_t)a6 deviceID:(id)a7 userInfo:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__AFSiriActivationContext_initWithTimestamp_source_event_options_deviceID_userInfo___block_invoke;
  v20[3] = &unk_1E5929328;
  unint64_t v23 = a3;
  int64_t v24 = a4;
  int64_t v25 = a5;
  unint64_t v26 = a6;
  id v21 = v14;
  id v22 = v15;
  id v16 = v15;
  id v17 = v14;
  v18 = [(AFSiriActivationContext *)self initWithBuilder:v20];

  return v18;
}

void __84__AFSiriActivationContext_initWithTimestamp_source_event_options_deviceID_userInfo___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = a2;
  [v4 setTimestamp:v3];
  [v4 setSource:a1[7]];
  [v4 setEvent:a1[8]];
  [v4 setOptions:a1[9]];
  [v4 setDeviceID:a1[4]];
  [v4 setUserInfo:a1[5]];
}

- (AFSiriActivationContext)init
{
  return [(AFSiriActivationContext *)self initWithBuilder:0];
}

- (AFSiriActivationContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSiriActivationContextMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriActivationContext;
  v5 = [(AFSiriActivationContext *)&v15 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFSiriActivationContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSiriActivationContextMutation *)v7 isDirty])
    {
      v6->_unint64_t timestamp = [(_AFSiriActivationContextMutation *)v7 getTimestamp];
      v6->_unint64_t source = [(_AFSiriActivationContextMutation *)v7 getSource];
      v6->_unint64_t event = [(_AFSiriActivationContextMutation *)v7 getEvent];
      v6->_unint64_t options = [(_AFSiriActivationContextMutation *)v7 getOptions];
      uint64_t v8 = [(_AFSiriActivationContextMutation *)v7 getDeviceID];
      uint64_t v9 = [v8 copy];
      deviceID = v6->_deviceID;
      v6->_deviceID = (NSString *)v9;

      NSUInteger v11 = [(_AFSiriActivationContextMutation *)v7 getUserInfo];
      uint64_t v12 = [v11 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v12;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFSiriActivationContextMutation *))a3;
  if (v4)
  {
    v5 = [[_AFSiriActivationContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSiriActivationContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFSiriActivationContext);
      v6->_unint64_t timestamp = [(_AFSiriActivationContextMutation *)v5 getTimestamp];
      v6->_unint64_t source = [(_AFSiriActivationContextMutation *)v5 getSource];
      v6->_unint64_t event = [(_AFSiriActivationContextMutation *)v5 getEvent];
      v6->_unint64_t options = [(_AFSiriActivationContextMutation *)v5 getOptions];
      id v7 = [(_AFSiriActivationContextMutation *)v5 getDeviceID];
      uint64_t v8 = [v7 copy];
      deviceID = v6->_deviceID;
      v6->_deviceID = (NSString *)v8;

      uint64_t v10 = [(_AFSiriActivationContextMutation *)v5 getUserInfo];
      uint64_t v11 = [v10 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v11;
    }
    else
    {
      uint64_t v6 = (AFSiriActivationContext *)[(AFSiriActivationContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFSiriActivationContext *)[(AFSiriActivationContext *)self copy];
  }

  return v6;
}

@end