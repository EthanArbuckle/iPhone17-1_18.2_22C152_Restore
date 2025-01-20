@interface AFAudioDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAudioDeviceInfo)init;
- (AFAudioDeviceInfo)initWithBuilder:(id)a3;
- (AFAudioDeviceInfo)initWithCoder:(id)a3;
- (AFAudioDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 deviceUID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteDevice;
- (NSString)route;
- (NSUUID)deviceUID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAudioDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (BOOL)isRemoteDevice
{
  return self->_isRemoteDevice;
}

- (NSString)route
{
  return self->_route;
}

- (void)encodeWithCoder:(id)a3
{
  route = self->_route;
  id v6 = a3;
  [v6 encodeObject:route forKey:@"AFAudioDeviceInfo::route"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isRemoteDevice];
  [v6 encodeObject:v5 forKey:@"AFAudioDeviceInfo::isRemoteDevice"];

  [v6 encodeObject:self->_deviceUID forKey:@"AFAudioDeviceInfo::deviceUID"];
}

- (AFAudioDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioDeviceInfo::route"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioDeviceInfo::isRemoteDevice"];
  uint64_t v7 = [v6 BOOLValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioDeviceInfo::deviceUID"];

  v9 = [(AFAudioDeviceInfo *)self initWithRoute:v5 isRemoteDevice:v7 deviceUID:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFAudioDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isRemoteDevice = self->_isRemoteDevice;
      if (isRemoteDevice == [(AFAudioDeviceInfo *)v5 isRemoteDevice])
      {
        uint64_t v7 = [(AFAudioDeviceInfo *)v5 route];
        route = self->_route;
        if (route == v7 || [(NSString *)route isEqual:v7])
        {
          v9 = [(AFAudioDeviceInfo *)v5 deviceUID];
          deviceUID = self->_deviceUID;
          BOOL v11 = deviceUID == v9 || [(NSUUID *)deviceUID isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_route hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isRemoteDevice];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSUUID *)self->_deviceUID hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFAudioDeviceInfo;
  uint64_t v5 = [(AFAudioDeviceInfo *)&v10 description];
  unint64_t v6 = (void *)v5;
  if (self->_isRemoteDevice) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {route = %@, BOOL isRemoteDevice = %@, deviceUID = %@}", v5, self->_route, v7, self->_deviceUID];

  return v8;
}

- (id)description
{
  return [(AFAudioDeviceInfo *)self _descriptionWithIndent:0];
}

- (AFAudioDeviceInfo)initWithRoute:(id)a3 isRemoteDevice:(BOOL)a4 deviceUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__AFAudioDeviceInfo_initWithRoute_isRemoteDevice_deviceUID___block_invoke;
  v14[3] = &unk_1E59289D0;
  BOOL v17 = a4;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = [(AFAudioDeviceInfo *)self initWithBuilder:v14];

  return v12;
}

void __60__AFAudioDeviceInfo_initWithRoute_isRemoteDevice_deviceUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setRoute:v3];
  [v4 setIsRemoteDevice:*(unsigned __int8 *)(a1 + 48)];
  [v4 setDeviceUID:*(void *)(a1 + 40)];
}

- (AFAudioDeviceInfo)init
{
  return [(AFAudioDeviceInfo *)self initWithBuilder:0];
}

- (AFAudioDeviceInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFAudioDeviceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFAudioDeviceInfo;
  uint64_t v5 = [(AFAudioDeviceInfo *)&v15 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFAudioDeviceInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAudioDeviceInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFAudioDeviceInfoMutation *)v7 getRoute];
      uint64_t v9 = [v8 copy];
      route = v6->_route;
      v6->_route = (NSString *)v9;

      v6->_BOOL isRemoteDevice = [(_AFAudioDeviceInfoMutation *)v7 getIsRemoteDevice];
      id v11 = [(_AFAudioDeviceInfoMutation *)v7 getDeviceUID];
      uint64_t v12 = [v11 copy];
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v12;
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
  id v4 = (void (**)(id, _AFAudioDeviceInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFAudioDeviceInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAudioDeviceInfoMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFAudioDeviceInfo);
      uint64_t v7 = [(_AFAudioDeviceInfoMutation *)v5 getRoute];
      uint64_t v8 = [v7 copy];
      route = v6->_route;
      v6->_route = (NSString *)v8;

      v6->_BOOL isRemoteDevice = [(_AFAudioDeviceInfoMutation *)v5 getIsRemoteDevice];
      id v10 = [(_AFAudioDeviceInfoMutation *)v5 getDeviceUID];
      uint64_t v11 = [v10 copy];
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v11;
    }
    else
    {
      unint64_t v6 = (AFAudioDeviceInfo *)[(AFAudioDeviceInfo *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFAudioDeviceInfo *)[(AFAudioDeviceInfo *)self copy];
  }

  return v6;
}

@end