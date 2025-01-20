@interface AVAudioUnitSplitter
- (AVAudioUnitSplitter)init;
- (AVAudioUnitSplitter)initWithAudioComponentDescription:(AudioComponentDescription *)a3;
@end

@implementation AVAudioUnitSplitter

- (AVAudioUnitSplitter)initWithAudioComponentDescription:(AudioComponentDescription *)a3
{
}

- (AVAudioUnitSplitter)init
{
  long long v3 = xmmword_19D8B1D80;
  int v4 = 0;
  return [(AVAudioUnitSplitter *)self initWithAudioComponentDescription:&v3];
}

@end