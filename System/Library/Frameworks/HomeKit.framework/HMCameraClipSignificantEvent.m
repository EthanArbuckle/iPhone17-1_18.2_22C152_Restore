@interface HMCameraClipSignificantEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraClipSignificantEvent)initWithCoder:(id)a3;
- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8 timeOffsetWithinClip:(double)a9 clipUUID:(id)a10;
- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7 timeOffsetWithinClip:(double)a8 clipUUID:(id)a9;
- (NSUUID)clipUUID;
- (double)timeOffsetWithinClip;
- (id)attributeDescriptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraClipSignificantEvent

- (void).cxx_destruct
{
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (double)timeOffsetWithinClip
{
  return self->_timeOffsetWithinClip;
}

- (HMCameraClipSignificantEvent)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMCameraSignificantEvent alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cu"];
    if (v6)
    {
      [v4 decodeDoubleForKey:@"to"];
      double v8 = v7;
      v9 = [(HMCameraSignificantEvent *)v5 uniqueIdentifier];
      uint64_t v10 = [(HMCameraSignificantEvent *)v5 reason];
      v11 = [(HMCameraSignificantEvent *)v5 dateOfOccurrence];
      uint64_t v12 = [(HMCameraSignificantEvent *)v5 confidenceLevel];
      v13 = [(HMCameraSignificantEvent *)v5 cameraProfileUUID];
      v14 = [(HMCameraSignificantEvent *)v5 faceClassification];
      self = [(HMCameraClipSignificantEvent *)self initWithUniqueIdentifier:v9 reason:v10 dateOfOccurrence:v11 confidenceLevel:v12 cameraProfileUUID:v13 faceClassification:v14 timeOffsetWithinClip:v8 clipUUID:v6];

      v15 = self;
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A64A0]();
      self = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = 0;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded clipUUID: %@", buf, 0x16u);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMCameraClipSignificantEvent;
  id v4 = a3;
  [(HMCameraSignificantEvent *)&v6 encodeWithCoder:v4];
  [(HMCameraClipSignificantEvent *)self timeOffsetWithinClip];
  objc_msgSend(v4, "encodeDouble:forKey:", @"to");
  v5 = [(HMCameraClipSignificantEvent *)self clipUUID];
  [v4 encodeObject:v5 forKey:@"cu"];
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
    && (v14.receiver = self,
        v14.super_class = (Class)HMCameraClipSignificantEvent,
        [(HMCameraSignificantEvent *)&v14 isEqual:v6])
    && ([(HMCameraClipSignificantEvent *)self timeOffsetWithinClip],
        double v8 = v7,
        [v6 timeOffsetWithinClip],
        v8 == v9))
  {
    uint64_t v10 = [(HMCameraClipSignificantEvent *)self clipUUID];
    v11 = [v6 clipUUID];
    char v12 = [v10 isEqual:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)attributeDescriptions
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = NSNumber;
  [(HMCameraClipSignificantEvent *)self timeOffsetWithinClip];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = (void *)[v3 initWithName:@"Time offset within clip" value:v5];
  v15[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  double v8 = [(HMCameraClipSignificantEvent *)self clipUUID];
  double v9 = (void *)[v7 initWithName:@"Clip UUID" value:v8];
  v15[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  v14.receiver = self;
  v14.super_class = (Class)HMCameraClipSignificantEvent;
  v11 = [(HMCameraSignificantEvent *)&v14 attributeDescriptions];
  char v12 = [v11 arrayByAddingObjectsFromArray:v10];

  return v12;
}

- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7 timeOffsetWithinClip:(double)a8 clipUUID:(id)a9
{
  v16 = (void *)MEMORY[0x1E4F29128];
  id v17 = a9;
  id v18 = a7;
  id v19 = a5;
  id v20 = a3;
  v21 = [v16 UUID];
  __int16 v22 = [(HMCameraClipSignificantEvent *)self initWithUniqueIdentifier:v20 reason:a4 dateOfOccurrence:v19 confidenceLevel:a6 cameraProfileUUID:v21 faceClassification:v18 timeOffsetWithinClip:a8 clipUUID:v17];

  return v22;
}

- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8 timeOffsetWithinClip:(double)a9 clipUUID:(id)a10
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if (v21)
  {
    __int16 v22 = v21;
    v28.receiver = self;
    v28.super_class = (Class)HMCameraClipSignificantEvent;
    uint64_t v23 = [(HMCameraSignificantEvent *)&v28 initWithUniqueIdentifier:v17 reason:a4 dateOfOccurrence:v18 confidenceLevel:a6 cameraProfileUUID:v19 faceClassification:v20];
    uint64_t v24 = v23;
    if (v23)
    {
      v23->_timeOffsetWithinClip = a9;
      objc_storeStrong((id *)&v23->_clipUUID, a10);
    }

    return v24;
  }
  else
  {
    v26 = (void *)_HMFPreconditionFailure();
    return (HMCameraClipSignificantEvent *)+[HMCameraClipSignificantEvent supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end