@interface AFAudioPlaybackRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFAudioPlaybackRequest)init;
- (AFAudioPlaybackRequest)initWithBuilder:(id)a3;
- (AFAudioPlaybackRequest)initWithCoder:(id)a3;
- (AFAudioPlaybackRequest)initWithItemURL:(id)a3 itemData:(id)a4 numberOfLoops:(int64_t)a5 volume:(float)a6 fadeInDuration:(double)a7 fadeOutDuration:(double)a8 userInfo:(id)a9 hapticLibraryKey:(id)a10 UUID:(id)a11;
- (BOOL)isEqual:(id)a3;
- (NSData)itemData;
- (NSDictionary)userInfo;
- (NSString)UUID;
- (NSString)hapticLibraryKey;
- (NSURL)itemURL;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (float)volume;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)numberOfLoops;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFAudioPlaybackRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_hapticLibraryKey, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)hapticLibraryKey
{
  return self->_hapticLibraryKey;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (float)volume
{
  return self->_volume;
}

- (int64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (NSData)itemData
{
  return self->_itemData;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)encodeWithCoder:(id)a3
{
  itemURL = self->_itemURL;
  id v10 = a3;
  [v10 encodeObject:itemURL forKey:@"AFAudioPlaybackRequest::itemURL"];
  [v10 encodeObject:self->_itemData forKey:@"AFAudioPlaybackRequest::itemData"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_numberOfLoops];
  [v10 encodeObject:v5 forKey:@"AFAudioPlaybackRequest::numberOfLoops"];

  *(float *)&double v6 = self->_volume;
  v7 = [MEMORY[0x1E4F28ED0] numberWithFloat:v6];
  [v10 encodeObject:v7 forKey:@"AFAudioPlaybackRequest::volume"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fadeInDuration];
  [v10 encodeObject:v8 forKey:@"AFAudioPlaybackRequest::fadeInDuration"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fadeOutDuration];
  [v10 encodeObject:v9 forKey:@"AFAudioPlaybackRequest::fadeOutDuration"];

  [v10 encodeObject:self->_userInfo forKey:@"AFAudioPlaybackRequest::userInfo"];
  [v10 encodeObject:self->_hapticLibraryKey forKey:@"AFAudioPlaybackRequest::hapticLibraryKey"];
  [v10 encodeObject:self->_UUID forKey:@"AFAudioPlaybackRequest::UUID"];
}

- (AFAudioPlaybackRequest)initWithCoder:(id)a3
{
  id v3 = a3;
  v33 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::itemURL"];
  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::itemData"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::numberOfLoops"];
  uint64_t v31 = [v4 integerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::volume"];
  [v5 floatValue];
  int v7 = v6;

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::fadeInDuration"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::fadeOutDuration"];
  [v11 doubleValue];
  double v13 = v12;

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v30, "setWithObjects:", v29, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v23 = [v3 decodeObjectOfClasses:v22 forKey:@"AFAudioPlaybackRequest::userInfo"];

  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::hapticLibraryKey"];
  v25 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFAudioPlaybackRequest::UUID"];

  LODWORD(v26) = v7;
  v27 = [(AFAudioPlaybackRequest *)self initWithItemURL:v33 itemData:v32 numberOfLoops:v31 volume:v23 fadeInDuration:v24 fadeOutDuration:v25 userInfo:v26 hapticLibraryKey:v10 UUID:v13];

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFAudioPlaybackRequest *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t numberOfLoops = self->_numberOfLoops;
      if (numberOfLoops == [(AFAudioPlaybackRequest *)v5 numberOfLoops]
        && (float volume = self->_volume, [(AFAudioPlaybackRequest *)v5 volume], volume == v8)
        && (double fadeInDuration = self->_fadeInDuration,
            [(AFAudioPlaybackRequest *)v5 fadeInDuration],
            fadeInDuration == v10)
        && (double fadeOutDuration = self->_fadeOutDuration,
            [(AFAudioPlaybackRequest *)v5 fadeOutDuration],
            fadeOutDuration == v12))
      {
        uint64_t v15 = [(AFAudioPlaybackRequest *)v5 itemURL];
        itemURL = self->_itemURL;
        if (itemURL == v15 || [(NSURL *)itemURL isEqual:v15])
        {
          uint64_t v17 = [(AFAudioPlaybackRequest *)v5 itemData];
          itemData = self->_itemData;
          if (itemData == v17 || [(NSData *)itemData isEqual:v17])
          {
            uint64_t v19 = [(AFAudioPlaybackRequest *)v5 userInfo];
            userInfo = self->_userInfo;
            if (userInfo == v19 || [(NSDictionary *)userInfo isEqual:v19])
            {
              uint64_t v21 = [(AFAudioPlaybackRequest *)v5 hapticLibraryKey];
              hapticLibraryKey = self->_hapticLibraryKey;
              if (hapticLibraryKey == v21 || [(NSString *)hapticLibraryKey isEqual:v21])
              {
                v23 = [(AFAudioPlaybackRequest *)v5 UUID];
                UUID = self->_UUID;
                BOOL v13 = UUID == v23 || [(NSString *)UUID isEqual:v23];
              }
              else
              {
                BOOL v13 = 0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_itemURL hash];
  uint64_t v4 = [(NSData *)self->_itemData hash] ^ v3;
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_numberOfLoops];
  uint64_t v6 = v4 ^ [v5 hash];
  *(float *)&double v7 = self->_volume;
  float v8 = [MEMORY[0x1E4F28ED0] numberWithFloat:v7];
  uint64_t v9 = [v8 hash];
  double v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fadeInDuration];
  uint64_t v11 = v6 ^ v9 ^ [v10 hash];
  double v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_fadeOutDuration];
  uint64_t v13 = [v12 hash];
  uint64_t v14 = v13 ^ [(NSDictionary *)self->_userInfo hash];
  NSUInteger v15 = v11 ^ v14 ^ [(NSString *)self->_hapticLibraryKey hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_UUID hash];

  return v16;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFAudioPlaybackRequest;
  v5 = [(AFAudioPlaybackRequest *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {itemURL = %@, itemData = (%llu bytes), numberOfLoops = %lld, volume = %f, fadeInDuration = %f, fadeOutDuration = %f, userInfo = %@, hapticLibraryKey = %@, UUID = %@}", v5, self->_itemURL, -[NSData length](self->_itemData, "length"), self->_numberOfLoops, self->_volume, *(void *)&self->_fadeInDuration, *(void *)&self->_fadeOutDuration, self->_userInfo, self->_hapticLibraryKey, self->_UUID];

  return v6;
}

- (id)description
{
  return [(AFAudioPlaybackRequest *)self _descriptionWithIndent:0];
}

- (AFAudioPlaybackRequest)initWithItemURL:(id)a3 itemData:(id)a4 numberOfLoops:(int64_t)a5 volume:(float)a6 fadeInDuration:(double)a7 fadeOutDuration:(double)a8 userInfo:(id)a9 hapticLibraryKey:(id)a10 UUID:(id)a11
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __134__AFAudioPlaybackRequest_initWithItemURL_itemData_numberOfLoops_volume_fadeInDuration_fadeOutDuration_userInfo_hapticLibraryKey_UUID___block_invoke;
  v32[3] = &unk_1E592A7E8;
  id v33 = v20;
  id v34 = v21;
  float v41 = a6;
  double v39 = a7;
  double v40 = a8;
  id v35 = v22;
  id v36 = v23;
  id v37 = v24;
  int64_t v38 = a5;
  id v25 = v24;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  v30 = [(AFAudioPlaybackRequest *)self initWithBuilder:v32];

  return v30;
}

void __134__AFAudioPlaybackRequest_initWithItemURL_itemData_numberOfLoops_volume_fadeInDuration_fadeOutDuration_userInfo_hapticLibraryKey_UUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setItemURL:v3];
  [v5 setItemData:*(void *)(a1 + 40)];
  [v5 setNumberOfLoops:*(void *)(a1 + 72)];
  LODWORD(v4) = *(_DWORD *)(a1 + 96);
  [v5 setVolume:v4];
  [v5 setFadeInDuration:*(double *)(a1 + 80)];
  [v5 setFadeOutDuration:*(double *)(a1 + 88)];
  [v5 setUserInfo:*(void *)(a1 + 48)];
  [v5 setHapticLibraryKey:*(void *)(a1 + 56)];
  [v5 setUUID:*(void *)(a1 + 64)];
}

- (AFAudioPlaybackRequest)init
{
  return [(AFAudioPlaybackRequest *)self initWithBuilder:0];
}

- (AFAudioPlaybackRequest)initWithBuilder:(id)a3
{
  double v4 = (void (**)(id, _AFAudioPlaybackRequestMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)AFAudioPlaybackRequest;
  id v5 = [(AFAudioPlaybackRequest *)&v27 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    double v7 = [[_AFAudioPlaybackRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFAudioPlaybackRequestMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFAudioPlaybackRequestMutation *)v7 getItemURL];
      uint64_t v9 = [v8 copy];
      itemURL = v6->_itemURL;
      v6->_itemURL = (NSURL *)v9;

      uint64_t v11 = [(_AFAudioPlaybackRequestMutation *)v7 getItemData];
      uint64_t v12 = [v11 copy];
      itemData = v6->_itemData;
      v6->_itemData = (NSData *)v12;

      v6->_int64_t numberOfLoops = [(_AFAudioPlaybackRequestMutation *)v7 getNumberOfLoops];
      [(_AFAudioPlaybackRequestMutation *)v7 getVolume];
      v6->_float volume = v14;
      [(_AFAudioPlaybackRequestMutation *)v7 getFadeInDuration];
      v6->_double fadeInDuration = v15;
      [(_AFAudioPlaybackRequestMutation *)v7 getFadeOutDuration];
      v6->_double fadeOutDuration = v16;
      uint64_t v17 = [(_AFAudioPlaybackRequestMutation *)v7 getUserInfo];
      uint64_t v18 = [v17 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v18;

      id v20 = [(_AFAudioPlaybackRequestMutation *)v7 getHapticLibraryKey];
      uint64_t v21 = [v20 copy];
      hapticLibraryKey = v6->_hapticLibraryKey;
      v6->_hapticLibraryKey = (NSString *)v21;

      id v23 = [(_AFAudioPlaybackRequestMutation *)v7 getUUID];
      uint64_t v24 = [v23 copy];
      UUID = v6->_UUID;
      v6->_UUID = (NSString *)v24;
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
  double v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  double v4 = (void (**)(id, _AFAudioPlaybackRequestMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFAudioPlaybackRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFAudioPlaybackRequestMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFAudioPlaybackRequest);
      double v7 = [(_AFAudioPlaybackRequestMutation *)v5 getItemURL];
      uint64_t v8 = [v7 copy];
      itemURL = v6->_itemURL;
      v6->_itemURL = (NSURL *)v8;

      double v10 = [(_AFAudioPlaybackRequestMutation *)v5 getItemData];
      uint64_t v11 = [v10 copy];
      itemData = v6->_itemData;
      v6->_itemData = (NSData *)v11;

      v6->_int64_t numberOfLoops = [(_AFAudioPlaybackRequestMutation *)v5 getNumberOfLoops];
      [(_AFAudioPlaybackRequestMutation *)v5 getVolume];
      v6->_float volume = v13;
      [(_AFAudioPlaybackRequestMutation *)v5 getFadeInDuration];
      v6->_double fadeInDuration = v14;
      [(_AFAudioPlaybackRequestMutation *)v5 getFadeOutDuration];
      v6->_double fadeOutDuration = v15;
      double v16 = [(_AFAudioPlaybackRequestMutation *)v5 getUserInfo];
      uint64_t v17 = [v16 copy];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v17;

      uint64_t v19 = [(_AFAudioPlaybackRequestMutation *)v5 getHapticLibraryKey];
      uint64_t v20 = [v19 copy];
      hapticLibraryKey = v6->_hapticLibraryKey;
      v6->_hapticLibraryKey = (NSString *)v20;

      id v22 = [(_AFAudioPlaybackRequestMutation *)v5 getUUID];
      uint64_t v23 = [v22 copy];
      UUID = v6->_UUID;
      v6->_UUID = (NSString *)v23;
    }
    else
    {
      uint64_t v6 = (AFAudioPlaybackRequest *)[(AFAudioPlaybackRequest *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFAudioPlaybackRequest *)[(AFAudioPlaybackRequest *)self copy];
  }

  return v6;
}

@end