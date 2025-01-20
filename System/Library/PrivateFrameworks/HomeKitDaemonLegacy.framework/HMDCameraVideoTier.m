@interface HMDCameraVideoTier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMDCameraVideoTier)initWithCoder:(id)a3;
- (HMDCameraVideoTier)initWithVideoResolution:(id)a3 framerate:(id)a4 minBitRate:(id)a5 maxBitRate:(id)a6 rtcpInterval:(id)a7;
- (HMDVideoResolution)videoResolution;
- (NSNumber)framerate;
- (NSNumber)maxBitRate;
- (NSNumber)minBitRate;
- (NSNumber)rtcpInterval;
- (id)description;
- (int64_t)quality;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFramerate:(id)a3;
@end

@implementation HMDCameraVideoTier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minBitRate, 0);
  objc_storeStrong((id *)&self->_maxBitRate, 0);
  objc_storeStrong((id *)&self->_videoResolution, 0);
}

- (void)setFramerate:(id)a3
{
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)minBitRate
{
  return self->_minBitRate;
}

- (NSNumber)maxBitRate
{
  return self->_maxBitRate;
}

- (HMDVideoResolution)videoResolution
{
  return self->_videoResolution;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraVideoTier *)self videoResolution];
  [v4 encodeObject:v5 forKey:@"kVideoTierResolution"];

  v6 = [(HMDCameraVideoTier *)self maxBitRate];
  [v4 encodeObject:v6 forKey:@"kVideoTierMaxBitRate"];

  v7 = [(HMDCameraVideoTier *)self minBitRate];
  [v4 encodeObject:v7 forKey:@"kVideoTierMinBitRate"];

  v8 = [(HMDCameraVideoTier *)self rtcpInterval];
  [v4 encodeObject:v8 forKey:@"kVideoTierRTCPInterval"];

  id v9 = [(HMDCameraVideoTier *)self framerate];
  [v4 encodeObject:v9 forKey:@"kVideoTierFramerate"];
}

- (HMDCameraVideoTier)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraVideoTier;
  v5 = [(HMDCameraVideoTier *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoTierResolution"];
    videoResolution = v5->_videoResolution;
    v5->_videoResolution = (HMDVideoResolution *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoTierMaxBitRate"];
    maxBitRate = v5->_maxBitRate;
    v5->_maxBitRate = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoTierMinBitRate"];
    minBitRate = v5->_minBitRate;
    v5->_minBitRate = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoTierRTCPInterval"];
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVideoTierFramerate"];
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v14;
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(HMDCameraVideoTier *)self videoResolution];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDCameraVideoTier *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(HMDCameraVideoTier *)self videoResolution];
      v7 = [(HMDCameraVideoTier *)v5 videoResolution];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (int64_t)quality
{
  v2 = [(HMDCameraVideoTier *)self videoResolution];
  uint64_t v3 = [v2 resolutionType];

  if ((unint64_t)(v3 - 3) > 0x1A) {
    return 1;
  }
  else {
    return qword_1D54D4178[v3 - 3];
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(HMDCameraVideoTier *)self videoResolution];
  v5 = [(HMDCameraVideoTier *)self maxBitRate];
  uint64_t v6 = [(HMDCameraVideoTier *)self minBitRate];
  v7 = [(HMDCameraVideoTier *)self rtcpInterval];
  char v8 = [(HMDCameraVideoTier *)self framerate];
  id v9 = [v3 stringWithFormat:@"Resolution %@, Max bitrate %@, Min bitrate %@, RTCP interval %@, Framerate %@, Quality %d", v4, v5, v6, v7, v8, -[HMDCameraVideoTier quality](self, "quality")];

  return v9;
}

- (HMDCameraVideoTier)initWithVideoResolution:(id)a3 framerate:(id)a4 minBitRate:(id)a5 maxBitRate:(id)a6 rtcpInterval:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraVideoTier;
  objc_super v17 = [(HMDCameraVideoTier *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_videoResolution, a3);
    objc_storeStrong((id *)&v18->_maxBitRate, a6);
    objc_storeStrong((id *)&v18->_minBitRate, a5);
    objc_storeStrong((id *)&v18->_rtcpInterval, a7);
    objc_storeStrong((id *)&v18->_framerate, a4);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end