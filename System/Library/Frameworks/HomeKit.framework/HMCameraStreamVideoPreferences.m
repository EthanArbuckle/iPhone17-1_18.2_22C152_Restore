@interface HMCameraStreamVideoPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraStreamVideoPreferences)init;
- (HMCameraStreamVideoPreferences)initWithCoder:(id)a3;
- (NSSet)resolutions;
- (id)description;
- (int64_t)maximumQuality;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumQuality:(int64_t)a3;
- (void)setResolutions:(id)a3;
@end

@implementation HMCameraStreamVideoPreferences

- (void).cxx_destruct
{
}

- (void)setMaximumQuality:(int64_t)a3
{
  self->_maximumQuality = a3;
}

- (int64_t)maximumQuality
{
  return self->_maximumQuality;
}

- (void)setResolutions:(id)a3
{
}

- (NSSet)resolutions
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(HMCameraStreamVideoPreferences *)self resolutions];
  uint64_t v4 = [v3 hash];

  return [(HMCameraStreamVideoPreferences *)self maximumQuality] ^ v4;
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
    v7 = [(HMCameraStreamVideoPreferences *)self resolutions];
    v8 = [v6 resolutions];
    if ([v7 isEqualToSet:v8])
    {
      int64_t v9 = [(HMCameraStreamVideoPreferences *)self maximumQuality];
      BOOL v10 = v9 == [v6 maximumQuality];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(HMCameraStreamVideoPreferences *)self resolutions];
  [v5 encodeObject:v4 forKey:@"HM.CameraStreamVideoResolutions"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[HMCameraStreamVideoPreferences maximumQuality](self, "maximumQuality"), @"HM.CameraStreamVideoResolutionQuality");
}

- (HMCameraStreamVideoPreferences)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMCameraStreamVideoPreferences *)self init];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  int64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.CameraStreamVideoResolutions"];
  [(HMCameraStreamVideoPreferences *)v5 setResolutions:v9];

  uint64_t v10 = [v4 decodeIntegerForKey:@"HM.CameraStreamVideoResolutionQuality"];
  [(HMCameraStreamVideoPreferences *)v5 setMaximumQuality:v10];
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(HMCameraStreamVideoPreferences *)self resolutions];
  id v5 = [v3 stringWithFormat:@"<HMCameraStreamVideoPreferences resolutions: %@, maximum quality: %lu>", v4, -[HMCameraStreamVideoPreferences maximumQuality](self, "maximumQuality")];

  return v5;
}

- (HMCameraStreamVideoPreferences)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMCameraStreamVideoPreferences;
  result = [(HMCameraStreamVideoPreferences *)&v3 init];
  if (result) {
    result->_maximumQuality = 5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end