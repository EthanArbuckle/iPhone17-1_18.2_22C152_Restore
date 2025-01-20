@interface HMDCameraRecordingPreferredVideoConfiguration
- (HMDCameraRecordingPreferredVideoConfiguration)initWithResolution:(int64_t)a3 bitRateByFrameRate:(id)a4 keyFrameInterval:(id)a5 h264Level:(int64_t)a6;
- (NSDictionary)bitRateByFrameRate;
- (NSNumber)keyFrameInterval;
- (id)description;
- (int64_t)h264Level;
- (int64_t)resolution;
@end

@implementation HMDCameraRecordingPreferredVideoConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFrameInterval, 0);
  objc_storeStrong((id *)&self->_bitRateByFrameRate, 0);
}

- (int64_t)h264Level
{
  return self->_h264Level;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (NSNumber)keyFrameInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)bitRateByFrameRate
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMDCameraRecordingPreferredVideoConfiguration *)self resolution];
  if (v4 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingVideoResolutionType %ld", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E6A11BB8[v4];
  }
  v6 = [(HMDCameraRecordingPreferredVideoConfiguration *)self bitRateByFrameRate];
  v7 = [(HMDCameraRecordingPreferredVideoConfiguration *)self keyFrameInterval];
  v8 = HMDCameraRecordingH264LevelTypeAsString([(HMDCameraRecordingPreferredVideoConfiguration *)self h264Level]);
  v9 = [v3 stringWithFormat:@"resolution: %@px, bitRateByFrameRate: %@ key frame interval: %@ms h264 level: %@", v5, v6, v7, v8];

  return v9;
}

- (HMDCameraRecordingPreferredVideoConfiguration)initWithResolution:(int64_t)a3 bitRateByFrameRate:(id)a4 keyFrameInterval:(id)a5 h264Level:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraRecordingPreferredVideoConfiguration;
  v13 = [(HMDCameraRecordingPreferredVideoConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_resolution = a3;
    objc_storeStrong((id *)&v13->_bitRateByFrameRate, a4);
    objc_storeStrong((id *)&v14->_keyFrameInterval, a5);
    v14->_h264Level = a6;
  }

  return v14;
}

@end