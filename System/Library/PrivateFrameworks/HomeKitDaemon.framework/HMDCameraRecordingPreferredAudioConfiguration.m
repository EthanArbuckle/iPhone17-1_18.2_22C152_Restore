@interface HMDCameraRecordingPreferredAudioConfiguration
- (HMDCameraRecordingPreferredAudioConfiguration)initWithSampleRate:(int64_t)a3 bitRate:(id)a4;
- (NSNumber)bitRate;
- (id)description;
- (int64_t)sampleRate;
@end

@implementation HMDCameraRecordingPreferredAudioConfiguration

- (void).cxx_destruct
{
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (NSNumber)bitRate
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = HMDCameraRecordingAudioSampleRateTypeAsString([(HMDCameraRecordingPreferredAudioConfiguration *)self sampleRate]);
  v5 = [(HMDCameraRecordingPreferredAudioConfiguration *)self bitRate];
  v6 = [v3 stringWithFormat:@"sample rate: %@kHz bit rate: %@kbps", v4, v5];

  return v6;
}

- (HMDCameraRecordingPreferredAudioConfiguration)initWithSampleRate:(int64_t)a3 bitRate:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCameraRecordingPreferredAudioConfiguration;
  v8 = [(HMDCameraRecordingPreferredAudioConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_sampleRate = a3;
    objc_storeStrong((id *)&v8->_bitRate, a4);
  }

  return v9;
}

@end