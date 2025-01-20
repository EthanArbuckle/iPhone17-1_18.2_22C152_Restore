@interface SFLocaleAlternative
- (NSLocale)locale;
- (SFLocaleAlternative)initWithLocale:(id)a3 confidence:(double)a4;
- (double)confidence;
@end

@implementation SFLocaleAlternative

- (void).cxx_destruct
{
}

- (double)confidence
{
  return self->_confidence;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (SFLocaleAlternative)initWithLocale:(id)a3 confidence:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFLocaleAlternative;
  v8 = [(SFLocaleAlternative *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_confidence = a4;
  }

  return v9;
}

@end