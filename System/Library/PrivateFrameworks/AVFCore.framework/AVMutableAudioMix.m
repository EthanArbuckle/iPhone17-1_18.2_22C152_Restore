@interface AVMutableAudioMix
+ (AVMutableAudioMix)audioMix;
- (NSArray)inputParameters;
- (void)setInputParameters:(NSArray *)inputParameters;
@end

@implementation AVMutableAudioMix

+ (AVMutableAudioMix)audioMix
{
  id v2 = objc_alloc_init((Class)a1);
  return (AVMutableAudioMix *)v2;
}

- (NSArray)inputParameters
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMix;
  return [(AVAudioMix *)&v3 inputParameters];
}

- (void)setInputParameters:(NSArray *)inputParameters
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMix;
  [(AVAudioMix *)&v3 setInputParameters:inputParameters];
}

@end