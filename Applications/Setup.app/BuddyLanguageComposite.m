@interface BuddyLanguageComposite
- (BOOL)showLocalizedLanguageName;
- (NSArray)languageCodes;
- (NSDictionary)languageStrings;
- (void)setLanguageCodes:(id)a3;
- (void)setLanguageStrings:(id)a3;
- (void)setShowLocalizedLanguageName:(BOOL)a3;
@end

@implementation BuddyLanguageComposite

- (NSDictionary)languageStrings
{
  return self->_languageStrings;
}

- (void)setLanguageStrings:(id)a3
{
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (void)setLanguageCodes:(id)a3
{
}

- (BOOL)showLocalizedLanguageName
{
  return self->_showLocalizedLanguageName;
}

- (void)setShowLocalizedLanguageName:(BOOL)a3
{
  self->_showLocalizedLanguageName = a3;
}

- (void).cxx_destruct
{
}

@end