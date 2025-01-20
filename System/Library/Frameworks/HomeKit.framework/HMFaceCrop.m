@interface HMFaceCrop
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (CGRect)faceBoundingBox;
- (HMFaceCrop)initWithCoder:(id)a3;
- (HMFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6;
- (NSArray)attributeDescriptions;
- (NSData)dataRepresentation;
- (NSDate)dateCreated;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)UUID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFaceCrop

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (CGRect)faceBoundingBox
{
  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v5 = [(HMFaceCrop *)self UUID];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = NSNumber;
  v9 = [(HMFaceCrop *)self dataRepresentation];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v11 = (void *)[v7 initWithName:@"Data Representation Length" value:v10];
  [v3 addObject:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMFaceCrop *)self dateCreated];
  v14 = (void *)[v12 initWithName:@"Date Created" value:v13];
  [v3 addObject:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMFaceCrop *)self faceBoundingBox];
  v16 = NSStringFromRect(v21);
  v17 = (void *)[v15 initWithName:@"Face Bounding Box" value:v16];
  [v3 addObject:v17];

  v18 = (void *)[v3 copy];

  return (NSArray *)v18;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  double v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMFaceCrop)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.u"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.dr"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFC.ck.dc"];
  uint64_t v8 = [v4 decodeRectForKey:@"HMFC.ck.fbb"];
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    v11 = (void *)MEMORY[0x19F3A64A0](v8);
    v14 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v17 = 138544130;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ dataRepresentation: %@ dateCreated: %@", (uint8_t *)&v17, 0x2Au);
    }
    id v15 = 0;
  }
  else
  {
    v14 = -[HMFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7);
    id v15 = v14;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(HMFaceCrop *)self UUID];
  [v7 encodeObject:v4 forKey:@"HMFC.ck.u"];

  double v5 = [(HMFaceCrop *)self dataRepresentation];
  [v7 encodeObject:v5 forKey:@"HMFC.ck.dr"];

  v6 = [(HMFaceCrop *)self dateCreated];
  [v7 encodeObject:v6 forKey:@"HMFC.ck.dc"];

  [(HMFaceCrop *)self faceBoundingBox];
  objc_msgSend(v7, "encodeRect:forKey:", @"HMFC.ck.fbb");
}

- (unint64_t)hash
{
  double v2 = [(HMFaceCrop *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(HMFaceCrop *)self UUID];
    uint64_t v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      BOOL v9 = [(HMFaceCrop *)self dataRepresentation];
      v10 = [v6 dataRepresentation];
      if ([v9 isEqualToData:v10])
      {
        v11 = [(HMFaceCrop *)self dateCreated];
        id v12 = [v6 dateCreated];
        if ([v11 isEqualToDate:v12])
        {
          [(HMFaceCrop *)self faceBoundingBox];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          [v6 faceBoundingBox];
          v28.origin.x = v21;
          v28.origin.y = v22;
          v28.size.width = v23;
          v28.size.height = v24;
          v27.origin.x = v14;
          v27.origin.y = v16;
          v27.size.width = v18;
          v27.size.height = v20;
          BOOL v25 = NSEqualRects(v27, v28);
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (HMFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  CGFloat v16 = v15;
  if (!v15)
  {
LABEL_9:
    CGFloat v23 = (void *)_HMFPreconditionFailure();
    return (HMFaceCrop *)+[HMFaceCrop shortDescription];
  }
  v25.receiver = self;
  v25.super_class = (Class)HMFaceCrop;
  double v17 = [(HMFaceCrop *)&v25 init];
  if (v17)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v13);
    UUID = v17->_UUID;
    v17->_UUID = (NSUUID *)v18;

    uint64_t v20 = [v14 copy];
    dataRepresentation = v17->_dataRepresentation;
    v17->_dataRepresentation = (NSData *)v20;

    objc_storeStrong((id *)&v17->_dateCreated, a5);
    v17->_faceBoundingBox.origin.CGFloat x = x;
    v17->_faceBoundingBox.origin.CGFloat y = y;
    v17->_faceBoundingBox.size.CGFloat width = width;
    v17->_faceBoundingBox.size.CGFloat height = height;
  }

  return v17;
}

+ (id)shortDescription
{
  double v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end