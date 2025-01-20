@interface HMDCameraRecordingSessionSignificantEvent
- (BOOL)isEqual:(id)a3;
- (HMDCameraRecordingSessionSignificantEvent)initWithUUID:(id)a3;
- (NSData)faceCropData;
- (NSData)heroFrameData;
- (NSDate)dateOfOccurrence;
- (NSSet)faceClassifications;
- (NSUUID)UUID;
- (NSUUID)sessionEntityUUID;
- (double)timeOffsetWithinClip;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)confidenceLevel;
- (unint64_t)hash;
- (unint64_t)reason;
- (void)setConfidenceLevel:(unint64_t)a3;
- (void)setDateOfOccurrence:(id)a3;
- (void)setFaceClassifications:(id)a3;
- (void)setFaceCropData:(id)a3;
- (void)setHeroFrameData:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSessionEntityUUID:(id)a3;
- (void)setTimeOffsetWithinClip:(double)a3;
@end

@implementation HMDCameraRecordingSessionSignificantEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropData, 0);
  objc_storeStrong((id *)&self->_heroFrameData, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setTimeOffsetWithinClip:(double)a3
{
  self->_timeOffsetWithinClip = a3;
}

- (double)timeOffsetWithinClip
{
  return self->_timeOffsetWithinClip;
}

- (void)setFaceCropData:(id)a3
{
}

- (NSData)faceCropData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeroFrameData:(id)a3
{
}

- (NSData)heroFrameData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFaceClassifications:(id)a3
{
}

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSessionEntityUUID:(id)a3
{
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfidenceLevel:(unint64_t)a3
{
  self->_confidenceLevel = a3;
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setDateOfOccurrence:(id)a3
{
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCameraRecordingSessionSignificantEvent *)self UUID];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCameraRecordingSessionSignificantEvent *)self reason];
  v8 = HMStringFromCameraSignificantEventReason();
  v9 = (void *)[v7 initWithName:@"Reason" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDCameraRecordingSessionSignificantEvent *)self dateOfOccurrence];
  v12 = (void *)[v10 initWithName:@"Date" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = NSNumber;
  [(HMDCameraRecordingSessionSignificantEvent *)self timeOffsetWithinClip];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)[v13 initWithName:@"Time Offset Within Clip" value:v15];
  [v3 addObject:v16];

  if ([(HMDCameraRecordingSessionSignificantEvent *)self confidenceLevel] != 100)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMDCameraRecordingSessionSignificantEvent *)self confidenceLevel];
    v18 = HMStringFromCameraSignificantEventConfidenceLevel();
    v19 = (void *)[v17 initWithName:@"Confidence Level" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMDCameraRecordingSessionSignificantEvent *)self sessionEntityUUID];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
    v22 = [(HMDCameraRecordingSessionSignificantEvent *)self sessionEntityUUID];
    v23 = (void *)[v21 initWithName:@"Session Entity UUID" value:v22];
    [v3 addObject:v23];
  }
  v24 = [(HMDCameraRecordingSessionSignificantEvent *)self faceClassifications];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F653F8]);
    v27 = [(HMDCameraRecordingSessionSignificantEvent *)self faceClassifications];
    v28 = (void *)[v26 initWithName:@"Face Classifications" value:v27];
    [v3 addObject:v28];
  }
  v29 = [(HMDCameraRecordingSessionSignificantEvent *)self heroFrameData];

  if (v29)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F653F8]);
    v31 = [(HMDCameraRecordingSessionSignificantEvent *)self heroFrameData];
    v32 = [v31 shortDescription];
    v33 = (void *)[v30 initWithName:@"Hero Frame Data" value:v32];
    [v3 addObject:v33];
  }
  v34 = [(HMDCameraRecordingSessionSignificantEvent *)self faceCropData];

  if (v34)
  {
    id v35 = objc_alloc(MEMORY[0x1E4F653F8]);
    v36 = [(HMDCameraRecordingSessionSignificantEvent *)self faceCropData];
    v37 = [v36 shortDescription];
    v38 = (void *)[v35 initWithName:@"Face Crop Data" value:v37];
    [v3 addObject:v38];
  }
  v39 = (void *)[v3 copy];

  return v39;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMDMutableCameraRecordingSessionSignificantEvent allocWithZone:a3];
  v5 = [(HMDCameraRecordingSessionSignificantEvent *)self UUID];
  v6 = [(HMDCameraRecordingSessionSignificantEvent *)v4 initWithUUID:v5];

  [(HMDCameraRecordingSessionSignificantEvent *)v6 setReason:[(HMDCameraRecordingSessionSignificantEvent *)self reason]];
  id v7 = [(HMDCameraRecordingSessionSignificantEvent *)self dateOfOccurrence];
  [(HMDCameraRecordingSessionSignificantEvent *)v6 setDateOfOccurrence:v7];

  [(HMDCameraRecordingSessionSignificantEvent *)v6 setConfidenceLevel:[(HMDCameraRecordingSessionSignificantEvent *)self confidenceLevel]];
  v8 = [(HMDCameraRecordingSessionSignificantEvent *)self sessionEntityUUID];
  [(HMDCameraRecordingSessionSignificantEvent *)v6 setSessionEntityUUID:v8];

  v9 = [(HMDCameraRecordingSessionSignificantEvent *)self faceClassifications];
  [(HMDCameraRecordingSessionSignificantEvent *)v6 setFaceClassifications:v9];

  id v10 = [(HMDCameraRecordingSessionSignificantEvent *)self heroFrameData];
  [(HMDCameraRecordingSessionSignificantEvent *)v6 setHeroFrameData:v10];

  v11 = [(HMDCameraRecordingSessionSignificantEvent *)self faceCropData];
  [(HMDCameraRecordingSessionSignificantEvent *)v6 setFaceCropData:v11];

  [(HMDCameraRecordingSessionSignificantEvent *)self timeOffsetWithinClip];
  -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v6, "setTimeOffsetWithinClip:");
  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMDCameraRecordingSessionSignificantEvent *)self UUID];
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
    id v7 = [(HMDCameraRecordingSessionSignificantEvent *)self UUID];
    v8 = [v6 UUID];
    if (![v7 isEqual:v8]
      || (unint64_t v9 = -[HMDCameraRecordingSessionSignificantEvent reason](self, "reason"), v9 != [v6 reason]))
    {
      BOOL v27 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v10 = [(HMDCameraRecordingSessionSignificantEvent *)self dateOfOccurrence];
    v11 = [v6 dateOfOccurrence];
    if (![v10 isEqualToDate:v11]) {
      goto LABEL_16;
    }
    unint64_t v12 = [(HMDCameraRecordingSessionSignificantEvent *)self confidenceLevel];
    if (v12 != [v6 confidenceLevel]
      || ([(HMDCameraRecordingSessionSignificantEvent *)self sessionEntityUUID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v6 sessionEntityUUID],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = HMFEqualObjects(),
          v14,
          v13,
          !v15))
    {
LABEL_16:
      BOOL v27 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v16 = [(HMDCameraRecordingSessionSignificantEvent *)self faceClassifications];
    id v17 = [v6 faceClassifications];
    if (![v16 isEqualToSet:v17]) {
      goto LABEL_20;
    }
    v29 = v17;
    id v30 = v16;
    v18 = [(HMDCameraRecordingSessionSignificantEvent *)self heroFrameData];
    v19 = [v6 heroFrameData];
    int v20 = HMFEqualObjects();

    if (!v20)
    {
      BOOL v27 = 0;
      id v17 = v29;
      v16 = v30;
      goto LABEL_22;
    }
    id v21 = [(HMDCameraRecordingSessionSignificantEvent *)self faceCropData];
    v22 = [v6 faceCropData];
    int v23 = HMFEqualObjects();

    id v17 = v29;
    v16 = v30;
    if (v23)
    {
      [(HMDCameraRecordingSessionSignificantEvent *)self timeOffsetWithinClip];
      double v25 = v24;
      [v6 timeOffsetWithinClip];
      BOOL v27 = v25 == v26;
    }
    else
    {
LABEL_20:
      BOOL v27 = 0;
    }
LABEL_22:

    goto LABEL_17;
  }
  BOOL v27 = 0;
LABEL_19:

  return v27;
}

- (HMDCameraRecordingSessionSignificantEvent)initWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v16.receiver = self;
    v16.super_class = (Class)HMDCameraRecordingSessionSignificantEvent;
    id v6 = [(HMDCameraRecordingSessionSignificantEvent *)&v16 init];
    if (v6)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v5);
      UUID = v6->_UUID;
      v6->_UUID = (NSUUID *)v7;

      v6->_reason = 1;
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      dateOfOccurrence = v6->_dateOfOccurrence;
      v6->_dateOfOccurrence = (NSDate *)v9;

      v6->_confidenceLevel = 100;
      uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
      faceClassifications = v6->_faceClassifications;
      v6->_faceClassifications = (NSSet *)v11;
    }
    return v6;
  }
  else
  {
    v14 = (HMDHomeObjectChangeHandler *)_HMFPreconditionFailure();
    [(HMDHomeObjectChangeHandler *)v14 .cxx_destruct];
  }
  return result;
}

@end