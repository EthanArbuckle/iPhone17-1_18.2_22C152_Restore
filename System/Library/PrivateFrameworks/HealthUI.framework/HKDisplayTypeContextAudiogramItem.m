@interface HKDisplayTypeContextAudiogramItem
- (int64_t)ear;
- (void)setEar:(int64_t)a3;
@end

@implementation HKDisplayTypeContextAudiogramItem

- (int64_t)ear
{
  return self->_ear;
}

- (void)setEar:(int64_t)a3
{
  self->_ear = a3;
}

@end