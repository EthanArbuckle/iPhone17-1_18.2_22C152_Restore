@interface HMPersonFaceCrop
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMPersonFaceCrop)initWithCoder:(id)a3;
- (HMPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7;
- (NSUUID)personUUID;
- (NSUUID)unassociatedFaceCropUUID;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setUnassociatedFaceCropUUID:(id)a3;
@end

@implementation HMPersonFaceCrop

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unassociatedFaceCropUUID, 0);

  objc_storeStrong((id *)&self->_personUUID, 0);
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setUnassociatedFaceCropUUID:(id)a3
{
}

- (NSUUID)unassociatedFaceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (id)attributeDescriptions
{
  v17.receiver = self;
  v17.super_class = (Class)HMPersonFaceCrop;
  v3 = [(HMFaceCrop *)&v17 attributeDescriptions];
  v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMPersonFaceCrop *)self personUUID];
  v7 = (void *)[v5 initWithName:@"Person UUID" value:v6];
  [v4 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = HMStringFromPersonFaceCropSource([(HMPersonFaceCrop *)self source]);
  v10 = (void *)[v8 initWithName:@"Source" value:v9];
  [v4 addObject:v10];

  v11 = [(HMPersonFaceCrop *)self unassociatedFaceCropUUID];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
    v13 = [(HMPersonFaceCrop *)self unassociatedFaceCropUUID];
    v14 = (void *)[v12 initWithName:@"Unassociated Face Crop UUID" value:v13];
    [v4 addObject:v14];
  }
  v15 = (void *)[v4 copy];

  return v15;
}

- (HMPersonFaceCrop)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[HMFaceCrop alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMPFC.ck.pu"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMPFC.ck.ufcu"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"HMPFC.ck.s"];
    if (v6)
    {
      uint64_t v9 = v8;
      v10 = [(HMFaceCrop *)v5 UUID];
      v11 = [(HMFaceCrop *)v5 dataRepresentation];
      id v12 = [(HMFaceCrop *)v5 dateCreated];
      [(HMFaceCrop *)v5 faceBoundingBox];
      self = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v10, v11, v12, v6);

      [(HMPersonFaceCrop *)self setUnassociatedFaceCropUUID:v7];
      [(HMPersonFaceCrop *)self setSource:v9];
      v13 = self;
    }
    else
    {
      v14 = (void *)MEMORY[0x19F3A64A0](v8);
      self = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        v19 = v16;
        __int16 v20 = 2112;
        uint64_t v21 = 0;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@", (uint8_t *)&v18, 0x16u);
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMPersonFaceCrop;
  id v4 = a3;
  [(HMFaceCrop *)&v7 encodeWithCoder:v4];
  id v5 = [(HMPersonFaceCrop *)self personUUID];
  [v4 encodeObject:v5 forKey:@"HMPFC.ck.pu"];

  v6 = [(HMPersonFaceCrop *)self unassociatedFaceCropUUID];
  [v4 encodeObject:v6 forKey:@"HMPFC.ck.ufcu"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMPersonFaceCrop source](self, "source"), @"HMPFC.ck.s");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutablePersonFaceCrop allocWithZone:a3];
  id v5 = [(HMFaceCrop *)self UUID];
  v6 = [(HMFaceCrop *)self dataRepresentation];
  objc_super v7 = [(HMFaceCrop *)self dateCreated];
  [(HMFaceCrop *)self faceBoundingBox];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(HMPersonFaceCrop *)self personUUID];
  objc_super v17 = -[HMPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:](v4, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:", v5, v6, v7, v16, v9, v11, v13, v15);

  int v18 = [(HMPersonFaceCrop *)self unassociatedFaceCropUUID];
  [(HMPersonFaceCrop *)v17 setUnassociatedFaceCropUUID:v18];

  [(HMPersonFaceCrop *)v17 setSource:[(HMPersonFaceCrop *)self source]];
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  if (v6
    && (v15.receiver = self,
        v15.super_class = (Class)HMPersonFaceCrop,
        [(HMFaceCrop *)&v15 isEqual:v6]))
  {
    objc_super v7 = [(HMPersonFaceCrop *)self personUUID];
    double v8 = [v6 personUUID];
    if ([v7 isEqual:v8]
      && ([(HMPersonFaceCrop *)self unassociatedFaceCropUUID],
          double v9 = objc_claimAutoreleasedReturnValue(),
          [v6 unassociatedFaceCropUUID],
          double v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = HMFEqualObjects(),
          v10,
          v9,
          v11))
    {
      int64_t v12 = [(HMPersonFaceCrop *)self source];
      BOOL v13 = v12 == [v6 source];
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

  return v13;
}

- (HMPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v19 = v18;
  if (!v18)
  {
LABEL_11:
    v24 = (HMCameraSettingsControl *)_HMFPreconditionFailure();
    [(HMCameraSettingsControl *)v24 .cxx_destruct];
    return result;
  }
  v26.receiver = self;
  v26.super_class = (Class)HMPersonFaceCrop;
  __int16 v20 = -[HMFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](&v26, sel_initWithUUID_dataRepresentation_dateCreated_faceBoundingBox_, v15, v16, v17, x, y, width, height);
  if (v20)
  {
    uint64_t v21 = [v19 copy];
    personUUID = v20->_personUUID;
    v20->_personUUID = (NSUUID *)v21;
  }
  return v20;
}

@end