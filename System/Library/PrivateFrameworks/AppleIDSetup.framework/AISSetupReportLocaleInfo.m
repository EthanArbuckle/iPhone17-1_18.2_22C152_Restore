@interface AISSetupReportLocaleInfo
- (NSArray)keyboards;
- (NSArray)languages;
- (NSString)localeID;
- (NSString)preferredLanguage;
- (void)setKeyboards:(id)a3;
- (void)setLanguages:(id)a3;
- (void)setLocaleID:(id)a3;
@end

@implementation AISSetupReportLocaleInfo

- (NSString)preferredLanguage
{
  return (NSString *)[(NSArray *)self->_languages firstObject];
}

- (NSString)localeID
{
  return self->_localeID;
}

- (void)setLocaleID:(id)a3
{
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (NSArray)keyboards
{
  return self->_keyboards;
}

- (void)setKeyboards:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_localeID, 0);
}

@end