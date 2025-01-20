@interface LiveSpeechSettingsModelController
- (LiveSpeechSettingsModelController)init;
- (id)correctedLanguageCodeFor:(id)a3;
- (id)selectedVoiceKey;
- (id)speechSourceKey;
- (id)voiceIdentifierForLiveSpeechKeyboardID:(id)a3;
- (void)readSelectedVoiceMap;
- (void)updateSelectedVoice;
- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5;
@end

@implementation LiveSpeechSettingsModelController

- (LiveSpeechSettingsModelController)init
{
  v5.receiver = self;
  v5.super_class = (Class)LiveSpeechSettingsModelController;
  v2 = [(AXBridgeSpeechSettingsModelController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(LiveSpeechSettingsModelController *)v2 readSelectedVoiceMap];
  }
  return v3;
}

- (id)speechSourceKey
{
  return (id)*MEMORY[0x263F212D0];
}

- (id)selectedVoiceKey
{
  return (id)*MEMORY[0x263F22A68];
}

- (void)updateSelectedVoice
{
  v3 = self->_cachedSelectedVoiceMap;
  [(LiveSpeechSettingsModelController *)self readSelectedVoiceMap];
  char v4 = [(NSMutableDictionary *)self->_cachedSelectedVoiceMap isEqualToDictionary:v3];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [(AXSpeechSettingsModelController *)self selectedVoiceDidUpdateCallback];

    if (v5)
    {
      v6 = [(AXSpeechSettingsModelController *)self selectedVoiceDidUpdateCallback];
      v6[2]();
    }
  }
}

- (void)updateSelectedVoiceIdentifier:(id)a3 forSpeechSourceKey:(id)a4 languageCode:(id)a5
{
  id v7 = a3;
  id v10 = [(LiveSpeechSettingsModelController *)self correctedLanguageCodeFor:a5];
  [(LiveSpeechSettingsModelController *)self readSelectedVoiceMap];
  [(NSMutableDictionary *)self->_cachedSelectedVoiceMap setObject:v7 forKeyedSubscript:v10];

  cachedSelectedVoiceMap = self->_cachedSelectedVoiceMap;
  v9 = [(LiveSpeechSettingsModelController *)self selectedVoiceKey];
  +[AccessibilityBridgeBaseController setGizmoAccessibilityPref:cachedSelectedVoiceMap forKey:v9];
}

- (id)voiceIdentifierForLiveSpeechKeyboardID:(id)a3
{
  char v4 = [(LiveSpeechSettingsModelController *)self correctedLanguageCodeFor:a3];
  [(LiveSpeechSettingsModelController *)self readSelectedVoiceMap];
  objc_super v5 = [(NSMutableDictionary *)self->_cachedSelectedVoiceMap objectForKeyedSubscript:v4];

  return v5;
}

- (void)readSelectedVoiceMap
{
  v3 = +[AccessibilityBridgeBaseController accessibilityDomainAccessor];
  char v4 = [(LiveSpeechSettingsModelController *)self selectedVoiceKey];
  objc_super v5 = [v3 dictionaryForKey:v4];
  v6 = (NSMutableDictionary *)[v5 mutableCopy];
  cachedSelectedVoiceMap = self->_cachedSelectedVoiceMap;
  self->_cachedSelectedVoiceMap = v6;

  if (!self->_cachedSelectedVoiceMap)
  {
    self->_cachedSelectedVoiceMap = (NSMutableDictionary *)objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (id)correctedLanguageCodeFor:(id)a3
{
  id v3 = a3;
  char v4 = [MEMORY[0x263F228D0] sharedInstance];
  objc_super v5 = [v4 dialectForSystemLanguage];
  v6 = [v5 langMap];

  if (!v3)
  {
    id v7 = [v6 generalLanguageID];
    MEMORY[0x24C53F430]();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end