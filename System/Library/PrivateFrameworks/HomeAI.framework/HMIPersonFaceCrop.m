@interface HMIPersonFaceCrop
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIPersonFaceCrop)initWithCoder:(id)a3;
- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7;
- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7 source:(int64_t)a8;
- (NSUUID)personUUID;
- (id)attributeDescriptions;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIPersonFaceCrop

- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7
{
  return -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", a3, a4, a5, a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (HMIPersonFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6 personUUID:(id)a7 source:(int64_t)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v18)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v19)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v21 = v20;
  if (!v20)
  {
LABEL_11:
    v26 = (HMIPersonFaceCrop *)_HMFPreconditionFailure();
    return (HMIPersonFaceCrop *)[(HMIPersonFaceCrop *)v26 attributeDescriptions];
  }
  v28.receiver = self;
  v28.super_class = (Class)HMIPersonFaceCrop;
  v22 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](&v28, sel_initWithUUID_dataRepresentation_dateCreated_faceBoundingBox_, v17, v18, v19, x, y, width, height);
  if (v22)
  {
    uint64_t v23 = [v21 copy];
    personUUID = v22->_personUUID;
    v22->_personUUID = (NSUUID *)v23;

    v22->_source = a8;
  }

  return v22;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)HMIPersonFaceCrop;
  v3 = [(HMIFaceCrop *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v5 = [(HMIPersonFaceCrop *)self personUUID];
  v6 = (void *)[v4 initWithName:@"Person UUID" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = HMIPersonFaceCropSourceAsString([(HMIPersonFaceCrop *)self source]);
  v9 = (void *)[v7 initWithName:@"Source" value:v8];
  v14[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
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
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)HMIPersonFaceCrop,
        [(HMIFaceCrop *)&v12 isEqual:v6]))
  {
    id v7 = [(HMIPersonFaceCrop *)self personUUID];
    v8 = [v6 personUUID];
    if ([v7 isEqual:v8])
    {
      int64_t v9 = [(HMIPersonFaceCrop *)self source];
      BOOL v10 = v9 == [v6 source];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMIPersonFaceCrop;
  id v4 = a3;
  [(HMIFaceCrop *)&v6 encodeWithCoder:v4];
  v5 = [(HMIPersonFaceCrop *)self personUUID];
  [v4 encodeObject:v5 forKey:@"HMIFC.ck.pu"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMIPersonFaceCrop source](self, "source"), @"HMIFC.ck.so");
}

- (HMIPersonFaceCrop)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMIFaceCrop alloc] initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.ck.pu"];
    if (v6)
    {
      if ([v4 containsValueForKey:@"HMIFC.ck.so"]) {
        uint64_t v7 = [v4 decodeIntegerForKey:@"HMIFC.ck.so"];
      }
      else {
        uint64_t v7 = 0;
      }
      objc_super v12 = [(HMIFaceCrop *)v5 UUID];
      objc_super v13 = [(HMIFaceCrop *)v5 dataRepresentation];
      v14 = [(HMIFaceCrop *)v5 dateCreated];
      [(HMIFaceCrop *)v5 faceBoundingBox];
      self = -[HMIPersonFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:personUUID:source:", v12, v13, v14, v6, v7);

      v8 = self;
    }
    else
    {
      int64_t v9 = (void *)MEMORY[0x22A641C70]();
      self = self;
      BOOL v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v16 = 138543618;
        id v17 = v11;
        __int16 v18 = 2112;
        uint64_t v19 = 0;
        _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded personUUID: %@", (uint8_t *)&v16, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
}

@end