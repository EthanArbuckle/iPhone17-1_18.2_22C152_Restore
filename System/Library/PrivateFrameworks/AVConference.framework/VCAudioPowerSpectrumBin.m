@interface VCAudioPowerSpectrumBin
- (VCAudioPowerSpectrumBin)initWithFrequencyRange:(_VCRange)a3;
- (_VCRange)frequencyRange;
- (float)powerLevel;
- (id)description;
- (void)setFrequencyRange:(_VCRange)a3;
- (void)setPowerLevel:(float)a3;
@end

@implementation VCAudioPowerSpectrumBin

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"[%f;%f;%f]",
               self->_powerLevel,
               self->_frequencyRange.min,
               self->_frequencyRange.max);
}

- (VCAudioPowerSpectrumBin)initWithFrequencyRange:(_VCRange)a3
{
  float max = a3.max;
  float min = a3.min;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioPowerSpectrumBin;
  result = [(VCAudioPowerSpectrumBin *)&v6 init];
  if (result)
  {
    result->_powerLevel = -120.0;
    result->_frequencyRange.float min = min;
    result->_frequencyRange.float max = max;
  }
  return result;
}

- (_VCRange)frequencyRange
{
  float min = self->_frequencyRange.min;
  float max = self->_frequencyRange.max;
  result.float max = max;
  result.float min = min;
  return result;
}

- (void)setFrequencyRange:(_VCRange)a3
{
  self->_frequencyRange = a3;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)setPowerLevel:(float)a3
{
  self->_powerLevel = a3;
}

@end