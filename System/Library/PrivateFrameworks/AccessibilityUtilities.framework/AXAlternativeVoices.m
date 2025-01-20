@interface AXAlternativeVoices
+ (id)sharedInstance;
- (BOOL)isNeuralSiriVoiceIdentifier:(id)a3;
- (BOOL)isOldSiriVoiceIdentifier:(id)a3;
- (BOOL)isSiriVoiceIdentifier:(id)a3;
- (id)nameForVoiceIdentifier:(id)a3;
@end

@implementation AXAlternativeVoices

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_37);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __37__AXAlternativeVoices_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXAlternativeVoices);
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)isOldSiriVoiceIdentifier:(id)a3
{
  return [MEMORY[0x1E4FAF288] isOldSiriVoiceIdentifier:a3];
}

- (BOOL)isSiriVoiceIdentifier:(id)a3
{
  return [MEMORY[0x1E4FAF288] isSiriVoiceIdentifier:a3];
}

- (BOOL)isNeuralSiriVoiceIdentifier:(id)a3
{
  return [MEMORY[0x1E4FAF288] isNeuralSiriVoiceIdentifier:a3];
}

- (id)nameForVoiceIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4FAF288] nameForVoiceIdentifier:a3];
}

@end