@interface HMCameraVideoResolution
+ (BOOL)isValid:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraVideoResolution)initWithCoder:(id)a3;
- (HMCameraVideoResolution)initWithVideoResolutionType:(unint64_t)a3;
- (unint64_t)videoResolution;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraVideoResolution

- (unint64_t)videoResolution
{
  return self->_videoResolution;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  unint64_t v5 = [(HMCameraVideoResolution *)self videoResolution];
  uint64_t v6 = [v4 videoResolution];

  return v5 == v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraVideoResolution videoResolution](self, "videoResolution"), @"a");
}

- (HMCameraVideoResolution)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMCameraVideoResolution;
  unint64_t v5 = [(HMCameraVideoResolution *)&v7 init];
  if (v5) {
    v5->_videoResolution = [v4 decodeIntegerForKey:@"a"];
  }

  return v5;
}

- (HMCameraVideoResolution)initWithVideoResolutionType:(unint64_t)a3
{
  if (+[HMCameraVideoResolution isValid:](HMCameraVideoResolution, "isValid:"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HMCameraVideoResolution;
    unint64_t v5 = [(HMCameraVideoResolution *)&v8 init];
    if (v5) {
      v5->_videoResolution = a3;
    }
    self = v5;
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isValid:(unint64_t)a3
{
  return a3 - 1 < 0x1D;
}

@end