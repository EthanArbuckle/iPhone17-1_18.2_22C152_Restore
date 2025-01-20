@interface HMDCameraSignificantEventFaceClassification
+ (id)faceClassificationWithHMIFaceClassification:(id)a3 person:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HMDCameraSignificantEventFaceClassification)initWithUUID:(id)a3 personManagerUUID:(id)a4;
- (NSString)personName;
- (NSUUID)UUID;
- (NSUUID)personManagerUUID;
- (NSUUID)personUUID;
- (NSUUID)unassociatedFaceCropUUID;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setPersonName:(id)a3;
- (void)setPersonUUID:(id)a3;
- (void)setUnassociatedFaceCropUUID:(id)a3;
@end

@implementation HMDCameraSignificantEventFaceClassification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unassociatedFaceCropUUID, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_personManagerUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setUnassociatedFaceCropUUID:(id)a3
{
}

- (NSUUID)unassociatedFaceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPersonName:(id)a3
{
}

- (NSString)personName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonUUID:(id)a3
{
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)personManagerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCameraSignificantEventFaceClassification *)self UUID];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDCameraSignificantEventFaceClassification *)self personManagerUUID];
  v9 = (void *)[v7 initWithName:@"Person Manager UUID" value:v8];
  [v3 addObject:v9];

  v10 = [(HMDCameraSignificantEventFaceClassification *)self personUUID];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
    v12 = [(HMDCameraSignificantEventFaceClassification *)self personUUID];
    v13 = (void *)[v11 initWithName:@"Person UUID" value:v12];
    [v3 addObject:v13];
  }
  v14 = [(HMDCameraSignificantEventFaceClassification *)self personName];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
    v16 = [(HMDCameraSignificantEventFaceClassification *)self personName];
    v17 = [MEMORY[0x1E4F65538] defaultFormatter];
    v18 = (void *)[v15 initWithName:@"Person Name" value:v16 options:2 formatter:v17];
    [v3 addObject:v18];
  }
  v19 = [(HMDCameraSignificantEventFaceClassification *)self unassociatedFaceCropUUID];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
    v21 = [(HMDCameraSignificantEventFaceClassification *)self unassociatedFaceCropUUID];
    v22 = (void *)[v20 initWithName:@"Unassociated Face Crop UUID" value:v21];
    [v3 addObject:v22];
  }
  v23 = (void *)[v3 copy];

  return v23;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMDMutableCameraSignificantEventFaceClassification allocWithZone:a3];
  v5 = [(HMDCameraSignificantEventFaceClassification *)self UUID];
  v6 = [(HMDCameraSignificantEventFaceClassification *)self personManagerUUID];
  id v7 = [(HMDCameraSignificantEventFaceClassification *)v4 initWithUUID:v5 personManagerUUID:v6];

  v8 = [(HMDCameraSignificantEventFaceClassification *)self personUUID];
  [(HMDCameraSignificantEventFaceClassification *)v7 setPersonUUID:v8];

  v9 = [(HMDCameraSignificantEventFaceClassification *)self personName];
  [(HMDCameraSignificantEventFaceClassification *)v7 setPersonName:v9];

  v10 = [(HMDCameraSignificantEventFaceClassification *)self unassociatedFaceCropUUID];
  [(HMDCameraSignificantEventFaceClassification *)v7 setUnassociatedFaceCropUUID:v10];

  return v7;
}

+ (id)faceClassificationWithHMIFaceClassification:(id)a3 person:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [HMDMutableCameraSignificantEventFaceClassification alloc];
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [v5 sourceUUID];
  v10 = [(HMDCameraSignificantEventFaceClassification *)v7 initWithUUID:v8 personManagerUUID:v9];

  id v11 = [v5 personUUID];
  [(HMDCameraSignificantEventFaceClassification *)v10 setPersonUUID:v11];

  v12 = [v6 name];

  [(HMDCameraSignificantEventFaceClassification *)v10 setPersonName:v12];
  v13 = [v5 UUID];

  if (!v13)
  {
    v14 = [v5 faceCrop];
    id v15 = [v14 UUID];
    [(HMDCameraSignificantEventFaceClassification *)v10 setUnassociatedFaceCropUUID:v15];
  }
  v16 = (void *)[(HMDMutableCameraSignificantEventFaceClassification *)v10 copy];

  return v16;
}

- (unint64_t)hash
{
  v2 = [(HMDCameraSignificantEventFaceClassification *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMDCameraSignificantEventFaceClassification *)self UUID];
    v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDCameraSignificantEventFaceClassification *)self personManagerUUID];
      v10 = [v6 personManagerUUID];
      if (![v9 isEqual:v10]) {
        goto LABEL_12;
      }
      id v11 = [(HMDCameraSignificantEventFaceClassification *)self personUUID];
      v12 = [v6 personUUID];
      int v13 = HMFEqualObjects();

      if (!v13) {
        goto LABEL_12;
      }
      v14 = [(HMDCameraSignificantEventFaceClassification *)self personName];
      id v15 = [v6 personName];
      int v16 = HMFEqualObjects();

      if (v16)
      {
        v17 = [(HMDCameraSignificantEventFaceClassification *)self unassociatedFaceCropUUID];
        v18 = [v6 unassociatedFaceCropUUID];
        char v19 = HMFEqualObjects();
      }
      else
      {
LABEL_12:
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (HMDCameraSignificantEventFaceClassification)initWithUUID:(id)a3 personManagerUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = v8;
    v15.receiver = self;
    v15.super_class = (Class)HMDCameraSignificantEventFaceClassification;
    v10 = [(HMDCameraSignificantEventFaceClassification *)&v15 init];
    id v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_UUID, a3);
      objc_storeStrong((id *)&v11->_personManagerUUID, a4);
    }

    return v11;
  }
  else
  {
    int v13 = (HMDAccessory *)_HMFPreconditionFailure();
    [(HMDAccessory *)v13 .cxx_destruct];
  }
  return result;
}

@end