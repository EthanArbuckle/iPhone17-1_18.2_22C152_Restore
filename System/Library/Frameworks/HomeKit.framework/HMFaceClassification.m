@interface HMFaceClassification
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMFaceClassification)initWithCoder:(id)a3;
- (HMFaceClassification)initWithPersonManagerUUID:(id)a3 person:(id)a4 faceCrop:(id)a5;
- (HMFaceCrop)faceCrop;
- (HMPerson)person;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)personManagerUUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFaceClassification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCrop, 0);
  objc_storeStrong((id *)&self->_person, 0);

  objc_storeStrong((id *)&self->_personManagerUUID, 0);
}

- (HMFaceCrop)faceCrop
{
  return (HMFaceCrop *)objc_getProperty(self, a2, 24, 1);
}

- (HMPerson)person
{
  return (HMPerson *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMFaceClassification *)self personManagerUUID];
  v6 = (void *)[v4 initWithName:@"Person Manager UUID" value:v5];
  [v3 addObject:v6];

  v7 = [(HMFaceClassification *)self person];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
    v9 = [(HMFaceClassification *)self person];
    v10 = (void *)[v8 initWithName:@"Person" value:v9];
    [v3 addObject:v10];
  }
  v11 = [(HMFaceClassification *)self faceCrop];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
    v13 = [(HMFaceClassification *)self faceCrop];
    v14 = (void *)[v12 initWithName:@"Face Crop" value:v13];
    [v3 addObject:v14];
  }
  v15 = (void *)[v3 copy];

  return (NSArray *)v15;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMFaceClassification)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.pmu"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.p"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.fc"];
  if (v5)
  {
    id v8 = [(HMFaceClassification *)self initWithPersonManagerUUID:v5 person:v6 faceCrop:v7];
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A64A0]();
    id v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = 0;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personManagerUUID: %@", (uint8_t *)&v14, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMFaceClassification *)self personManagerUUID];
  [v4 encodeObject:v5 forKey:@"HMFC.ck.pmu"];

  v6 = [(HMFaceClassification *)self person];
  [v4 encodeObject:v6 forKey:@"HMFC.ck.p"];

  id v7 = [(HMFaceClassification *)self faceCrop];
  [v4 encodeObject:v7 forKey:@"HMFC.ck.fc"];
}

- (unint64_t)hash
{
  v3 = [(HMFaceClassification *)self personManagerUUID];
  uint64_t v4 = [v3 hash];

  v5 = [(HMFaceClassification *)self person];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMFaceClassification *)self faceCrop];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
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
    id v7 = [(HMFaceClassification *)self personManagerUUID];
    unint64_t v8 = [v6 personManagerUUID];
    if ([v7 isEqual:v8]
      && ([(HMFaceClassification *)self person],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v6 person],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      id v12 = [(HMFaceClassification *)self faceCrop];
      v13 = [v6 faceCrop];
      char v14 = HMFEqualObjects();
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (HMFaceClassification)initWithPersonManagerUUID:(id)a3 person:(id)a4 faceCrop:(id)a5
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v12 = (void *)v11;
  if (!(v10 | v11))
  {
LABEL_7:
    v20 = (void *)_HMFPreconditionFailure();
    return (HMFaceClassification *)+[HMFaceClassification shortDescription];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMFaceClassification;
  v13 = [(HMFaceClassification *)&v22 init];
  char v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_personManagerUUID, a3);
    uint64_t v15 = [(id)v10 copy];
    person = v14->_person;
    v14->_person = (HMPerson *)v15;

    uint64_t v17 = [v12 copy];
    faceCrop = v14->_faceCrop;
    v14->_faceCrop = (HMFaceCrop *)v17;
  }
  return v14;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end