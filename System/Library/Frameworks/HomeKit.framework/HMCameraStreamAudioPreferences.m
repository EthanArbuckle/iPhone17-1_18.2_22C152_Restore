@interface HMCameraStreamAudioPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraStreamAudioPreferences)initWithCoder:(id)a3;
- (NSSet)codecs;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCodecs:(id)a3;
@end

@implementation HMCameraStreamAudioPreferences

- (void).cxx_destruct
{
}

- (void)setCodecs:(id)a3
{
}

- (NSSet)codecs
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMCameraStreamAudioPreferences *)self codecs];
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
    v7 = [(HMCameraStreamAudioPreferences *)self codecs];
    v8 = [v6 codecs];
    char v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMCameraStreamAudioPreferences *)self codecs];
  [v4 encodeObject:v5 forKey:@"HM.CameraStreamAudioCodecs"];
}

- (HMCameraStreamAudioPreferences)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMCameraStreamAudioPreferences *)self init];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8 = [v6 setWithArray:v7];
  char v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.CameraStreamAudioCodecs"];

  [(HMCameraStreamAudioPreferences *)v5 setCodecs:v9];
  return v5;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(HMCameraStreamAudioPreferences *)self codecs];
  id v4 = [v2 stringWithFormat:@"<HMCameraStreamAudioPreferences codecs: %@>", v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end