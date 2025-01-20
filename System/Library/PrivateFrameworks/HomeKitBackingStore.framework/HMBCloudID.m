@interface HMBCloudID
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (CKContainerID)containerID;
- (HMBCloudID)initWithCoder:(id)a3;
- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4;
- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4 name:(id)a5 modelID:(id)a6;
- (NSString)name;
- (NSUUID)modelID;
- (id)attributeDescriptions;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (int64_t)scope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMBCloudID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

- (NSUUID)modelID
{
  return self->_modelID;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)scope
{
  return self->_scope;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (unint64_t)hash
{
  v2 = [(HMBCloudID *)self modelID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMBCloudID *)self modelID];
    v8 = [v6 modelID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HMBCloudID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBCID.c"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMBCID.s"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBCID.n"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBCID.m"];

  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    v11 = 0;
  }
  else
  {
    self = [(HMBCloudID *)self initWithContainerID:v5 scope:v6 name:v7 modelID:v8];
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMBCloudID *)self containerID];
  [v4 encodeObject:v5 forKey:@"HMBCID.c"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMBCloudID scope](self, "scope"), @"HMBCID.s");
  uint64_t v6 = [(HMBCloudID *)self name];
  [v4 encodeObject:v6 forKey:@"HMBCID.n"];

  id v7 = [(HMBCloudID *)self modelID];
  [v4 encodeObject:v7 forKey:@"HMBCID.m"];
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBCloudID *)self name];
  v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v7 = [(HMBCloudID *)self modelID];
  v8 = (void *)[v6 initWithName:@"Model ID" value:v7];
  v11[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4 name:(id)a5 modelID:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMBCloudID;
  v14 = [(HMBCloudID *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_containerID, a3);
    v15->_scope = a4;
    objc_storeStrong((id *)&v15->_name, a5);
    objc_storeStrong((id *)&v15->_modelID, a6);
  }

  return v15;
}

- (HMBCloudID)initWithContainerID:(id)a3 scope:(int64_t)a4
{
  v29[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 environment];
  id v6 = CKContainerEnvironmentString();
  id v7 = [v5 containerIdentifier];
  int64_t v23 = a4;
  v8 = CKDatabaseScopeString();
  v21 = [NSString stringWithFormat:@"%@.%@.%@", v6, v8, v7];
  v29[0] = v6;
  v29[1] = v7;
  v29[2] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  v10 = [MEMORY[0x1E4F1CA58] data];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v24 + 1) + 8 * v15) dataUsingEncoding:4];
        [v10 appendData:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"759390E3-198F-48EB-AD00-31296DACBBA6"];
  v18 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", v17, v10);
  v19 = [(HMBCloudID *)self initWithContainerID:v5 scope:v23 name:v21 modelID:v18];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:a5];
}

@end