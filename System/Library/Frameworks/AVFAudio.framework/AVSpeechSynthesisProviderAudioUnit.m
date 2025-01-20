@interface AVSpeechSynthesisProviderAudioUnit
+ (void)initialize;
- (AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock;
- (NSArray)speechVoices;
- (void)setSpeechSynthesisOutputMetadataBlock:(AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock;
- (void)setSpeechVoices:(NSArray *)speechVoices;
@end

@implementation AVSpeechSynthesisProviderAudioUnit

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_speechSynthesisOutputMetadataBlock, 0);

  objc_storeStrong((id *)&self->_speechVoices, 0);
}

- (void)setSpeechSynthesisOutputMetadataBlock:(AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock
{
}

- (AVSpeechSynthesisProviderOutputBlock)speechSynthesisOutputMetadataBlock
{
  return self->_speechSynthesisOutputMetadataBlock;
}

- (void)setSpeechVoices:(NSArray *)speechVoices
{
}

- (NSArray)speechVoices
{
  return self->_speechVoices;
}

@end