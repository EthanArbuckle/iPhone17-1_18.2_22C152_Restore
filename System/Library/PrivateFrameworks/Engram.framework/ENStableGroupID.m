@interface ENStableGroupID
+ (BOOL)supportsSecureCoding;
+ (ENStableGroupID)stableGroupIDWithCurrentTime;
+ (unint64_t)stableGroupIDLength;
- (BOOL)isEqual:(id)a3;
- (ENStableGroupID)initWithCoder:(id)a3;
- (ENStableGroupID)initWithDataRepresentation:(id)a3;
- (ENStableGroupID)initWithUUID:(id)a3;
- (NSUUID)uuid;
- (id)_mutableDataRepresentation;
- (id)description;
- (int)customUUIDCompare:(unsigned __int8)a3[16] u2:(unsigned __int8)a4[16];
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ENStableGroupID

+ (unint64_t)stableGroupIDLength
{
  return 16;
}

+ (ENStableGroupID)stableGroupIDWithCurrentTime
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = (void *)[objc_alloc((Class)a1) initWithUUID:v3];

  return (ENStableGroupID *)v4;
}

- (id)_mutableDataRepresentation
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = [(ENStableGroupID *)self uuid];
  [v4 getUUIDBytes:v6];

  [v3 appendBytes:v6 length:16];
  return v3;
}

- (ENStableGroupID)initWithDataRepresentation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5 == [(id)objc_opt_class() stableGroupIDLength])
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    [v4 getBytes:&v10 length:16];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v10];
    self = [(ENStableGroupID *)self initWithUUID:v6];

    v7 = self;
  }
  else
  {
    v8 = +[ENLog groupID];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(void *)((char *)&v10 + 4) = v4;
      _os_log_impl(&dword_1DD450000, v8, OS_LOG_TYPE_DEFAULT, "ENStableGroupID initWithDataRepresentation - Wrong data length -- Failed {data: %{public}@}", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (ENStableGroupID)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENStableGroupID;
  v6 = [(ENStableGroupID *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (ENStableGroupID)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kENStableGroupIDUUID"];

  v6 = [(ENStableGroupID *)self initWithUUID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ENStableGroupID *)self uuid];
  [v4 encodeObject:v5 forKey:@"kENStableGroupIDUUID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 uuid];
    v6 = [(ENStableGroupID *)self uuid];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(ENStableGroupID *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  v9[4] = *MEMORY[0x1E4F143B8];
  memset(v9, 170, 32);
  id v4 = a3;
  id v5 = [(ENStableGroupID *)self uuid];
  [v5 getUUIDBytes:&v9[2]];

  v6 = [v4 uuid];

  [v6 getUUIDBytes:v9];
  int v7 = [(ENStableGroupID *)self customUUIDCompare:&v9[2] u2:v9];
  if (v7 < 0) {
    return -1;
  }
  else {
    return v7 > 0;
  }
}

- (int)customUUIDCompare:(unsigned __int8)a3[16] u2:(unsigned __int8)a4[16]
{
  int v4 = a3[6] & 0xF;
  int v5 = a4[6] & 0xF;
  int result = v4 - v5;
  if (v4 == v5)
  {
    int v7 = a3[7];
    int v8 = a4[7];
    int result = v7 - v8;
    if (v7 == v8)
    {
      int v9 = a3[4];
      int v10 = a4[4];
      int result = v9 - v10;
      if (v9 == v10)
      {
        int v11 = a3[5];
        int v12 = a4[5];
        int result = v11 - v12;
        if (v11 == v12)
        {
          int v13 = *a3;
          int v14 = *a4;
          int result = v13 - v14;
          if (v13 == v14)
          {
            int v15 = a3[1];
            int v16 = a4[1];
            int result = v15 - v16;
            if (v15 == v16)
            {
              int v17 = a3[2];
              int v18 = a4[2];
              int result = v17 - v18;
              if (v17 == v18) {
                return a3[3] - a4[3];
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(ENStableGroupID *)self uuid];
  v6 = [v3 stringWithFormat:@"<%@ %p uuid: %@>", v4, self, v5];

  return v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end