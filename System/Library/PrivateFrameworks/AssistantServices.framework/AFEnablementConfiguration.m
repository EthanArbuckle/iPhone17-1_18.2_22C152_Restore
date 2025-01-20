@interface AFEnablementConfiguration
- (AFEnablementConfiguration)initWithRequiresVoiceSelection:(BOOL)a3 voiceSelectionAllowsChooseForMe:(BOOL)a4 voiceCountForRecognitionLanguage:(id)a5 completionLoggingBlock:(id)a6;
- (BOOL)requiresVoiceSelection;
- (BOOL)requiresVoiceSelectionForRecognitionLanguage:(id)a3;
- (BOOL)voiceSelectionAllowsRandomSelection;
- (NSDictionary)voiceCountForRecognitionLanguage;
- (id)completionLoggingBlock;
@end

@implementation AFEnablementConfiguration

- (void).cxx_destruct
{
}

- (NSDictionary)voiceCountForRecognitionLanguage
{
  return self->_voiceCountForRecognitionLanguage;
}

- (BOOL)requiresVoiceSelection
{
  return self->_requiresVoiceSelection;
}

- (id)completionLoggingBlock
{
  return self->_completionLoggingBlock;
}

- (BOOL)voiceSelectionAllowsRandomSelection
{
  return self->_voiceSelectionAllowsRandomSelection;
}

- (BOOL)requiresVoiceSelectionForRecognitionLanguage:(id)a3
{
  id v4 = a3;
  if (v4 && self->_requiresVoiceSelection)
  {
    v5 = [(NSDictionary *)self->_voiceCountForRecognitionLanguage objectForKey:v4];
    BOOL v6 = (int)[v5 intValue] > 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (AFEnablementConfiguration)initWithRequiresVoiceSelection:(BOOL)a3 voiceSelectionAllowsChooseForMe:(BOOL)a4 voiceCountForRecognitionLanguage:(id)a5 completionLoggingBlock:(id)a6
{
  v10 = (NSDictionary *)a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AFEnablementConfiguration;
  v12 = [(AFEnablementConfiguration *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_requiresVoiceSelection = a3;
    v12->_voiceSelectionAllowsRandomSelection = a4;
    uint64_t v14 = MEMORY[0x19F3A50D0](v11);
    id completionLoggingBlock = v13->_completionLoggingBlock;
    v13->_id completionLoggingBlock = (id)v14;

    v13->_voiceCountForRecognitionLanguage = v10;
  }

  return v13;
}

@end