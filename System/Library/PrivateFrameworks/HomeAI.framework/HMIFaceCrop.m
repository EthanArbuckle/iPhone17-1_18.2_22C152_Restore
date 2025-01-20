@interface HMIFaceCrop
+ (BOOL)supportsSecureCoding;
+ (id)faceCropFromPhotosFaceCropImageData:(id)a3;
+ (id)selectBestObservation:(id)a3 faceBoundingBoxFromPhotos:(CGRect)a4;
- (BOOL)isEqual:(id)a3;
- (CGRect)faceBoundingBox;
- (HMIFaceCrop)initWithCoder:(id)a3;
- (HMIFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6;
- (NSData)dataRepresentation;
- (NSDate)dateCreated;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIFaceCrop

- (HMIFaceCrop)initWithUUID:(id)a3 dataRepresentation:(id)a4 dateCreated:(id)a5 faceBoundingBox:(CGRect)a6
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
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v25 = (void *)_HMFPreconditionFailure();
    return (HMIFaceCrop *)+[HMIFaceCrop faceCropFromPhotosFaceCropImageData:v27];
  }
  v28.receiver = self;
  v28.super_class = (Class)HMIFaceCrop;
  v17 = [(HMIFaceCrop *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    UUID = v17->_UUID;
    v17->_UUID = (NSUUID *)v18;

    uint64_t v20 = [v14 copy];
    dataRepresentation = v17->_dataRepresentation;
    v17->_dataRepresentation = (NSData *)v20;

    uint64_t v22 = [v16 copy];
    dateCreated = v17->_dateCreated;
    v17->_dateCreated = (NSDate *)v22;

    v17->_faceBoundingBox.origin.CGFloat x = x;
    v17->_faceBoundingBox.origin.CGFloat y = y;
    v17->_faceBoundingBox.size.CGFloat width = width;
    v17->_faceBoundingBox.size.CGFloat height = height;
  }

  return v17;
}

+ (id)faceCropFromPhotosFaceCropImageData:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v47 = 0;
  v5 = +[HMIFaceDetectorVision detectFacesInImageData:v4 error:&v47];
  id v6 = v47;
  if (v5 && [v5 count] == 1)
  {
    v7 = [v5 firstObject];
    [v7 unalignedBoundingBox];
    HMICGRectFlipCoordinateSpaceNormalized(v8, v9, v10, v11);
    double x = v12;
    double y = v14;
    double width = v16;
    double height = v18;

LABEL_19:
    v43 = [HMIFaceCrop alloc];
    v44 = [MEMORY[0x263F08C38] UUID];
    v45 = [MEMORY[0x263EFF910] date];
    v24 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v43, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v44, v4, v45, x, y, width, height);

    goto LABEL_20;
  }
  +[HMIFaceUtilities faceBoundingBoxFromPhotosFaceCropData:v4];
  double x = v54.origin.x;
  double y = v54.origin.y;
  double width = v54.size.width;
  double height = v54.size.height;
  if (!CGRectIsNull(v54))
  {
    if (v5 && [v5 count])
    {
      v25 = objc_msgSend((id)objc_opt_class(), "selectBestObservation:faceBoundingBoxFromPhotos:", v5, x, y, width, height);
      SEL v26 = v25;
      if (v25)
      {
        [v25 unalignedBoundingBox];
        HMICGRectFlipCoordinateSpaceNormalized(v27, v28, v29, v30);
        double x = v31;
        double y = v32;
        double width = v33;
        double height = v34;
      }
      else
      {
        v39 = (void *)MEMORY[0x22A641C70]();
        id v40 = a1;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v49 = v42;
          _os_log_impl(&dword_225DC6000, v41, OS_LOG_TYPE_ERROR, "%{public}@No detected box overlaps with photos bounding box, falling back to photos bounding box", buf, 0xCu);
        }
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x22A641C70]();
      id v36 = a1;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v38;
        __int16 v50 = 2112;
        id v51 = v6;
        _os_log_impl(&dword_225DC6000, v37, OS_LOG_TYPE_ERROR, "%{public}@Error while detecting face in Photos face crop, error: %@, or no box detected, falling back to photos bounding box", buf, 0x16u);
      }
    }
    goto LABEL_19;
  }
  uint64_t v20 = (void *)MEMORY[0x22A641C70]();
  id v21 = a1;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v49 = v23;
    _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_ERROR, "%{public}@Error, couldn't get face box from photos data, ignoring face crop", buf, 0xCu);
  }
  v24 = 0;
LABEL_20:

  return v24;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMIFaceCrop *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMIFaceCrop *)self dataRepresentation];
  CGFloat v8 = (void *)[v6 initWithName:@"Data Representation" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  CGFloat v10 = [(HMIFaceCrop *)self dateCreated];
  CGFloat v11 = (void *)[v9 initWithName:@"Date Created" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMIFaceCrop *)self faceBoundingBox];
  id v13 = NSStringFromRect(v19);
  double v14 = (void *)[v12 initWithName:@"Face Bounding Box" value:v13];
  v17[3] = v14;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

+ (id)selectBestObservation:(id)a3 faceBoundingBoxFromPhotos:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    CGFloat v11 = 0;
    uint64_t v12 = *(void *)v29;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v15 unalignedBoundingBox];
        HMICGRectFlipCoordinateSpaceNormalized(v16, v17, v18, v19);
        HMICGRectIntersectionOverUnion(v20, v21, v22, v23, x, y, width, height);
        double v25 = v24;
        if (v13 < v24)
        {
          id v26 = v15;

          CGFloat v11 = v26;
          double v13 = v25;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    CGFloat v11 = 0;
  }

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
  if (v6)
  {
    v7 = [(HMIFaceCrop *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(HMIFaceCrop *)self dataRepresentation];
      uint64_t v10 = [v6 dataRepresentation];
      if ([v9 isEqualToData:v10])
      {
        CGFloat v11 = [(HMIFaceCrop *)self dateCreated];
        uint64_t v12 = [v6 dateCreated];
        if ([v11 isEqualToDate:v12])
        {
          [(HMIFaceCrop *)self faceBoundingBox];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          [v6 faceBoundingBox];
          v28.origin.double x = v21;
          v28.origin.double y = v22;
          v28.size.double width = v23;
          v28.size.double height = v24;
          v27.origin.double x = v14;
          v27.origin.double y = v16;
          v27.size.double width = v18;
          v27.size.double height = v20;
          BOOL v25 = CGRectEqualToRect(v27, v28);
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

- (unint64_t)hash
{
  v2 = [(HMIFaceCrop *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(HMIFaceCrop *)self UUID];
  [v7 encodeObject:v4 forKey:@"HMIFC.ck.u"];

  v5 = [(HMIFaceCrop *)self dataRepresentation];
  [v7 encodeObject:v5 forKey:@"HMIFC.ck.dr"];

  id v6 = [(HMIFaceCrop *)self dateCreated];
  [v7 encodeObject:v6 forKey:@"HMIFC.ck.dc"];

  [(HMIFaceCrop *)self faceBoundingBox];
  objc_msgSend(v7, "encodeRect:forKey:", @"HMIFC.ck.fbb");
}

- (HMIFaceCrop)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.ck.u"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.ck.dr"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFC.ck.dc"];
  uint64_t v8 = [v4 decodeRectForKey:@"HMIFC.ck.fbb"];
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    CGFloat v11 = (void *)MEMORY[0x22A641C70](v8);
    CGFloat v14 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = HMFGetLogIdentifier();
      int v17 = 138544130;
      CGFloat v18 = v13;
      __int16 v19 = 2112;
      CGFloat v20 = v5;
      __int16 v21 = 2112;
      CGFloat v22 = v6;
      __int16 v23 = 2112;
      CGFloat v24 = v7;
      _os_log_impl(&dword_225DC6000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ dataRepresentation: %@ dateCreated: %@", (uint8_t *)&v17, 0x2Au);
    }
    double v15 = 0;
  }
  else
  {
    CGFloat v14 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](self, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v5, v6, v7);
    double v15 = v14;
  }

  return v15;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)dataRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)dateCreated
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (CGRect)faceBoundingBox
{
  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end