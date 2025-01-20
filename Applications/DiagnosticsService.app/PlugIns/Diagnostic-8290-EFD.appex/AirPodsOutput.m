@interface AirPodsOutput
- (int64_t)audioTestType;
- (int64_t)numberOfChannels;
- (void)setAudioTestType:(int64_t)a3;
- (void)setNumberOfChannels:(int64_t)a3;
@end

@implementation AirPodsOutput

- (int64_t)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setNumberOfChannels:(int64_t)a3
{
  self->_numberOfChannels = a3;
}

- (int64_t)audioTestType
{
  return self->_audioTestType;
}

- (void)setAudioTestType:(int64_t)a3
{
  self->_audioTestType = a3;
}

@end