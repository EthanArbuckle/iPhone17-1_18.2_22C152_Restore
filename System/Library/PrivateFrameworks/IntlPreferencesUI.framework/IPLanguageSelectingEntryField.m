@interface IPLanguageSelectingEntryField
- (NSString)language;
- (id)_additionalTextInputLocales;
- (id)textInputMode;
- (void)setLanguage:(id)a3;
@end

@implementation IPLanguageSelectingEntryField

- (void)setLanguage:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToString:@"no"]) {
    v4 = @"nb";
  }
  else {
    v4 = (__CFString *)v6;
  }
  language = self->_language;
  self->_language = &v4->isa;
}

- (id)_additionalTextInputLocales
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF960];
  v3 = [(IPLanguageSelectingEntryField *)self language];
  v4 = [v2 localeWithLocaleIdentifier:v3];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)textInputMode
{
  v3 = [MEMORY[0x263F1C748] sharedInputModeController];
  v4 = [(IPLanguageSelectingEntryField *)self language];
  v5 = [v3 inputModeLastUsedForLanguage:v4];

  return v5;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
}

@end