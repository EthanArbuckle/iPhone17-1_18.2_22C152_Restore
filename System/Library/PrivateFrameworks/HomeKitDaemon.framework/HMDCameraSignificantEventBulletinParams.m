@interface HMDCameraSignificantEventBulletinParams
- (HMDCameraSignificantEventBulletinParams)init;
- (HMDCameraSignificantEventBulletinParams)initWithSignificantEvent:(id)a3 cameraProfileUUID:(id)a4;
- (HMDCameraSignificantEventBulletinParams)initWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfileUUID:(id)a8;
- (NSDate)dateOfOccurrence;
- (NSSet)faceClassifications;
- (NSUUID)UUID;
- (NSUUID)cameraProfileUUID;
- (unint64_t)confidenceLevel;
- (unint64_t)reason;
@end

@implementation HMDCameraSignificantEventBulletinParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
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

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraSignificantEventBulletinParams)initWithSignificantEvent:(id)a3 cameraProfileUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 UUID];
  uint64_t v9 = [v7 reason];
  v10 = [v7 dateOfOccurrence];
  uint64_t v11 = [v7 confidenceLevel];
  v12 = [v7 faceClassifications];

  v13 = [(HMDCameraSignificantEventBulletinParams *)self initWithUUID:v8 reason:v9 dateOfOccurrence:v10 confidenceLevel:v11 faceClassifications:v12 cameraProfileUUID:v6];
  return v13;
}

- (HMDCameraSignificantEventBulletinParams)initWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfileUUID:(id)a8
{
  id v21 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraSignificantEventBulletinParams;
  v18 = [(HMDCameraSignificantEventBulletinParams *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_UUID, a3);
    v19->_reason = a4;
    objc_storeStrong((id *)&v19->_dateOfOccurrence, a5);
    v19->_confidenceLevel = a6;
    objc_storeStrong((id *)&v19->_faceClassifications, a7);
    objc_storeStrong((id *)&v19->_cameraProfileUUID, a8);
  }

  return v19;
}

- (HMDCameraSignificantEventBulletinParams)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end