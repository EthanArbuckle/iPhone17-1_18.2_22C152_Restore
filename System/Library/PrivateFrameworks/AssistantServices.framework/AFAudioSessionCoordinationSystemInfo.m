@interface AFAudioSessionCoordinationSystemInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAudioSessionCoordinationSystemInfo)init;
- (AFAudioSessionCoordinationSystemInfo)initWithBuilder:(id)a3;
- (AFAudioSessionCoordinationSystemInfo)initWithCoder:(id)a3;
- (AFAudioSessionCoordinationSystemInfo)initWithDictionaryRepresentation:(id)a3;
- (AFAudioSessionCoordinationSystemInfo)initWithIsSupportedAndEnabled:(BOOL)a3 homeKitRoomName:(id)a4 homeKitMediaSystemIdentifier:(id)a5 mediaRemoteGroupIdentifier:(id)a6 mediaRemoteRouteIdentifier:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedAndEnabled;
- (NSString)description;
- (NSString)homeKitRoomName;
- (NSString)mediaRemoteGroupIdentifier;
- (NSString)mediaRemoteRouteIdentifier;
- (NSUUID)homeKitMediaSystemIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAudioSessionCoordinationSystemInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRemoteGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitRoomName, 0);
}

- (NSString)mediaRemoteRouteIdentifier
{
  return self->_mediaRemoteRouteIdentifier;
}

- (NSString)mediaRemoteGroupIdentifier
{
  return self->_mediaRemoteGroupIdentifier;
}

- (NSUUID)homeKitMediaSystemIdentifier
{
  return self->_homeKitMediaSystemIdentifier;
}

- (NSString)homeKitRoomName
{
  return self->_homeKitRoomName;
}

- (BOOL)isSupportedAndEnabled
{
  return self->_isSupportedAndEnabled;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSupportedAndEnabled];
  [v3 setObject:v4 forKey:@"isSupportedAndEnabled"];

  homeKitRoomName = self->_homeKitRoomName;
  if (homeKitRoomName) {
    [v3 setObject:homeKitRoomName forKey:@"homeKitRoomName"];
  }
  homeKitMediaSystemIdentifier = self->_homeKitMediaSystemIdentifier;
  if (homeKitMediaSystemIdentifier) {
    [v3 setObject:homeKitMediaSystemIdentifier forKey:@"homeKitMediaSystemIdentifier"];
  }
  mediaRemoteGroupIdentifier = self->_mediaRemoteGroupIdentifier;
  if (mediaRemoteGroupIdentifier) {
    [v3 setObject:mediaRemoteGroupIdentifier forKey:@"mediaRemoteGroupIdentifier"];
  }
  mediaRemoteRouteIdentifier = self->_mediaRemoteRouteIdentifier;
  if (mediaRemoteRouteIdentifier) {
    [v3 setObject:mediaRemoteRouteIdentifier forKey:@"mediaRemoteRouteIdentifier"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (AFAudioSessionCoordinationSystemInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"isSupportedAndEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v9 = [v7 BOOLValue];
    v10 = [v5 objectForKey:@"homeKitRoomName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    v12 = [v5 objectForKey:@"homeKitMediaSystemIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"mediaRemoteGroupIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v5 objectForKey:@"mediaRemoteRouteIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    self = [(AFAudioSessionCoordinationSystemInfo *)self initWithIsSupportedAndEnabled:v9 homeKitRoomName:v11 homeKitMediaSystemIdentifier:v13 mediaRemoteGroupIdentifier:v15 mediaRemoteRouteIdentifier:v17];
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
  BOOL isSupportedAndEnabled = self->_isSupportedAndEnabled;
  id v7 = a3;
  v6 = [v4 numberWithBool:isSupportedAndEnabled];
  [v7 encodeObject:v6 forKey:@"AFAudioSessionCoordinationSystemInfo::isSupportedAndEnabled"];

  [v7 encodeObject:self->_homeKitRoomName forKey:@"AFAudioSessionCoordinationSystemInfo::homeKitRoomName"];
  [v7 encodeObject:self->_homeKitMediaSystemIdentifier forKey:@"AFAudioSessionCoordinationSystemInfo::homeKitMediaSystemIdentifier"];
  [v7 encodeObject:self->_mediaRemoteGroupIdentifier forKey:@"AFAudioSessionCoordinationSystemInfo::mediaRemoteGroupIdentifier"];
  [v7 encodeObject:self->_mediaRemoteRouteIdentifier forKey:@"AFAudioSessionCoordinationSystemInfo::mediaRemoteRouteIdentifier"];
}

- (AFAudioSessionCoordinationSystemInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSystemInfo::isSupportedAndEnabled"];
  uint64_t v6 = [v5 BOOLValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSystemInfo::homeKitRoomName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSystemInfo::homeKitMediaSystemIdentifier"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSystemInfo::mediaRemoteGroupIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioSessionCoordinationSystemInfo::mediaRemoteRouteIdentifier"];

  id v11 = [(AFAudioSessionCoordinationSystemInfo *)self initWithIsSupportedAndEnabled:v6 homeKitRoomName:v7 homeKitMediaSystemIdentifier:v8 mediaRemoteGroupIdentifier:v9 mediaRemoteRouteIdentifier:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFAudioSessionCoordinationSystemInfo *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isSupportedAndEnabled = self->_isSupportedAndEnabled;
      if (isSupportedAndEnabled == [(AFAudioSessionCoordinationSystemInfo *)v5 isSupportedAndEnabled])
      {
        id v7 = [(AFAudioSessionCoordinationSystemInfo *)v5 homeKitRoomName];
        homeKitRoomName = self->_homeKitRoomName;
        if (homeKitRoomName == v7 || [(NSString *)homeKitRoomName isEqual:v7])
        {
          uint64_t v9 = [(AFAudioSessionCoordinationSystemInfo *)v5 homeKitMediaSystemIdentifier];
          homeKitMediaSystemIdentifier = self->_homeKitMediaSystemIdentifier;
          if (homeKitMediaSystemIdentifier == v9
            || [(NSUUID *)homeKitMediaSystemIdentifier isEqual:v9])
          {
            id v11 = [(AFAudioSessionCoordinationSystemInfo *)v5 mediaRemoteGroupIdentifier];
            mediaRemoteGroupIdentifier = self->_mediaRemoteGroupIdentifier;
            if (mediaRemoteGroupIdentifier == v11
              || [(NSString *)mediaRemoteGroupIdentifier isEqual:v11])
            {
              id v13 = [(AFAudioSessionCoordinationSystemInfo *)v5 mediaRemoteRouteIdentifier];
              mediaRemoteRouteIdentifier = self->_mediaRemoteRouteIdentifier;
              BOOL v15 = mediaRemoteRouteIdentifier == v13
                 || [(NSString *)mediaRemoteRouteIdentifier isEqual:v13];
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSupportedAndEnabled];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_homeKitRoomName hash];
  uint64_t v6 = v5 ^ [(NSUUID *)self->_homeKitMediaSystemIdentifier hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_mediaRemoteGroupIdentifier hash] ^ v4;
  NSUInteger v8 = v7 ^ [(NSString *)self->_mediaRemoteRouteIdentifier hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFAudioSessionCoordinationSystemInfo;
  uint64_t v5 = [(AFAudioSessionCoordinationSystemInfo *)&v10 description];
  uint64_t v6 = (void *)v5;
  NSUInteger v7 = @"YES";
  if (!self->_isSupportedAndEnabled) {
    NSUInteger v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {BOOL isSupportedAndEnabled = %@, homeKitRoomName = %@, homeKitMediaSystemIdentifier = %@, mediaRemoteGroupIdentifier = %@, mediaRemoteRouteIdentifier = %@}", v5, v7, self->_homeKitRoomName, self->_homeKitMediaSystemIdentifier, self->_mediaRemoteGroupIdentifier, self->_mediaRemoteRouteIdentifier];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFAudioSessionCoordinationSystemInfo *)self _descriptionWithIndent:0];
}

- (AFAudioSessionCoordinationSystemInfo)initWithIsSupportedAndEnabled:(BOOL)a3 homeKitRoomName:(id)a4 homeKitMediaSystemIdentifier:(id)a5 mediaRemoteGroupIdentifier:(id)a6 mediaRemoteRouteIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __169__AFAudioSessionCoordinationSystemInfo_initWithIsSupportedAndEnabled_homeKitRoomName_homeKitMediaSystemIdentifier_mediaRemoteGroupIdentifier_mediaRemoteRouteIdentifier___block_invoke;
  v22[3] = &unk_1E5926790;
  BOOL v27 = a3;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  v20 = [(AFAudioSessionCoordinationSystemInfo *)self initWithBuilder:v22];

  return v20;
}

void __169__AFAudioSessionCoordinationSystemInfo_initWithIsSupportedAndEnabled_homeKitRoomName_homeKitMediaSystemIdentifier_mediaRemoteGroupIdentifier_mediaRemoteRouteIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = a2;
  [v4 setIsSupportedAndEnabled:v3];
  [v4 setHomeKitRoomName:*(void *)(a1 + 32)];
  [v4 setHomeKitMediaSystemIdentifier:*(void *)(a1 + 40)];
  [v4 setMediaRemoteGroupIdentifier:*(void *)(a1 + 48)];
  [v4 setMediaRemoteRouteIdentifier:*(void *)(a1 + 56)];
}

- (AFAudioSessionCoordinationSystemInfo)init
{
  return [(AFAudioSessionCoordinationSystemInfo *)self initWithBuilder:0];
}

- (AFAudioSessionCoordinationSystemInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFAudioSessionCoordinationSystemInfoMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFAudioSessionCoordinationSystemInfo;
  uint64_t v5 = [(AFAudioSessionCoordinationSystemInfo *)&v21 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFAudioSessionCoordinationSystemInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAudioSessionCoordinationSystemInfoMutation *)v7 isDirty])
    {
      v6->_BOOL isSupportedAndEnabled = [(_AFAudioSessionCoordinationSystemInfoMutation *)v7 getIsSupportedAndEnabled];
      NSUInteger v8 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v7 getHomeKitRoomName];
      uint64_t v9 = [v8 copy];
      homeKitRoomName = v6->_homeKitRoomName;
      v6->_homeKitRoomName = (NSString *)v9;

      id v11 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v7 getHomeKitMediaSystemIdentifier];
      uint64_t v12 = [v11 copy];
      homeKitMediaSystemIdentifier = v6->_homeKitMediaSystemIdentifier;
      v6->_homeKitMediaSystemIdentifier = (NSUUID *)v12;

      id v14 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v7 getMediaRemoteGroupIdentifier];
      uint64_t v15 = [v14 copy];
      mediaRemoteGroupIdentifier = v6->_mediaRemoteGroupIdentifier;
      v6->_mediaRemoteGroupIdentifier = (NSString *)v15;

      id v17 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v7 getMediaRemoteRouteIdentifier];
      uint64_t v18 = [v17 copy];
      mediaRemoteRouteIdentifier = v6->_mediaRemoteRouteIdentifier;
      v6->_mediaRemoteRouteIdentifier = (NSString *)v18;
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
  id v4 = (void (**)(id, _AFAudioSessionCoordinationSystemInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFAudioSessionCoordinationSystemInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAudioSessionCoordinationSystemInfoMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFAudioSessionCoordinationSystemInfo);
      v6->_BOOL isSupportedAndEnabled = [(_AFAudioSessionCoordinationSystemInfoMutation *)v5 getIsSupportedAndEnabled];
      NSUInteger v7 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v5 getHomeKitRoomName];
      uint64_t v8 = [v7 copy];
      homeKitRoomName = v6->_homeKitRoomName;
      v6->_homeKitRoomName = (NSString *)v8;

      objc_super v10 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v5 getHomeKitMediaSystemIdentifier];
      uint64_t v11 = [v10 copy];
      homeKitMediaSystemIdentifier = v6->_homeKitMediaSystemIdentifier;
      v6->_homeKitMediaSystemIdentifier = (NSUUID *)v11;

      id v13 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v5 getMediaRemoteGroupIdentifier];
      uint64_t v14 = [v13 copy];
      mediaRemoteGroupIdentifier = v6->_mediaRemoteGroupIdentifier;
      v6->_mediaRemoteGroupIdentifier = (NSString *)v14;

      id v16 = [(_AFAudioSessionCoordinationSystemInfoMutation *)v5 getMediaRemoteRouteIdentifier];
      uint64_t v17 = [v16 copy];
      mediaRemoteRouteIdentifier = v6->_mediaRemoteRouteIdentifier;
      v6->_mediaRemoteRouteIdentifier = (NSString *)v17;
    }
    else
    {
      uint64_t v6 = (AFAudioSessionCoordinationSystemInfo *)[(AFAudioSessionCoordinationSystemInfo *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFAudioSessionCoordinationSystemInfo *)[(AFAudioSessionCoordinationSystemInfo *)self copy];
  }

  return v6;
}

@end