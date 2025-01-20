@interface HMCameraAudioCodec
+ (BOOL)isValid:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMCameraAudioCodec)initWithAudioCodecType:(unint64_t)a3;
- (HMCameraAudioCodec)initWithCoder:(id)a3;
- (unint64_t)audioCodec;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMCameraAudioCodec

- (unint64_t)audioCodec
{
  return self->_audioCodec;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  unint64_t v5 = [(HMCameraAudioCodec *)self audioCodec];
  uint64_t v6 = [v4 audioCodec];

  return v5 == v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraAudioCodec audioCodec](self, "audioCodec"), @"a");
}

- (HMCameraAudioCodec)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMCameraAudioCodec;
  unint64_t v5 = [(HMCameraAudioCodec *)&v7 init];
  if (v5) {
    v5->_audioCodec = [v4 decodeIntegerForKey:@"a"];
  }

  return v5;
}

- (HMCameraAudioCodec)initWithAudioCodecType:(unint64_t)a3
{
  if (+[HMCameraAudioCodec isValid:](HMCameraAudioCodec, "isValid:"))
  {
    v8.receiver = self;
    v8.super_class = (Class)HMCameraAudioCodec;
    unint64_t v5 = [(HMCameraAudioCodec *)&v8 init];
    if (v5) {
      v5->_audioCodec = a3;
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
  return a3 - 1 < 2;
}

@end