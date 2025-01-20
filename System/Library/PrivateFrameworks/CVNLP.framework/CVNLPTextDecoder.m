@interface CVNLPTextDecoder
- (CVNLPLanguageResourceBundle)languageResourceBundle;
- (CVNLPTextDecoder)initWithLanguageResourceBundle:(id)a3;
@end

@implementation CVNLPTextDecoder

- (CVNLPTextDecoder)initWithLanguageResourceBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CVNLPTextDecoder;
  v6 = [(CVNLPTextDecoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_languageResourceBundle, a3);
  }

  return v7;
}

- (CVNLPLanguageResourceBundle)languageResourceBundle
{
  return self->_languageResourceBundle;
}

- (void).cxx_destruct
{
}

@end