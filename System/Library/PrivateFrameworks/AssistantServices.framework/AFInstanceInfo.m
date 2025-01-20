@interface AFInstanceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFInstanceInfo)init;
- (AFInstanceInfo)initWithBuilder:(id)a3;
- (AFInstanceInfo)initWithCoder:(id)a3;
- (AFInstanceInfo)initWithDictionaryRepresentation:(id)a3;
- (AFInstanceInfo)initWithInstanceUUID:(id)a3 applicationType:(int64_t)a4 applicationUUID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)applicationUUID;
- (NSUUID)instanceUUID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)applicationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFInstanceInfo

- (AFInstanceInfo)initWithInstanceUUID:(id)a3 applicationType:(int64_t)a4 applicationUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__AFInstanceInfo_initWithInstanceUUID_applicationType_applicationUUID___block_invoke;
  v14[3] = &unk_1E59254D0;
  id v16 = v9;
  int64_t v17 = a4;
  id v15 = v8;
  id v10 = v9;
  id v11 = v8;
  v12 = [(AFInstanceInfo *)self initWithBuilder:v14];

  return v12;
}

- (AFInstanceInfo)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _AFInstanceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFInstanceInfo;
  v5 = [(AFInstanceInfo *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFInstanceInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFInstanceInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFInstanceInfoMutation *)v7 getInstanceUUID];
      uint64_t v9 = [v8 copy];
      instanceUUID = v6->_instanceUUID;
      v6->_instanceUUID = (NSUUID *)v9;

      v6->_applicationType = [(_AFInstanceInfoMutation *)v7 getApplicationType];
      id v11 = [(_AFInstanceInfoMutation *)v7 getApplicationUUID];
      uint64_t v12 = [v11 copy];
      applicationUUID = v6->_applicationUUID;
      v6->_applicationUUID = (NSUUID *)v12;
    }
  }

  return v6;
}

void __71__AFInstanceInfo_initWithInstanceUUID_applicationType_applicationUUID___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setInstanceUUID:v3];
  [v4 setApplicationType:a1[6]];
  [v4 setApplicationUUID:a1[5]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUUID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
}

- (NSUUID)applicationUUID
{
  return self->_applicationUUID;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (NSUUID)instanceUUID
{
  return self->_instanceUUID;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  instanceUUID = self->_instanceUUID;
  if (instanceUUID) {
    [v3 setObject:instanceUUID forKey:@"instanceUUID"];
  }
  int64_t applicationType = self->_applicationType;
  v7 = @"(unknown)";
  if (applicationType == 1) {
    v7 = @"default";
  }
  if (applicationType) {
    id v8 = v7;
  }
  else {
    id v8 = @"unspecified";
  }
  uint64_t v9 = v8;
  [v4 setObject:v9 forKey:@"applicationType"];

  applicationUUID = self->_applicationUUID;
  if (applicationUUID) {
    [v4 setObject:applicationUUID forKey:@"applicationUUID"];
  }
  id v11 = (void *)[v4 copy];

  return v11;
}

- (AFInstanceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"instanceUUID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    uint64_t v9 = [v5 objectForKey:@"applicationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = AFInstanceApplicationTypeGetFromName(v9);
    }
    else {
      uint64_t v10 = 0;
    }

    id v11 = [v5 objectForKey:@"applicationUUID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    self = [(AFInstanceInfo *)self initWithInstanceUUID:v7 applicationType:v10 applicationUUID:v12];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  instanceUUID = self->_instanceUUID;
  id v6 = a3;
  [v6 encodeObject:instanceUUID forKey:@"AFInstanceInfo::instanceUUID"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_applicationType];
  [v6 encodeObject:v5 forKey:@"AFInstanceInfo::applicationType"];

  [v6 encodeObject:self->_applicationUUID forKey:@"AFInstanceInfo::applicationUUID"];
}

- (AFInstanceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFInstanceInfo::instanceUUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFInstanceInfo::applicationType"];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFInstanceInfo::applicationUUID"];

  uint64_t v9 = [(AFInstanceInfo *)self initWithInstanceUUID:v5 applicationType:v7 applicationUUID:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFInstanceInfo *)a3;
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
      int64_t applicationType = self->_applicationType;
      if (applicationType == [(AFInstanceInfo *)v5 applicationType])
      {
        uint64_t v7 = [(AFInstanceInfo *)v5 instanceUUID];
        instanceUUID = self->_instanceUUID;
        if (instanceUUID == v7 || [(NSUUID *)instanceUUID isEqual:v7])
        {
          uint64_t v9 = [(AFInstanceInfo *)v5 applicationUUID];
          applicationUUID = self->_applicationUUID;
          BOOL v11 = applicationUUID == v9 || [(NSUUID *)applicationUUID isEqual:v9];
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
  uint64_t v3 = [(NSUUID *)self->_instanceUUID hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_applicationType];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ v3 ^ [(NSUUID *)self->_applicationUUID hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFInstanceInfo;
  uint64_t v5 = [(AFInstanceInfo *)&v13 description];
  instanceUUID = self->_instanceUUID;
  int64_t applicationType = self->_applicationType;
  id v8 = @"(unknown)";
  if (applicationType == 1) {
    id v8 = @"default";
  }
  if (applicationType) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = @"unspecified";
  }
  uint64_t v10 = v9;
  BOOL v11 = (void *)[v4 initWithFormat:@"%@ {instanceUUID = %@, applicationType = %@, applicationUUID = %@}", v5, instanceUUID, v10, self->_applicationUUID];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(AFInstanceInfo *)self _descriptionWithIndent:0];
}

- (AFInstanceInfo)init
{
  return [(AFInstanceInfo *)self initWithBuilder:0];
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
  id v4 = (void (**)(id, _AFInstanceInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFInstanceInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFInstanceInfoMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFInstanceInfo);
      uint64_t v7 = [(_AFInstanceInfoMutation *)v5 getInstanceUUID];
      uint64_t v8 = [v7 copy];
      instanceUUID = v6->_instanceUUID;
      v6->_instanceUUID = (NSUUID *)v8;

      v6->_int64_t applicationType = [(_AFInstanceInfoMutation *)v5 getApplicationType];
      uint64_t v10 = [(_AFInstanceInfoMutation *)v5 getApplicationUUID];
      uint64_t v11 = [v10 copy];
      applicationUUID = v6->_applicationUUID;
      v6->_applicationUUID = (NSUUID *)v11;
    }
    else
    {
      unint64_t v6 = (AFInstanceInfo *)[(AFInstanceInfo *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFInstanceInfo *)[(AFInstanceInfo *)self copy];
  }

  return v6;
}

@end