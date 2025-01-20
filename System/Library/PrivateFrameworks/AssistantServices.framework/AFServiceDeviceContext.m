@interface AFServiceDeviceContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFServiceDeviceContext)init;
- (AFServiceDeviceContext)initWithBuilder:(id)a3;
- (AFServiceDeviceContext)initWithCoder:(id)a3;
- (AFServiceDeviceContext)initWithIdentifier:(id)a3 assistantIdentifier:(id)a4 mediaSystemIdentifier:(id)a5 mediaRouteIdentifier:(id)a6 sharedUserID:(id)a7 roomName:(id)a8 proximity:(int64_t)a9 serializedContextByKey:(id)a10 metricsContext:(id)a11;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)metricsContext;
- (NSDictionary)serializedContextByKey;
- (NSString)assistantIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)mediaSystemIdentifier;
- (NSString)roomName;
- (NSString)sharedUserID;
- (NSUUID)identifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFServiceDeviceContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsContext, 0);
  objc_storeStrong((id *)&self->_serializedContextByKey, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)metricsContext
{
  return self->_metricsContext;
}

- (NSDictionary)serializedContextByKey
{
  return self->_serializedContextByKey;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"AFServiceDeviceContext::identifier"];
  [v6 encodeObject:self->_assistantIdentifier forKey:@"AFServiceDeviceContext::assistantIdentifier"];
  [v6 encodeObject:self->_mediaSystemIdentifier forKey:@"AFServiceDeviceContext::mediaSystemIdentifier"];
  [v6 encodeObject:self->_mediaRouteIdentifier forKey:@"AFServiceDeviceContext::mediaRouteIdentifier"];
  [v6 encodeObject:self->_sharedUserID forKey:@"AFServiceDeviceContext::sharedUserID"];
  [v6 encodeObject:self->_roomName forKey:@"AFServiceDeviceContext::roomName"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_proximity];
  [v6 encodeObject:v5 forKey:@"AFServiceDeviceContext::proximity"];

  [v6 encodeObject:self->_serializedContextByKey forKey:@"AFServiceDeviceContext::serializedContextByKey"];
  [v6 encodeObject:self->_metricsContext forKey:@"AFServiceDeviceContext::metricsContext"];
}

- (AFServiceDeviceContext)initWithCoder:(id)a3
{
  id v3 = a3;
  v39 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::identifier"];
  v38 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::assistantIdentifier"];
  v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::mediaSystemIdentifier"];
  v36 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::mediaRouteIdentifier"];
  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::sharedUserID"];
  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::roomName"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFServiceDeviceContext::proximity"];
  uint64_t v33 = [v4 integerValue];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v31, "setWithObjects:", v29, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v32 = [v3 decodeObjectOfClasses:v14 forKey:@"AFServiceDeviceContext::serializedContextByKey"];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v30, "setWithObjects:", v28, v15, v16, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
  v25 = [v3 decodeObjectOfClasses:v24 forKey:@"AFServiceDeviceContext::metricsContext"];

  v26 = [(AFServiceDeviceContext *)self initWithIdentifier:v39 assistantIdentifier:v38 mediaSystemIdentifier:v37 mediaRouteIdentifier:v36 sharedUserID:v35 roomName:v34 proximity:v33 serializedContextByKey:v32 metricsContext:v25];
  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFServiceDeviceContext *)a3;
  if (self == v4)
  {
    BOOL v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t proximity = self->_proximity;
      if (proximity == [(AFServiceDeviceContext *)v5 proximity])
      {
        uint64_t v7 = [(AFServiceDeviceContext *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v7 || [(NSUUID *)identifier isEqual:v7])
        {
          uint64_t v9 = [(AFServiceDeviceContext *)v5 assistantIdentifier];
          assistantIdentifier = self->_assistantIdentifier;
          if (assistantIdentifier == v9 || [(NSString *)assistantIdentifier isEqual:v9])
          {
            uint64_t v11 = [(AFServiceDeviceContext *)v5 mediaSystemIdentifier];
            mediaSystemIdentifier = self->_mediaSystemIdentifier;
            if (mediaSystemIdentifier == v11
              || [(NSString *)mediaSystemIdentifier isEqual:v11])
            {
              uint64_t v13 = [(AFServiceDeviceContext *)v5 mediaRouteIdentifier];
              mediaRouteIdentifier = self->_mediaRouteIdentifier;
              if (mediaRouteIdentifier == v13
                || [(NSString *)mediaRouteIdentifier isEqual:v13])
              {
                uint64_t v15 = [(AFServiceDeviceContext *)v5 sharedUserID];
                sharedUserID = self->_sharedUserID;
                if (sharedUserID == v15 || [(NSString *)sharedUserID isEqual:v15])
                {
                  uint64_t v17 = [(AFServiceDeviceContext *)v5 roomName];
                  roomName = self->_roomName;
                  if (roomName == v17 || [(NSString *)roomName isEqual:v17])
                  {
                    uint64_t v19 = [(AFServiceDeviceContext *)v5 serializedContextByKey];
                    serializedContextByKey = self->_serializedContextByKey;
                    if (serializedContextByKey == v19
                      || [(NSDictionary *)serializedContextByKey isEqual:v19])
                    {
                      v25 = v19;
                      uint64_t v21 = [(AFServiceDeviceContext *)v5 metricsContext];
                      metricsContext = self->_metricsContext;
                      BOOL v23 = metricsContext == v21
                         || [(NSDictionary *)metricsContext isEqual:v21];

                      uint64_t v19 = v25;
                    }
                    else
                    {
                      BOOL v23 = 0;
                    }
                  }
                  else
                  {
                    BOOL v23 = 0;
                  }
                }
                else
                {
                  BOOL v23 = 0;
                }
              }
              else
              {
                BOOL v23 = 0;
              }
            }
            else
            {
              BOOL v23 = 0;
            }
          }
          else
          {
            BOOL v23 = 0;
          }
        }
        else
        {
          BOOL v23 = 0;
        }
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_assistantIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_mediaSystemIdentifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_mediaRouteIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_sharedUserID hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_roomName hash];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_proximity];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = v8 ^ v10 ^ [(NSDictionary *)self->_serializedContextByKey hash];
  unint64_t v12 = v11 ^ [(NSDictionary *)self->_metricsContext hash];

  return v12;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFServiceDeviceContext;
  NSUInteger v5 = [(AFServiceDeviceContext *)&v8 description];
  NSUInteger v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, assistantIdentifier = %@, mediaSystemIdentifier = %@, mediaRouteIdentifier = %@, sharedUserID = %@, roomName = %@, proximity = %lld, serializedContextByKey = %@, metricsContext = %@}", v5, self->_identifier, self->_assistantIdentifier, self->_mediaSystemIdentifier, self->_mediaRouteIdentifier, self->_sharedUserID, self->_roomName, self->_proximity, self->_serializedContextByKey, self->_metricsContext];

  return v6;
}

- (id)description
{
  return [(AFServiceDeviceContext *)self _descriptionWithIndent:0];
}

- (AFServiceDeviceContext)initWithIdentifier:(id)a3 assistantIdentifier:(id)a4 mediaSystemIdentifier:(id)a5 mediaRouteIdentifier:(id)a6 sharedUserID:(id)a7 roomName:(id)a8 proximity:(int64_t)a9 serializedContextByKey:(id)a10 metricsContext:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __178__AFServiceDeviceContext_initWithIdentifier_assistantIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_sharedUserID_roomName_proximity_serializedContextByKey_metricsContext___block_invoke;
  v35[3] = &unk_1E5928BB8;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  id v43 = v23;
  int64_t v44 = a9;
  id v42 = v22;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v17;
  id v31 = v16;
  v32 = [(AFServiceDeviceContext *)self initWithBuilder:v35];

  return v32;
}

void __178__AFServiceDeviceContext_initWithIdentifier_assistantIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_sharedUserID_roomName_proximity_serializedContextByKey_metricsContext___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setIdentifier:v3];
  [v4 setAssistantIdentifier:a1[5]];
  [v4 setMediaSystemIdentifier:a1[6]];
  [v4 setMediaRouteIdentifier:a1[7]];
  [v4 setSharedUserID:a1[8]];
  [v4 setRoomName:a1[9]];
  [v4 setProximity:a1[12]];
  [v4 setSerializedContextByKey:a1[10]];
  [v4 setMetricsContext:a1[11]];
}

- (AFServiceDeviceContext)init
{
  return [(AFServiceDeviceContext *)self initWithBuilder:0];
}

- (AFServiceDeviceContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFServiceDeviceContextMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFServiceDeviceContext;
  NSUInteger v5 = [(AFServiceDeviceContext *)&v33 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFServiceDeviceContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFServiceDeviceContextMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFServiceDeviceContextMutation *)v7 getIdentifier];
      uint64_t v9 = [v8 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v9;

      uint64_t v11 = [(_AFServiceDeviceContextMutation *)v7 getAssistantIdentifier];
      uint64_t v12 = [v11 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v12;

      v14 = [(_AFServiceDeviceContextMutation *)v7 getMediaSystemIdentifier];
      uint64_t v15 = [v14 copy];
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v15;

      id v17 = [(_AFServiceDeviceContextMutation *)v7 getMediaRouteIdentifier];
      uint64_t v18 = [v17 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v18;

      id v20 = [(_AFServiceDeviceContextMutation *)v7 getSharedUserID];
      uint64_t v21 = [v20 copy];
      sharedUserID = v6->_sharedUserID;
      v6->_sharedUserID = (NSString *)v21;

      id v23 = [(_AFServiceDeviceContextMutation *)v7 getRoomName];
      uint64_t v24 = [v23 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v24;

      v6->_int64_t proximity = [(_AFServiceDeviceContextMutation *)v7 getProximity];
      id v26 = [(_AFServiceDeviceContextMutation *)v7 getSerializedContextByKey];
      uint64_t v27 = [v26 copy];
      serializedContextByKey = v6->_serializedContextByKey;
      v6->_serializedContextByKey = (NSDictionary *)v27;

      id v29 = [(_AFServiceDeviceContextMutation *)v7 getMetricsContext];
      uint64_t v30 = [v29 copy];
      metricsContext = v6->_metricsContext;
      v6->_metricsContext = (NSDictionary *)v30;
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
  id v4 = (void (**)(id, _AFServiceDeviceContextMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFServiceDeviceContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFServiceDeviceContextMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFServiceDeviceContext);
      NSUInteger v7 = [(_AFServiceDeviceContextMutation *)v5 getIdentifier];
      uint64_t v8 = [v7 copy];
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v8;

      uint64_t v10 = [(_AFServiceDeviceContextMutation *)v5 getAssistantIdentifier];
      uint64_t v11 = [v10 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v11;

      uint64_t v13 = [(_AFServiceDeviceContextMutation *)v5 getMediaSystemIdentifier];
      uint64_t v14 = [v13 copy];
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v14;

      id v16 = [(_AFServiceDeviceContextMutation *)v5 getMediaRouteIdentifier];
      uint64_t v17 = [v16 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v17;

      id v19 = [(_AFServiceDeviceContextMutation *)v5 getSharedUserID];
      uint64_t v20 = [v19 copy];
      sharedUserID = v6->_sharedUserID;
      v6->_sharedUserID = (NSString *)v20;

      id v22 = [(_AFServiceDeviceContextMutation *)v5 getRoomName];
      uint64_t v23 = [v22 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v23;

      v6->_int64_t proximity = [(_AFServiceDeviceContextMutation *)v5 getProximity];
      id v25 = [(_AFServiceDeviceContextMutation *)v5 getSerializedContextByKey];
      uint64_t v26 = [v25 copy];
      serializedContextByKey = v6->_serializedContextByKey;
      v6->_serializedContextByKey = (NSDictionary *)v26;

      id v28 = [(_AFServiceDeviceContextMutation *)v5 getMetricsContext];
      uint64_t v29 = [v28 copy];
      metricsContext = v6->_metricsContext;
      v6->_metricsContext = (NSDictionary *)v29;
    }
    else
    {
      NSUInteger v6 = (AFServiceDeviceContext *)[(AFServiceDeviceContext *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFServiceDeviceContext *)[(AFServiceDeviceContext *)self copy];
  }

  return v6;
}

@end