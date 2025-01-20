@interface AVCAudioPowerSpectrumBin
+ (BOOL)supportsSecureCoding;
- (AVCAudioPowerSpectrumBin)initWithCoder:(id)a3;
- (float)maxFrequency;
- (float)minFrequency;
- (float)powerLevel;
- (void)assign:(const _VCAudioPowerSpectrumEntry *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCAudioPowerSpectrumBin

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v3 = self->_minFrequency;
  [a3 encodeFloat:@"minFrequency" forKey:v3];
  *(float *)&double v6 = self->_maxFrequency;
  [a3 encodeFloat:@"maxFrequency" forKey:v6];
  *(float *)&double v7 = self->_powerLevel;

  [a3 encodeFloat:@"powerLevel" forKey:v7];
}

- (AVCAudioPowerSpectrumBin)initWithCoder:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)AVCAudioPowerSpectrumBin;
  v4 = [(AVCAudioPowerSpectrumBin *)&v9 init];
  if (v4)
  {
    [a3 decodeFloatForKey:@"minFrequency"];
    v4->_minFrequency = v5;
    [a3 decodeFloatForKey:@"maxFrequency"];
    v4->_maxFrequency = v6;
    [a3 decodeFloatForKey:@"powerLevel"];
    v4->_powerLevel = v7;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)minFrequency
{
  return self->_minFrequency;
}

- (float)maxFrequency
{
  return self->_maxFrequency;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)assign:(const _VCAudioPowerSpectrumEntry *)a3
{
  *(_VCAudioPowerSpectrumEntry *)&self->_minFrequency = *a3;
}

@end