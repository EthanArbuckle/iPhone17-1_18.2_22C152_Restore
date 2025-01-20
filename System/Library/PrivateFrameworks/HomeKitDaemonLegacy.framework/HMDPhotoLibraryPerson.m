@interface HMDPhotoLibraryPerson
- (BOOL)isEqual:(id)a3;
- (HMDPhotoLibraryPerson)initWithHMPerson:(id)a3;
- (HMDPhotoLibraryPerson)initWithUUID:(id)a3 name:(id)a4;
- (NSString)name;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (id)createHMPerson;
- (unint64_t)hash;
- (void)updateHMPerson:(id)a3;
@end

@implementation HMDPhotoLibraryPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDPhotoLibraryPerson *)self UUID];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  v7 = [(HMDPhotoLibraryPerson *)self name];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
    v9 = [(HMDPhotoLibraryPerson *)self name];
    v10 = (void *)[v8 initWithName:@"Name" value:v9];
    [v3 addObject:v10];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

- (unint64_t)hash
{
  v2 = [(HMDPhotoLibraryPerson *)self UUID];
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
    v7 = [(HMDPhotoLibraryPerson *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDPhotoLibraryPerson *)self name];
      v10 = [v6 name];
      char v11 = HMFEqualObjects();
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)updateHMPerson:(id)a3
{
  id v4 = a3;
  v5 = [(HMDPhotoLibraryPerson *)self name];
  [v4 setName:v5];

  id v6 = [(HMDPhotoLibraryPerson *)self UUID];
  [v4 setExternalPersonUUID:v6];
}

- (id)createHMPerson
{
  unint64_t v3 = [(HMDPhotoLibraryPerson *)self UUID];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F2E988]) initWithUUID:v3];
  [(HMDPhotoLibraryPerson *)self updateHMPerson:v4];
  v5 = (void *)[v4 copy];

  return v5;
}

- (HMDPhotoLibraryPerson)initWithUUID:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    v18.receiver = self;
    v18.super_class = (Class)HMDPhotoLibraryPerson;
    v9 = [(HMDPhotoLibraryPerson *)&v18 init];
    if (v9)
    {
      uint64_t v10 = [v6 copy];
      UUID = v9->_UUID;
      v9->_UUID = (NSUUID *)v10;

      uint64_t v12 = [v8 copy];
      name = v9->_name;
      v9->_name = (NSString *)v12;
    }
    return v9;
  }
  else
  {
    v15 = (HMDPhotoLibraryPerson *)_HMFPreconditionFailure();
    return [(HMDPhotoLibraryPerson *)v15 initWithHMPerson:v17];
  }
}

- (HMDPhotoLibraryPerson)initWithHMPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 externalPersonUUID];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 UUID];
  }
  id v8 = v7;

  v9 = [v4 name];
  uint64_t v10 = [(HMDPhotoLibraryPerson *)self initWithUUID:v8 name:v9];

  return v10;
}

@end