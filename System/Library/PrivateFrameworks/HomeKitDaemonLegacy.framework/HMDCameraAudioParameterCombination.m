@interface HMDCameraAudioParameterCombination
- (BOOL)isEqual:(id)a3;
- (HMDAudioCodecGroup)codecGroupType;
- (HMDAudioSampleRate)sampleRate;
- (HMDBitRateSetting)bitrateSetting;
- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5;
- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5 maximumBitrate:(id)a6 minimumBitrate:(id)a7 rtcpInterval:(id)a8 rtpPtime:(id)a9;
- (NSNumber)maximumBitrate;
- (NSNumber)minimumBitrate;
- (NSNumber)rtcpInterval;
- (NSNumber)rtpPTime;
- (id)description;
@end

@implementation HMDCameraAudioParameterCombination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtpPTime, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_bitrateSetting, 0);
  objc_storeStrong((id *)&self->_codecGroupType, 0);
}

- (NSNumber)rtpPTime
{
  return self->_rtpPTime;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (HMDAudioSampleRate)sampleRate
{
  return self->_sampleRate;
}

- (HMDBitRateSetting)bitrateSetting
{
  return self->_bitrateSetting;
}

- (HMDAudioCodecGroup)codecGroupType
{
  return self->_codecGroupType;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDCameraAudioParameterCombination *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMDCameraAudioParameterCombination *)self codecGroupType];
      v7 = [(HMDCameraAudioParameterCombination *)v5 codecGroupType];
      if ([v6 isEqual:v7])
      {
        v8 = [(HMDCameraAudioParameterCombination *)self bitrateSetting];
        v9 = [(HMDCameraAudioParameterCombination *)v5 bitrateSetting];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDCameraAudioParameterCombination *)self codecGroupType];
  v5 = [(HMDCameraAudioParameterCombination *)self bitrateSetting];
  v6 = [(HMDCameraAudioParameterCombination *)self sampleRate];
  v7 = [(HMDCameraAudioParameterCombination *)self maximumBitrate];
  v8 = [(HMDCameraAudioParameterCombination *)self minimumBitrate];
  v9 = [(HMDCameraAudioParameterCombination *)self rtcpInterval];
  char v10 = [(HMDCameraAudioParameterCombination *)self rtpPTime];
  v11 = [v3 stringWithFormat:@"<codecType = %@, bitrateSetting = %@, sampleAudioRate = %@, maxBitrate = %@, minBitrate = %@, rtcpInterval = %@, rtpPtime = %@>", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5 maximumBitrate:(id)a6 minimumBitrate:(id)a7 rtcpInterval:(id)a8 rtpPtime:(id)a9
{
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v18 = [(HMDCameraAudioParameterCombination *)self initWithCodecGroup:a3 bitrateSetting:a4 sampleRate:a5];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_maximumBitrate, a6);
    objc_storeStrong((id *)&v19->_minimumBitrate, a7);
    objc_storeStrong((id *)&v19->_rtcpInterval, a8);
    objc_storeStrong((id *)&v19->_rtpPTime, a9);
  }

  return v19;
}

- (HMDCameraAudioParameterCombination)initWithCodecGroup:(id)a3 bitrateSetting:(id)a4 sampleRate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraAudioParameterCombination;
  v12 = [(HMDCameraAudioParameterCombination *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_codecGroupType, a3);
    objc_storeStrong((id *)&v13->_bitrateSetting, a4);
    objc_storeStrong((id *)&v13->_sampleRate, a5);
  }

  return v13;
}

@end