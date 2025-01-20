@interface AssistantVoiceControllerVoiceSettings
+ (id)settingsWithInProgressVoice:(id)a3 currentVoice:(id)a4;
- (AFVoiceInfo)currentVoice;
- (AFVoiceInfo)inProgressVoice;
- (void)setCurrentVoice:(id)a3;
- (void)setInProgressVoice:(id)a3;
@end

@implementation AssistantVoiceControllerVoiceSettings

+ (id)settingsWithInProgressVoice:(id)a3 currentVoice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setInProgressVoice:v6];

  [v7 setCurrentVoice:v5];

  return v7;
}

- (AFVoiceInfo)inProgressVoice
{
  return self->_inProgressVoice;
}

- (void)setInProgressVoice:(id)a3
{
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVoice, 0);

  objc_storeStrong((id *)&self->_inProgressVoice, 0);
}

@end