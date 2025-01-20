@interface AFAudioSessionCoordinationDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAudioSessionCoordinationDeviceInfo)init;
- (AFAudioSessionCoordinationDeviceInfo)initWithBuilder:(id)a3;
- (AFAudioSessionCoordinationDeviceInfo)initWithCoder:(id)a3;
- (AFAudioSessionCoordinationDeviceInfo)initWithDictionaryRepresentation:(id)a3;
- (AFAudioSessionCoordinationDeviceInfo)initWithPeerInfo:(id)a3 systemInfo:(id)a4;
- (AFAudioSessionCoordinationSystemInfo)systemInfo;
- (AFPeerInfo)peerInfo;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAudioSessionCoordinationDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInfo, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
}

- (AFAudioSessionCoordinationSystemInfo)systemInfo
{
  return self->_systemInfo;
}

- (AFPeerInfo)peerInfo
{
  return self->_peerInfo;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  peerInfo = self->_peerInfo;
  if (peerInfo)
  {
    v5 = [(AFPeerInfo *)peerInfo buildDictionaryRepresentation];
    [v3 setObject:v5 forKey:@"peerInfo"];
  }
  systemInfo = self->_systemInfo;
  if (systemInfo)
  {
    v7 = [(AFAudioSessionCoordinationSystemInfo *)systemInfo buildDictionaryRepresentation];
    [v3 setObject:v7 forKey:@"systemInfo"];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (AFAudioSessionCoordinationDeviceInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"peerInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = [[AFPeerInfo alloc] initWithDictionaryRepresentation:v5];
    }
    else {
      v6 = 0;
    }

    v8 = [v4 objectForKey:@"systemInfo"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = [[AFAudioSessionCoordinationSystemInfo alloc] initWithDictionaryRepresentation:v8];
    }
    else {
      v9 = 0;
    }

    self = [(AFAudioSessionCoordinationDeviceInfo *)self initWithPeerInfo:v6 systemInfo:v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  peerInfo = self->_peerInfo;
  id v5 = a3;
  [v5 encodeObject:peerInfo forKey:@"AFAudioSessionCoordinationDeviceInfo::peerInfo"];
  [v5 encodeObject:self->_systemInfo forKey:@"AFAudioSessionCoordinationDeviceInfo::systemInfo"];
}

- (AFAudioSessionCoordinationDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationDeviceInfo::peerInfo"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationDeviceInfo::systemInfo"];

  v7 = [(AFAudioSessionCoordinationDeviceInfo *)self initWithPeerInfo:v5 systemInfo:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFAudioSessionCoordinationDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFAudioSessionCoordinationDeviceInfo *)v5 peerInfo];
      peerInfo = self->_peerInfo;
      if (peerInfo == v6 || [(AFPeerInfo *)peerInfo isEqual:v6])
      {
        v8 = [(AFAudioSessionCoordinationDeviceInfo *)v5 systemInfo];
        systemInfo = self->_systemInfo;
        BOOL v10 = systemInfo == v8 || [(AFAudioSessionCoordinationSystemInfo *)systemInfo isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AFPeerInfo *)self->_peerInfo hash];
  return [(AFAudioSessionCoordinationSystemInfo *)self->_systemInfo hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFAudioSessionCoordinationDeviceInfo;
  id v5 = [(AFAudioSessionCoordinationDeviceInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {peerInfo = %@, systemInfo = %@}", v5, self->_peerInfo, self->_systemInfo];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFAudioSessionCoordinationDeviceInfo *)self _descriptionWithIndent:0];
}

- (AFAudioSessionCoordinationDeviceInfo)initWithPeerInfo:(id)a3 systemInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__AFAudioSessionCoordinationDeviceInfo_initWithPeerInfo_systemInfo___block_invoke;
  v12[3] = &unk_1E5928610;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(AFAudioSessionCoordinationDeviceInfo *)self initWithBuilder:v12];

  return v10;
}

void __68__AFAudioSessionCoordinationDeviceInfo_initWithPeerInfo_systemInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPeerInfo:v3];
  [v4 setSystemInfo:*(void *)(a1 + 40)];
}

- (AFAudioSessionCoordinationDeviceInfo)init
{
  return [(AFAudioSessionCoordinationDeviceInfo *)self initWithBuilder:0];
}

- (AFAudioSessionCoordinationDeviceInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFAudioSessionCoordinationDeviceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFAudioSessionCoordinationDeviceInfo;
  id v5 = [(AFAudioSessionCoordinationDeviceInfo *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFAudioSessionCoordinationDeviceInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAudioSessionCoordinationDeviceInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFAudioSessionCoordinationDeviceInfoMutation *)v7 getPeerInfo];
      uint64_t v9 = [v8 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = (AFPeerInfo *)v9;

      v11 = [(_AFAudioSessionCoordinationDeviceInfoMutation *)v7 getSystemInfo];
      uint64_t v12 = [v11 copy];
      systemInfo = v6->_systemInfo;
      v6->_systemInfo = (AFAudioSessionCoordinationSystemInfo *)v12;
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
  id v4 = (void (**)(id, _AFAudioSessionCoordinationDeviceInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFAudioSessionCoordinationDeviceInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAudioSessionCoordinationDeviceInfoMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFAudioSessionCoordinationDeviceInfo);
      id v7 = [(_AFAudioSessionCoordinationDeviceInfoMutation *)v5 getPeerInfo];
      uint64_t v8 = [v7 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = (AFPeerInfo *)v8;

      BOOL v10 = [(_AFAudioSessionCoordinationDeviceInfoMutation *)v5 getSystemInfo];
      uint64_t v11 = [v10 copy];
      systemInfo = v6->_systemInfo;
      v6->_systemInfo = (AFAudioSessionCoordinationSystemInfo *)v11;
    }
    else
    {
      id v6 = (AFAudioSessionCoordinationDeviceInfo *)[(AFAudioSessionCoordinationDeviceInfo *)self copy];
    }
  }
  else
  {
    id v6 = (AFAudioSessionCoordinationDeviceInfo *)[(AFAudioSessionCoordinationDeviceInfo *)self copy];
  }

  return v6;
}

@end