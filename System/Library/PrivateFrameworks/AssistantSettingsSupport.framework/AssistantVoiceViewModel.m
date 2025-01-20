@interface AssistantVoiceViewModel
- (AFVoiceInfo)currentVoice;
- (AFVoiceInfo)inProgressVoice;
- (BOOL)shouldShowVoiceVariationGroup;
- (BOOL)spinningOnLanguage;
- (NSSet)languageOptions;
- (NSString)languageGroupFooterText;
- (NSString)selectedLanguage;
- (NSString)selectedLanguageBaseLocale;
- (NSString)voiceVariationGroupFooterText;
- (NSString)voiceVariationToCheckMark;
- (NSString)voiceVariationToSpin;
- (void)setCurrentVoice:(id)a3;
- (void)setInProgressVoice:(id)a3;
- (void)setLanguageGroupFooterText:(id)a3;
- (void)setLanguageOptions:(id)a3;
- (void)setSelectedLanguage:(id)a3;
- (void)setSelectedLanguageBaseLocale:(id)a3;
- (void)setShouldShowVoiceVariationGroup:(BOOL)a3;
- (void)setSpinningOnLanguage:(BOOL)a3;
- (void)setVoiceVariationGroupFooterText:(id)a3;
- (void)setVoiceVariationToCheckMark:(id)a3;
- (void)setVoiceVariationToSpin:(id)a3;
@end

@implementation AssistantVoiceViewModel

- (BOOL)spinningOnLanguage
{
  return self->_spinningOnLanguage;
}

- (void)setSpinningOnLanguage:(BOOL)a3
{
  self->_spinningOnLanguage = a3;
}

- (NSSet)languageOptions
{
  return self->_languageOptions;
}

- (void)setLanguageOptions:(id)a3
{
}

- (NSString)selectedLanguage
{
  return self->_selectedLanguage;
}

- (void)setSelectedLanguage:(id)a3
{
}

- (NSString)selectedLanguageBaseLocale
{
  return self->_selectedLanguageBaseLocale;
}

- (void)setSelectedLanguageBaseLocale:(id)a3
{
}

- (NSString)languageGroupFooterText
{
  return self->_languageGroupFooterText;
}

- (void)setLanguageGroupFooterText:(id)a3
{
}

- (NSString)voiceVariationToSpin
{
  return self->_voiceVariationToSpin;
}

- (void)setVoiceVariationToSpin:(id)a3
{
}

- (NSString)voiceVariationToCheckMark
{
  return self->_voiceVariationToCheckMark;
}

- (void)setVoiceVariationToCheckMark:(id)a3
{
}

- (BOOL)shouldShowVoiceVariationGroup
{
  return self->_shouldShowVoiceVariationGroup;
}

- (void)setShouldShowVoiceVariationGroup:(BOOL)a3
{
  self->_shouldShowVoiceVariationGroup = a3;
}

- (NSString)voiceVariationGroupFooterText
{
  return self->_voiceVariationGroupFooterText;
}

- (void)setVoiceVariationGroupFooterText:(id)a3
{
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
  objc_storeStrong((id *)&self->_voiceVariationGroupFooterText, 0);
  objc_storeStrong((id *)&self->_voiceVariationToCheckMark, 0);
  objc_storeStrong((id *)&self->_voiceVariationToSpin, 0);
  objc_storeStrong((id *)&self->_languageGroupFooterText, 0);
  objc_storeStrong((id *)&self->_selectedLanguageBaseLocale, 0);
  objc_storeStrong((id *)&self->_selectedLanguage, 0);

  objc_storeStrong((id *)&self->_languageOptions, 0);
}

@end