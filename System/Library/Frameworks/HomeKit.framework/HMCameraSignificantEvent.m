@interface HMCameraSignificantEvent
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)canAskForUserFeedback;
- (BOOL)isEqual:(id)a3;
- (HMCameraSignificantEvent)initWithCoder:(id)a3;
- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8;
- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7;
- (HMFaceClassification)faceClassification;
- (NSArray)attributeDescriptions;
- (NSDate)dateOfOccurrence;
- (NSString)description;
- (NSString)privateDescription;
- (NSString)shortDescription;
- (NSUUID)cameraProfileUUID;
- (NSUUID)uniqueIdentifier;
- (unint64_t)confidenceLevel;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraSignificantEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceClassification, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMFaceClassification)faceClassification
{
  return (HMFaceClassification *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMCameraSignificantEvent)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ui"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"r"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doc"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"cl"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpu"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fc"];
  if (v5 && v7 && v8)
  {
    v11 = [(HMCameraSignificantEvent *)self initWithUniqueIdentifier:v5 reason:v6 dateOfOccurrence:v7 confidenceLevel:v8 cameraProfileUUID:v9 faceClassification:v10];
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      v16 = HMStringFromCameraSignificantEventConfidenceLevel(v8);
      int v18 = 138544130;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v5;
      __int16 v22 = 2112;
      v23 = v7;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uniqueIdentifier: %@ dateOfOccurrence: %@ confidence level: %@", (uint8_t *)&v18, 0x2Au);
    }
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMCameraSignificantEvent *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"ui"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraSignificantEvent reason](self, "reason"), @"r");
  uint64_t v6 = [(HMCameraSignificantEvent *)self dateOfOccurrence];
  [v4 encodeObject:v6 forKey:@"doc"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraSignificantEvent confidenceLevel](self, "confidenceLevel"), @"cl");
  v7 = [(HMCameraSignificantEvent *)self cameraProfileUUID];
  [v4 encodeObject:v7 forKey:@"cpu"];

  id v8 = [(HMCameraSignificantEvent *)self faceClassification];
  [v4 encodeObject:v8 forKey:@"fc"];
}

- (unint64_t)hash
{
  v2 = [(HMCameraSignificantEvent *)self uniqueIdentifier];
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
    v7 = [(HMCameraSignificantEvent *)self uniqueIdentifier];
    id v8 = [v6 uniqueIdentifier];
    if ([v7 isEqual:v8]
      && (unint64_t v9 = -[HMCameraSignificantEvent reason](self, "reason"), v9 == [v6 reason]))
    {
      v10 = [(HMCameraSignificantEvent *)self dateOfOccurrence];
      v11 = [v6 dateOfOccurrence];
      if ([v10 isEqualToDate:v11]
        && (unint64_t v12 = [(HMCameraSignificantEvent *)self confidenceLevel],
            v12 == [v6 confidenceLevel]))
      {
        v13 = [(HMCameraSignificantEvent *)self cameraProfileUUID];
        v14 = [v6 cameraProfileUUID];
        if ([v13 isEqual:v14])
        {
          int v18 = [(HMCameraSignificantEvent *)self faceClassification];
          v15 = [v6 faceClassification];
          char v16 = HMFEqualObjects();
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (NSArray)attributeDescriptions
{
  v23[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v22 = [(HMCameraSignificantEvent *)self uniqueIdentifier];
  v21 = (void *)[v3 initWithName:@"ID" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  __int16 v20 = HMStringFromCameraSignificantEventReason([(HMCameraSignificantEvent *)self reason]);
  v5 = (void *)[v4 initWithName:@"Reason" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMCameraSignificantEvent *)self dateOfOccurrence];
  id v8 = (void *)[v6 initWithName:@"Date" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = HMStringFromCameraSignificantEventConfidenceLevel([(HMCameraSignificantEvent *)self confidenceLevel]);
  v11 = (void *)[v9 initWithName:@"Confidence level" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMCameraSignificantEvent *)self cameraProfileUUID];
  v14 = (void *)[v12 initWithName:@"Camera Profile UUID" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  char v16 = [(HMCameraSignificantEvent *)self faceClassification];
  v17 = (void *)[v15 initWithName:@"Face Classification" value:v16];
  v23[5] = v17;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];

  return (NSArray *)v18;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)privateDescription
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (BOOL)canAskForUserFeedback
{
  return [(HMCameraSignificantEvent *)self reason] - 3 < 3;
}

- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  char v16 = [v12 UUID];
  v17 = [(HMCameraSignificantEvent *)self initWithUniqueIdentifier:v15 reason:a4 dateOfOccurrence:v14 confidenceLevel:a6 cameraProfileUUID:v16 faceClassification:v13];

  return v17;
}

- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    __int16 v22 = (void *)_HMFPreconditionFailure();
    return (HMCameraSignificantEvent *)+[HMCameraSignificantEvent supportsSecureCoding];
  }
  int v18 = v17;
  v25.receiver = self;
  v25.super_class = (Class)HMCameraSignificantEvent;
  v19 = [(HMCameraSignificantEvent *)&v25 init];
  __int16 v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a3);
    v20->_reason = a4;
    objc_storeStrong((id *)&v20->_dateOfOccurrence, a5);
    v20->_confidenceLevel = a6;
    objc_storeStrong((id *)&v20->_cameraProfileUUID, a7);
    objc_storeStrong((id *)&v20->_faceClassification, a8);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end