@interface VCSessionParticipantAudioStreamConfig
- (VCAudioRuleCollection)audioRules;
- (VCAudioRuleCollection)audioRulesNegotiated;
- (void)dealloc;
- (void)setAudioRules:(id)a3;
- (void)setAudioRulesNegotiated:(id)a3;
@end

@implementation VCSessionParticipantAudioStreamConfig

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantAudioStreamConfig;
  [(VCAudioStreamConfig *)&v3 dealloc];
}

- (VCAudioRuleCollection)audioRulesNegotiated
{
  return self->_audioRulesNegotiated;
}

- (void)setAudioRulesNegotiated:(id)a3
{
}

- (VCAudioRuleCollection)audioRules
{
  return self->_audioRules;
}

- (void)setAudioRules:(id)a3
{
}

@end