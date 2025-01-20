@interface VoiceOverSpeechSettingsModelController
- (VoiceOverSpeechSettingsModelController)init;
- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3 languageCode:(id)a4;
- (id)selectedVoiceKey;
- (id)speechSourceKey;
- (void)updateSelectedVoice;
- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5;
@end

@implementation VoiceOverSpeechSettingsModelController

- (VoiceOverSpeechSettingsModelController)init
{
  v8.receiver = self;
  v8.super_class = (Class)VoiceOverSpeechSettingsModelController;
  v2 = [(AXBridgeSpeechSettingsModelController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(VoiceOverSpeechSettingsModelController *)v2 speechSourceKey];
    uint64_t v5 = [(AXBridgeSpeechSettingsModelController *)v3 selectedVoiceIdentifierForSpeechSourceKey:v4];
    cachedSelectedVoiceId = v3->_cachedSelectedVoiceId;
    v3->_cachedSelectedVoiceId = (NSString *)v5;
  }
  return v3;
}

- (id)speechSourceKey
{
  return (id)*MEMORY[0x263F212E8];
}

- (id)selectedVoiceKey
{
  return (id)*MEMORY[0x263F22B28];
}

- (void)updateSelectedVoice
{
  v3 = self->_cachedSelectedVoiceId;
  uint64_t v4 = [(VoiceOverSpeechSettingsModelController *)self speechSourceKey];
  id v7 = [(AXBridgeSpeechSettingsModelController *)self selectedVoiceIdentifierForSpeechSourceKey:v4];

  LOBYTE(v4) = [(NSString *)v3 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(AXSpeechSettingsModelController *)self selectedVoiceDidUpdateCallback];

    if (v5)
    {
      v6 = [(AXSpeechSettingsModelController *)self selectedVoiceDidUpdateCallback];
      v6[2]();
    }
  }
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5
{
  v6 = (NSString *)a3;
  id v7 = [(VoiceOverSpeechSettingsModelController *)self selectedVoiceKey];
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:v6 forKey:v7];

  cachedSelectedVoiceId = self->_cachedSelectedVoiceId;
  self->_cachedSelectedVoiceId = v6;
}

- (id)selectedVoiceIdentifierForSpeechSourceKey:(id)a3 languageCode:(id)a4
{
  uint64_t v5 = +[AccessibilityBridgeBaseController accessibilityDomainAccessor];
  v6 = [(VoiceOverSpeechSettingsModelController *)self selectedVoiceKey];
  id v7 = [v5 stringForKey:v6];
  cachedSelectedVoiceId = self->_cachedSelectedVoiceId;
  self->_cachedSelectedVoiceId = v7;

  v9 = self->_cachedSelectedVoiceId;

  return v9;
}

- (void).cxx_destruct
{
}

@end