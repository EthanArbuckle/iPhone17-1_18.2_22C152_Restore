@interface PHASEMutedSpeechActivityInfo
- (BOOL)speechActivityHardValue;
- (void)setSpeechActivityHardValue:(BOOL)a3;
@end

@implementation PHASEMutedSpeechActivityInfo

- (BOOL)speechActivityHardValue
{
  return self->_speechActivityHardValue;
}

- (void)setSpeechActivityHardValue:(BOOL)a3
{
  self->_speechActivityHardValue = a3;
}

@end