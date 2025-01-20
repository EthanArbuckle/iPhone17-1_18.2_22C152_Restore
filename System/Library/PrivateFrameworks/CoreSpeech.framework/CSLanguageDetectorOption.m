@interface CSLanguageDetectorOption
- (BOOL)wasLanguageToggled;
- (NSArray)conversationalMessages;
- (NSArray)multilingualKeyboardLanguages;
- (NSDictionary)dictationLanguagePriors;
- (NSDictionary)keyboardConvoLanguagePriors;
- (NSDictionary)keyboardGlobalLanguagePriors;
- (NSSet)dictationLanguages;
- (NSString)currentKeyboard;
- (NSString)globalLastKeyboardUsed;
- (NSString)previousMessageLanguage;
- (float)samplingRate;
- (id)languageDetectorRequestContext;
- (void)setConversationalMessages:(id)a3;
- (void)setCurrentKeyboard:(id)a3;
- (void)setDictationLanguagePriors:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setGlobalLastKeyboardUsed:(id)a3;
- (void)setKeyboardConvoLanguagePriors:(id)a3;
- (void)setKeyboardGlobalLanguagePriors:(id)a3;
- (void)setMultilingualKeyboardLanguages:(id)a3;
- (void)setPreviousMessageLanguage:(id)a3;
- (void)setSamplingRate:(float)a3;
- (void)setWasLanguageToggled:(BOOL)a3;
@end

@implementation CSLanguageDetectorOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationalMessages, 0);
  objc_storeStrong((id *)&self->_dictationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_globalLastKeyboardUsed, 0);
  objc_storeStrong((id *)&self->_previousMessageLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConvoLanguagePriors, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_currentKeyboard, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
}

- (void)setConversationalMessages:(id)a3
{
}

- (NSArray)conversationalMessages
{
  return self->_conversationalMessages;
}

- (void)setDictationLanguagePriors:(id)a3
{
}

- (NSDictionary)dictationLanguagePriors
{
  return self->_dictationLanguagePriors;
}

- (void)setGlobalLastKeyboardUsed:(id)a3
{
}

- (NSString)globalLastKeyboardUsed
{
  return self->_globalLastKeyboardUsed;
}

- (void)setPreviousMessageLanguage:(id)a3
{
}

- (NSString)previousMessageLanguage
{
  return self->_previousMessageLanguage;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (void)setKeyboardConvoLanguagePriors:(id)a3
{
}

- (NSDictionary)keyboardConvoLanguagePriors
{
  return self->_keyboardConvoLanguagePriors;
}

- (void)setMultilingualKeyboardLanguages:(id)a3
{
}

- (NSArray)multilingualKeyboardLanguages
{
  return self->_multilingualKeyboardLanguages;
}

- (void)setWasLanguageToggled:(BOOL)a3
{
  self->_wasLanguageToggled = a3;
}

- (BOOL)wasLanguageToggled
{
  return self->_wasLanguageToggled;
}

- (void)setCurrentKeyboard:(id)a3
{
}

- (NSString)currentKeyboard
{
  return self->_currentKeyboard;
}

- (void)setDictationLanguages:(id)a3
{
}

- (NSSet)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setSamplingRate:(float)a3
{
  self->_samplingRate = a3;
}

- (float)samplingRate
{
  return self->_samplingRate;
}

- (id)languageDetectorRequestContext
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F60FE0]);
  v4 = [(CSLanguageDetectorOption *)self dictationLanguages];
  [v3 setDictationLanguages:v4];

  v5 = [(CSLanguageDetectorOption *)self currentKeyboard];
  [v3 setCurrentDictationLanguage:v5];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CSLanguageDetectorOption wasLanguageToggled](self, "wasLanguageToggled"));
  [v3 setWasLanguageToggled:v6];

  v7 = [(CSLanguageDetectorOption *)self multilingualKeyboardLanguages];
  [v3 setMultilingualKeyboardLanguages:v7];

  v8 = [(CSLanguageDetectorOption *)self keyboardConvoLanguagePriors];
  [v3 setKeyboardConvoLanguagePriors:v8];

  v9 = [(CSLanguageDetectorOption *)self keyboardGlobalLanguagePriors];
  [v3 setKeyboardGlobalLanguagePriors:v9];

  v10 = [(CSLanguageDetectorOption *)self previousMessageLanguage];
  [v3 setPreviousMessageLanguage:v10];

  v11 = [(CSLanguageDetectorOption *)self globalLastKeyboardUsed];
  [v3 setGlobalLastKeyboardUsed:v11];

  v12 = [(CSLanguageDetectorOption *)self dictationLanguagePriors];
  [v3 setDictationLanguagePriors:v12];

  v13 = [(CSLanguageDetectorOption *)self conversationalMessages];
  [v3 setRecentMessages:v13];

  return v3;
}

@end