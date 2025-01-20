@interface AFASRSharedUserInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFASRSharedUserInfo)init;
- (AFASRSharedUserInfo)initWithBuilder:(id)a3;
- (AFASRSharedUserInfo)initWithCoder:(id)a3;
- (AFASRSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4 personaId:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)loggableSharedUserId;
- (NSString)personaId;
- (NSString)sharedUserId;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFASRSharedUserInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)encodeWithCoder:(id)a3
{
  sharedUserId = self->_sharedUserId;
  id v5 = a3;
  [v5 encodeObject:sharedUserId forKey:@"AFASRSharedUserInfo::sharedUserId"];
  [v5 encodeObject:self->_loggableSharedUserId forKey:@"AFASRSharedUserInfo::loggableSharedUserId"];
  [v5 encodeObject:self->_personaId forKey:@"AFASRSharedUserInfo::personaId"];
}

- (AFASRSharedUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFASRSharedUserInfo::sharedUserId"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFASRSharedUserInfo::loggableSharedUserId"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFASRSharedUserInfo::personaId"];

  v8 = [(AFASRSharedUserInfo *)self initWithSharedUserId:v5 loggableSharedUserId:v6 personaId:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFASRSharedUserInfo *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(AFASRSharedUserInfo *)v5 sharedUserId];
      sharedUserId = self->_sharedUserId;
      if (sharedUserId == v6 || [(NSString *)sharedUserId isEqual:v6])
      {
        v8 = [(AFASRSharedUserInfo *)v5 loggableSharedUserId];
        loggableSharedUserId = self->_loggableSharedUserId;
        if (loggableSharedUserId == v8 || [(NSString *)loggableSharedUserId isEqual:v8])
        {
          v10 = [(AFASRSharedUserInfo *)v5 personaId];
          personaId = self->_personaId;
          BOOL v12 = personaId == v10 || [(NSString *)personaId isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sharedUserId hash];
  NSUInteger v4 = [(NSString *)self->_loggableSharedUserId hash] ^ v3;
  return v4 ^ [(NSString *)self->_personaId hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFASRSharedUserInfo;
  id v5 = [(AFASRSharedUserInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {sharedUserId = %@, loggableSharedUserId = %@, personaId = %@}", v5, self->_sharedUserId, self->_loggableSharedUserId, self->_personaId];

  return v6;
}

- (id)description
{
  return [(AFASRSharedUserInfo *)self _descriptionWithIndent:0];
}

- (AFASRSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4 personaId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__AFASRSharedUserInfo_initWithSharedUserId_loggableSharedUserId_personaId___block_invoke;
  v16[3] = &unk_1E59288C8;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = [(AFASRSharedUserInfo *)self initWithBuilder:v16];

  return v14;
}

void __75__AFASRSharedUserInfo_initWithSharedUserId_loggableSharedUserId_personaId___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSharedUserId:v3];
  [v4 setLoggableSharedUserId:a1[5]];
  [v4 setPersonaId:a1[6]];
}

- (AFASRSharedUserInfo)init
{
  return [(AFASRSharedUserInfo *)self initWithBuilder:0];
}

- (AFASRSharedUserInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFASRSharedUserInfoMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFASRSharedUserInfo;
  id v5 = [(AFASRSharedUserInfo *)&v18 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFASRSharedUserInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFASRSharedUserInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFASRSharedUserInfoMutation *)v7 getSharedUserId];
      uint64_t v9 = [v8 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      id v11 = [(_AFASRSharedUserInfoMutation *)v7 getLoggableSharedUserId];
      uint64_t v12 = [v11 copy];
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v12;

      v14 = [(_AFASRSharedUserInfoMutation *)v7 getPersonaId];
      uint64_t v15 = [v14 copy];
      personaId = v6->_personaId;
      v6->_personaId = (NSString *)v15;
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
  id v4 = (void (**)(id, _AFASRSharedUserInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFASRSharedUserInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFASRSharedUserInfoMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFASRSharedUserInfo);
      v7 = [(_AFASRSharedUserInfoMutation *)v5 getSharedUserId];
      uint64_t v8 = [v7 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      id v10 = [(_AFASRSharedUserInfoMutation *)v5 getLoggableSharedUserId];
      uint64_t v11 = [v10 copy];
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v11;

      id v13 = [(_AFASRSharedUserInfoMutation *)v5 getPersonaId];
      uint64_t v14 = [v13 copy];
      personaId = v6->_personaId;
      v6->_personaId = (NSString *)v14;
    }
    else
    {
      v6 = (AFASRSharedUserInfo *)[(AFASRSharedUserInfo *)self copy];
    }
  }
  else
  {
    v6 = (AFASRSharedUserInfo *)[(AFASRSharedUserInfo *)self copy];
  }

  return v6;
}

@end